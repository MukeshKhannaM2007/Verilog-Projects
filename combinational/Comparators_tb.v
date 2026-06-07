`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2026 04:42:17 PM
// Design Name: 
// Module Name: Comparators_tb
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


module Comparators_tb();
    reg a,b;
    wire c,d,e;
    Comparators C(a,b,c,d,e);
    initial begin
    a=0;b=0; #10
    a=0;b=1; #10
    a=1;b=0; #10
    a=1;b=1; #10
    $stop;
    end
endmodule
