`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2026 04:35:58 PM
// Design Name: 
// Module Name: Comparators
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


module Comparators(
    input a,
    input b,
    output c,
    output d,
    output e
    );
    assign c = a&~b;
    assign d = ~(a^b);
    assign e = ~a&b;
endmodule
