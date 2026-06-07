`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2026 11:17:58 AM
// Design Name: 
// Module Name: FourbitAdder
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

module FourbitAdder(
    input [3:0]A,
    input [3:0]B,
    input cin,
    output [3:0]sum,
    output cout
);
wire c1,c2,c3;

f_a FA0(A[0],B[0],cin,sum[0],c1);
f_a FA1(A[1],B[1],c1,sum[1],c2);
f_a FA2(A[2],B[2],c2,sum[2],c3);
f_a FA3(A[3],B[3],c3,sum[3],cout);
endmodule

module f_a(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign {cout,sum} =a+b+cin; 
endmodule