`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2026 02:41:40 PM
// Design Name: 
// Module Name: DFF_tb
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


module DFF_tb();
    reg clk;
    reg reset;
    reg d;
    wire q;
    DFF dut(clk,reset,d,q);
    always begin
        #5 clk = ~clk;
    end
    initial begin
        clk = 0;
        reset = 1;
        d = 0;
        #20 reset = 0;
                #10 d = 1;
                #20 d = 0;
                #10 d = 1;
                #50;
    $stop;
    end
endmodule
