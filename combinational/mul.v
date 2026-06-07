`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2026 02:49:13 PM
// Design Name: 
// Module Name: mul
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module HA(
input a,
input b,
output sum,
output carry
);
assign sum   = a ^ b;
assign carry = a & b;
endmodule

module FA(
input a,
input b,
input cin,
output sum,
output carry
);
assign sum   = a ^ b ^ cin;
assign carry = (a & b) | (b & cin) | (cin & a);
endmodule

module mul(
input [2:0]A,
input [2:0] B,
output [5:0] P
);
wire p00,p01,p02,p10,p11,p12,p20,p21,p22;
assign p00 = A[0] & B[0];
assign p01 = A[0] & B[1];
assign p02 = A[0] & B[2];
assign p10 = A[1] & B[0];
assign p11 = A[1] & B[1];
assign p12 = A[1] & B[2];
assign p20 = A[2] & B[0];
assign p21 = A[2] & B[1];
assign p22 = A[2] & B[2];
wire c1;
wire s2, c2, c3;
wire s3, c4, c5;
wire s4, c6;
assign P[0] = p00;
HA HA1(p10, p01, P[1], c1);
FA FA1(p20, p11, p02, s2, c2);
HA HA2(s2, c1, P[2], c3);
FA FA2(p21, p12, c2, s3, c4);
HA HA3(s3, c3, P[3], c5);
FA FA3(p22, c4, c5, P[4], c6);
assign P[5] = c6;
endmodule
