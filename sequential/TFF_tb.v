`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2026 03:05:08 PM
// Design Name: 
// Module Name: TFF_tb
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


module TFF_tb();
    reg clk;
    reg t;
    wire q;
    TFF TF(clk,t,q);
    always #5 clk = ~clk;
    initial begin
        clk = 1;
        t=1; #10
        t=0; #10
        t=1; #10
        $stop;
        end 
endmodule
