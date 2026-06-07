`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2026 01:45:06 PM
// Design Name: 
// Module Name: JKFF_tb
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


module JKFF_tb();
    reg clk,J,K;
    wire q;
    JKFF dut(clk,J,K,q);
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        J=0;K=0; #10
        J=0;K=1; #10
        J=1;K=0; #10
        J=1;K=1; #10
        $stop;
        end
endmodule
