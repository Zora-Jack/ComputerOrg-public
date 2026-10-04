`timescale 10 ns / 1 ns

`define DATA_WIDTH 32
`define SHIFTOP_L 2'b00
`define SHIFTOP_M_R 2'b11
`define SHIFTOP_LO_R 2'b10

module shifter (
	input  [`DATA_WIDTH - 1:0] A,
	input  [              4:0] B,
	input  [              1:0] Shiftop,
	output [`DATA_WIDTH - 1:0] Result
);
	// TODO: Please add your logic code here
	wire op_l = Shiftop == `SHIFTOP_L;
	wire op_m_r = Shiftop == `SHIFTOP_M_R;
	wire op_lo_r = Shiftop == `SHIFTOP_LO_R;
	wire [`DATA_WIDTH - 1:0] l_res = A<<B;
	wire [`DATA_WIDTH - 1:0] m_r_res = $signed(A)>>>B;
	wire [`DATA_WIDTH - 1:0] lo_r_res = A>>B;

	assign Result = 
		{32{op_l}} & l_res|
		{32{op_m_r}} & m_r_res|
		{32{op_lo_r}} & lo_r_res ;
endmodule
