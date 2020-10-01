`timescale 1ns / 1ps
module MAC(
input clk,
input [15:0] A0_82,B0_82,A1_82,B1_82,A2_82,B2_82,A3_82,B3_82,A4_82,B4_82,A5_82,B5_82,A6_82,B6_82,A7_82,B7_82,A8_82,B8_82,A9_82,B9_82,A10_82,B10_82,A11_82,B11_82,
output [15:0] dot_product);
wire [15:0] O2_820,O2_821,O2_822,O2_823;
reg opcode;
wire [15:0]
O0_82,O1_82,O2_82,O3_82,O4_82,O5_82,O6_82,O7_82,O8_82,O9_82,O10_82,O11_82,O1_822,O1_823,O1_824,O1_825,O1_826,O1_827,O1_828,O1_829;
assign dot_product=O2_823;
fpu M0 (.clk(clk),.A(A0_82),.B(B0_82),.opcode(1),.O(O0_82)); //A0_82B0_82 0.1X0.27 DONE HERE
fpu M1 (.clk(clk),.A(A1_82),.B(B1_82),.opcode(1),.O(O1_82)); //A1_82B1_82
fpu M2 (.clk(clk),.A(A2_82),.B(B2_82),.opcode(1),.O(O2_82)); //A2_82B2_82
fpu M3 (.clk(clk),.A(A3_82),.B(B3_82),.opcode(1),.O(O3_82)); //A3_82B3_82
fpu M4 (.clk(clk),.A(A4_82),.B(B4_82),.opcode(1),.O(O4_82)); //A4_82B4_82
fpu M5 (.clk(clk),.A(A5_82),.B(B5_82),.opcode(1),.O(O5_82)); //A5_82B5_82
fpu M6 (.clk(clk),.A(A6_82),.B(B6_82),.opcode(1),.O(O6_82));
fpu M7 (.clk(clk),.A(A7_82),.B(B7_82),.opcode(1),.O(O7_82));
fpu M8 (.clk(clk),.A(A8_82),.B(B8_82),.opcode(1),.O(O8_82));
fpu M9 (.clk(clk),.A(A9_82),.B(B9_82),.opcode(1),.O(O9_82));
fpu M10(.clk(clk),.A(A10_82),.B(B10_82),.opcode(1),.O(O10_82));
fpu M11(.clk(clk),.A(A11_82),.B(B11_82),.opcode(1),.O(O11_82));
//accumulate
fpu AA0_82 (.clk(clk),.A(O0_82),.B(O1_82),.opcode(0),.O(O1_823)); //A0_82B0_82+A1_82B1_82
fpu AA1_82 (.clk(clk),.A(O1_823),.B(O2_82),.opcode(0),.O(O1_824)); //A0_82B0_82+A1_82B1_82+A2_82B2_82
fpu AA2_82 (.clk(clk),.A(O1_824),.B(O3_82),.opcode(0),.O(O1_825)); //A0_82B0_82+A1_82B1_82+A2_82B2_82+A3_82B3_82
fpu AA3_82 (.clk(clk),.A(O1_825),.B(O4_82),.opcode(0),.O(O1_826));
fpu AA4_82 (.clk(clk),.A(O1_826),.B(O5_82),.opcode(0),.O(O1_827));
fpu AA5_82 (.clk(clk),.A(O1_827),.B(O6_82),.opcode(0),.O(O1_828));
fpu AA6_82 (.clk(clk),.A(O1_828),.B(O7_82),.opcode(0),.O(O1_829));
fpu AA7_82 (.clk(clk),.A(O1_829),.B(O8_82),.opcode(0),.O(O2_820));
fpu AA8_82 (.clk(clk),.A(O2_820),.B(O9_82),.opcode(0),.O(O2_821));
fpu AA9_82 (.clk(clk),.A(O2_821),.B(O10_82),.opcode(0),.O(O2_822));
fpu AA10_82(.clk(clk),.A(O2_822),.B(O11_82),.opcode(0),.O(O2_823));
endmodule
