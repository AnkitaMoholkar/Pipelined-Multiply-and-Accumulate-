`timescale 1ns / 1ps
module addition_normaliser(in_e, in_m, out_e, out_m);
input [4:0] in_e;
input [11:0] in_m;
output [4:0] out_e;
output [11:0] out_m;
wire [4:0] in_e;
wire [11:0] in_m;
reg [4:0] out_e;
reg [11:0] out_m;
always @ ( * ) begin
if (in_m[10:3] == 8'b00000001) begin
out_e = in_e - 7;
out_m = in_m << 7;
end else if (in_m[10:4] == 7'b0000001) begin
out_e = in_e - 6;
out_m = in_m << 6;
end else if (in_m[10:5] == 6'b000001) begin
out_e = in_e - 5;
out_m = in_m << 5;
end else if (in_m[10:6] == 5'b00001) begin
out_e = in_e - 4;
out_m = in_m << 4;
end else if (in_m[10:7] == 4'b0001) begin
out_e = in_e - 3;
out_m = in_m << 3;
end else if (in_m[10:8] == 3'b001) begin
out_e = in_e - 2;
out_m = in_m << 2;
end else if (in_m[10:9] == 2'b01) begin
out_e = in_e - 1;
out_m = in_m << 1;
end
end
endmodule
