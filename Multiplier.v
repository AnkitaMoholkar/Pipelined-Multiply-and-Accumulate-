`timescale 1ns / 1ps
module multiplier(a, b, out);
input [15:0] a, b;
output [15:0] out;
wire [15:0] out;
reg a_sign;
reg [4:0] a_exponent;
reg [10:0] a_mantissa;
reg b_sign;
reg [4:0] b_exponent;//changed from7:0 to 4:0
reg [10:0] b_mantissa;
reg o_sign;
reg [4:0] o_exponent;
reg [11:0] o_mantissa;
reg [21:0] product;
assign out[15] = o_sign;
assign out[14:10] = o_exponent;
assign out[9:0] = o_mantissa[9:0];
reg [4:0] i_e;
reg [21:0] i_m;
wire [4:0] o_e;
wire [21:0] o_m;
multiplication_normaliser norm1(
.in_e(i_e),
.in_m(i_m),
.out_e(o_e),
.out_m(o_m)
);
always @ ( * ) begin
a_sign = a[15];
if(a[14:10] == 0) begin
a_exponent = 5'b00001;
a_mantissa = {1'b0, a[9:0]};
end else begin
a_exponent = a[14:10];
a_mantissa = {1'b1, a[9:0]};
end
b_sign = b[15];
if(b[14:10] == 0) begin
b_exponent = 5'b00001;
b_mantissa = {1'b0, b[9:0]};
end else begin
b_exponent = b[14:10];
b_mantissa = {1'b1, b[9:0]};
end
o_sign = a_sign ^ b_sign;
o_exponent = a_exponent + b_exponent - 15;
product = a_mantissa * b_mantissa;
// Normalization
if(product[21] == 1) begin
o_exponent = o_exponent + 1;
product = product >> 1;
end else if((product[20] != 1) && (o_exponent != 0)) begin
i_e = o_exponent;
i_m = product;
o_exponent = o_e;
product = o_m;
end
o_mantissa = product[20:10];
end
endmodule
