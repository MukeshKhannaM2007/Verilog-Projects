`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2026 08:03:46 PM
// Design Name: 
// Module Name: CLAA
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


module CLAA(
    input [3:0]A,
    input [3:0]B,
    input cin,
    output [3:0]sum,
    output cout   
    );
    wire [3:0]G,P;
    wire [4:0]C;
    assign G = A&B;
    assign P = A^B;
    assign C[0] = cin;
    assign C[1] = G[0]|(P[0]&C[0]);
    assign C[2] = G[1]|(P[1]&G[0])|(P[1]&P[0]&C[0]);
    assign C[3] = G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&C[0]);
    assign C[4] = G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&C[0]);
    assign sum = P^C[3:0];
    assign cout = C[4];
endmodule
