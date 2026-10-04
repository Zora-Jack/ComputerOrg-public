#include "printf.h"
#include "trap.h"
#include "perf_cnt.h"
#include "mul.h"
#include "div.h"

#define FRAC_BIT 10

#define RD_ADDR 135106448
#define RD_SIZE_D0 1
#define RD_SIZE_D1 1
#define RD_SIZE_D2 28
#define RD_SIZE_D3 28

#define WEIGHT_ADDR 134217728
#define WEIGHT_SIZE_D0 20
#define WEIGHT_SIZE_D1 1
#define WEIGHT_SIZE_D2 5
#define WEIGHT_SIZE_D3 5

#define WR_ADDR 135108240
#define WR_SIZE_D0 1
#define WR_SIZE_D1 20
#define WR_SIZE_D2 12
#define WR_SIZE_D3 12

#define KERN_ATTR_CONV_PAD 0
#define KERN_ATTR_CONV_STRIDE 1
#define KERN_ATTR_POOL_PAD 0
#define KERN_ATTR_POOL_KERN_SIZE 2
#define KERN_ATTR_POOL_STRIDE 2

//MMIO register address of DNN accelerator
#define GPIO_START_ADDR    0x60030000
#define GPIO_DONE_ADDR     0x60030008

struct size_vec4
{
	unsigned d0;
	unsigned d1;
	unsigned d2;
	unsigned d3;
};

struct mem_addr
{
	unsigned rd_addr;
	unsigned weight_addr;
	unsigned wr_addr;
};

int mul(short a, short b)
{
#ifndef USE_MUL
	int ans = mul_ll(a, b);
#else
	int ans = a * b;
#endif
	return ans;
}

struct mem_addr addr = {RD_ADDR, WEIGHT_ADDR, WR_ADDR};
struct size_vec4 rd_size = {RD_SIZE_D0, RD_SIZE_D1, RD_SIZE_D2, RD_SIZE_D3};
struct size_vec4 wr_size = {WR_SIZE_D0, WR_SIZE_D1, WR_SIZE_D2, WR_SIZE_D3};
struct size_vec4 weight_size = {WEIGHT_SIZE_D0, WEIGHT_SIZE_D1, WEIGHT_SIZE_D2, WEIGHT_SIZE_D3};

struct size_vec4 conv_size;

extern char _binary_data_result_bin_start[];
extern char _binary_data_result_bin_size[];

static unsigned offset4(unsigned d0, unsigned d1, unsigned d2, unsigned d3,
			unsigned size_d1, unsigned size_d2, unsigned size_d3)
{
	unsigned offset = d0;

	offset = mul(offset, size_d1) + d1;
	offset = mul(offset, size_d2) + d2;
	offset = mul(offset, size_d3) + d3;

	return offset;
}

void convolution()
{
	short *in = (short *)addr.rd_addr;
	short *weight = (short *)addr.weight_addr;
	short *out = (short *)addr.wr_addr;

	unsigned output_offset = 0;
	unsigned input_offset = 0;

	unsigned input_fm_w = rd_size.d3;
	unsigned input_fm_h = rd_size.d2;

	unsigned pad = KERN_ATTR_CONV_PAD;
	unsigned pad_len = pad << 1;

	unsigned conv_out_w = rd_size.d3 - weight_size.d3 + pad_len;
	unsigned conv_out_h = rd_size.d2 - weight_size.d2 + pad_len;

	unsigned stride = KERN_ATTR_CONV_STRIDE;

	conv_out_w = div(conv_out_w, stride);
	conv_out_h = div(conv_out_h, stride);

	conv_out_w++;
	conv_out_h++;

	conv_size.d0 = wr_size.d0;
	conv_size.d1 = wr_size.d1;
	conv_size.d2 = conv_out_h;
	conv_size.d3 = conv_out_w;

	//TODO: Please add your implementation here
	unsigned weight_fm_size = mul(mul(weight_size.d1, weight_size.d2), weight_size.d3);
	unsigned weight_oc_size = weight_fm_size + 1;

	for (unsigned n = 0; n < conv_size.d0; n++)
	{
		for (unsigned oc = 0; oc < conv_size.d1; oc++)
		{
			short bias = weight[mul(oc, weight_oc_size)];

			for (unsigned oh = 0; oh < conv_size.d2; oh++)
			{
				for (unsigned ow = 0; ow < conv_size.d3; ow++)
				{
					int sum = 0;

					for (unsigned ic = 0; ic < weight_size.d1; ic++)
					{
						for (unsigned kh = 0; kh < weight_size.d2; kh++)
						{
							for (unsigned kw = 0; kw < weight_size.d3; kw++)
							{
								int ih = mul(oh, stride) + kh - pad;
								int iw = mul(ow, stride) + kw - pad;

								if (ih < 0 || ih >= (int)input_fm_h ||
								    iw < 0 || iw >= (int)input_fm_w)
								{
									continue;
								}

								input_offset = offset4(n, ic, ih, iw,
											 rd_size.d1, rd_size.d2, rd_size.d3);
								unsigned weight_offset = mul(oc, weight_oc_size) + 1 +
											 offset4(0, ic, kh, kw,
												 weight_size.d1,
												 weight_size.d2,
												 weight_size.d3);

								sum += mul(in[input_offset], weight[weight_offset]);
							}
						}
					}

					output_offset = offset4(n, oc, oh, ow,
								 conv_size.d1, conv_size.d2, conv_size.d3);
					out[output_offset] = (sum >> FRAC_BIT) + bias;
				}
			}
		}
	}
}

void pooling()
{
	short *out = (short *)addr.wr_addr;

	unsigned output_offset = 0;
	unsigned input_offset = 0;

	unsigned input_fm_w = conv_size.d3;
	unsigned input_fm_h = conv_size.d2;

	unsigned pad = KERN_ATTR_POOL_PAD;
	unsigned pad_len = pad << 1;

	unsigned pad_w_test = conv_size.d3 - KERN_ATTR_POOL_KERN_SIZE;
	unsigned pad_h_test = conv_size.d2 - KERN_ATTR_POOL_KERN_SIZE;

	unsigned pool_out_w = pad_w_test + pad_len;
	unsigned pool_out_h = pad_h_test + pad_len;

	unsigned stride = KERN_ATTR_POOL_STRIDE;

	unsigned pad_w_test_remain = pad_w_test - mul(div(pad_w_test, stride), stride);
	unsigned pad_h_test_remain = pad_h_test - mul(div(pad_h_test, stride), stride);

	pool_out_w = div(pool_out_w, stride);
	pool_out_h = div(pool_out_h, stride);
	pool_out_w++;
	pool_out_h++;

	if ((!pad) && (pad_w_test_remain || pad_h_test_remain))
	{
		pool_out_w++;
		pool_out_h++;
	}

	//TODO: Please add your implementation here
	for (unsigned n = 0; n < conv_size.d0; n++)
	{
		for (unsigned c = 0; c < conv_size.d1; c++)
		{
			for (unsigned oh = 0; oh < pool_out_h; oh++)
			{
				for (unsigned ow = 0; ow < pool_out_w; ow++)
				{
					short max_value = 0;
					int has_value = 0;

					for (unsigned kh = 0; kh < KERN_ATTR_POOL_KERN_SIZE; kh++)
					{
						for (unsigned kw = 0; kw < KERN_ATTR_POOL_KERN_SIZE; kw++)
						{
							int ih = mul(oh, stride) + kh - pad;
							int iw = mul(ow, stride) + kw - pad;

							if (ih < 0 || ih >= (int)input_fm_h ||
							    iw < 0 || iw >= (int)input_fm_w)
							{
								continue;
							}

							input_offset = offset4(n, c, ih, iw,
										 conv_size.d1,
										 conv_size.d2,
										 conv_size.d3);

							if (!has_value || out[input_offset] > max_value)
							{
								max_value = out[input_offset];
								has_value = 1;
							}
						}
					}

					output_offset = offset4(n, c, oh, ow,
								 conv_size.d1, pool_out_h, pool_out_w);
					out[output_offset] = max_value;
				}
			}
		}
	}

}

#ifdef USE_HW_ACCEL
void launch_hw_accel()
{
	volatile int* gpio_start = (void*)(GPIO_START_ADDR);
	volatile int* gpio_done = (void*)(GPIO_DONE_ADDR);

	//TODO: Please add your implementation here
	*gpio_start = 1;
	while ((*gpio_done & 0x1) == 0)
		;
	*gpio_start = 0;
}
#endif

int comparing()
{
	char *out = (char *)addr.wr_addr;
	char *result = (char *)_binary_data_result_bin_start;

#ifdef USE_HW_ACCEL
	int count = (int)_binary_data_result_bin_size + 
		    (16 - WR_SIZE_D3) * 2 * WR_SIZE_D2 * WR_SIZE_D1;

#else
	int count = (int)_binary_data_result_bin_size;
#endif

	for (int i = 0, j = 0; i < count; i++)
	{
#ifdef USE_HW_ACCEL
		int alignment = i & 0x0000001f;
		if (alignment >= (WR_SIZE_D3 << 1))
			continue;
#endif
		if (*(out + i) != *(result + j))
		{
			printf("Failed! at address %x and %x with data %x and %x\n", out + i, result + j, *(out + i), *(result + j));
			return 1;
		}
		j++;
	}

	printf("Passed!\n");
	return 0;
}

int main()
{
	Result res;
	res.msec = 0;

#ifdef USE_HW_ACCEL
	printf("Launching task...\n");
	bench_prepare(&res);
	launch_hw_accel();
	bench_done(&res);
#else
	printf("starting convolution and pooling\n");
	bench_prepare(&res);
	convolution();
	pooling();
	bench_done(&res);
#endif

	printf("total cycle %d\n", res.msec);

	int result = comparing();
	printf("benchmark finished\n");

	if (result == 0) {
		hit_good_trap();
	} else {
		nemu_assert(0);
	}

	return 0;
}
