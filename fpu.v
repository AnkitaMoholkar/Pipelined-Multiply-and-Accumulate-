`timescale 1ns / 1ps
module fpu(clk, A, B, opcode, O);
input clk;
input [15:0] A, B;
input opcode;
output [15:0] O;
wire [15:0] O;
wire [4:0] a_exponent;
wire [10:0] a_mantissa;
wire [4:0] b_exponent;
wire [10:0] b_mantissa;
reg o_sign;
reg [4:0] o_exponent;
reg [11:0] o_mantissa;
reg [15:0] adder_a_in;
reg [15:0] adder_b_in;
wire [15:0] adder_out;
reg [15:0] multiplier_a_in;
reg [15:0] multiplier_b_in;
wire [15:0] multiplier_out;
assign O[15] = o_sign;
assign O[14:10] = o_exponent;
assign O[9:0] = o_mantissa[9:0];
assign a_sign = A[15];
assign a_exponent[4:0] = A[14:10];
assign a_mantissa[10:0] = {1'b1,A[9:0]};
assign b_sign = B[15];
assign b_exponent[4:0] = B[14:10];
assign b_mantissa[10:0] = {1'b1, B[9:0]};
assign ADD = !opcode;
assign MUL = opcode;
adder A1
(
.a(adder_a_in),
.b(adder_b_in),
.out(adder_out)
);
multiplier M1
(
.a(multiplier_a_in),
.b(multiplier_b_in),
.out(multiplier_out)
);
always @ (*) begin
if (ADD) begin
//If a is NaN or b is zero return a
if ((a_exponent == 255 && a_mantissa != 0) || (b_exponent == 0) && (b_mantissa
== 0)) begin
o_sign = a_sign;
o_exponent = a_exponent;
o_mantissa = a_mantissa;
//If b is NaN or a is zero return b
end else if ((b_exponent == 255 && b_mantissa != 0) || (a_exponent == 0)
&& (a_mantissa == 0)) begin
o_sign = b_sign;
o_exponent = b_exponent;
o_mantissa = b_mantissa;
//if a or b is inf return inf
end else if ((a_exponent == 255) || (b_exponent == 255)) begin
o_sign = a_sign ^ b_sign;
o_exponent = 255;
o_mantissa = 0;
end else begin // Passed all corner cases
adder_a_in = A;
adder_b_in = B;
o_sign = adder_out[15];
o_exponent = adder_out[14:10];
o_mantissa = adder_out[9:0];
end
end
else begin //Multiplication
//If a is NaN return NaN
if (a_exponent == 255 && a_mantissa != 0) begin
o_sign = a_sign;
o_exponent = 255;
o_mantissa = a_mantissa;
//If b is NaN return NaN
end else if (b_exponent == 255 && b_mantissa != 0) begin
o_sign = b_sign;
o_exponent = 255;
o_mantissa = b_mantissa;
//If a or b is 0 return 0
end else if ((a_exponent == 0) && (a_mantissa == 0) || (b_exponent == 0)
&& (b_mantissa == 0)) begin
o_sign = a_sign ^ b_sign;
o_exponent = 0;
o_mantissa = 0;
//if a or b is inf return inf
end else if ((a_exponent == 255) || (b_exponent == 255)) begin
o_sign = a_sign;
o_exponent = 255;
o_mantissa = 0;
end else begin // Passed all corner cases
multiplier_a_in = A;
multiplier_b_in = B;
o_sign = multiplier_out[15];
o_exponent = multiplier_out[14:10];
o_mantissa = multiplier_out[9:0];
end
end
end
endmodule
