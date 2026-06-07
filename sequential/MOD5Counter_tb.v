`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2026 01:14:08 PM
// Design Name: 
// Module Name: MOD5Counter_tb
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


module MOD5Counter_tb();
reg clk;
reg reset;
wire [2:0] count;
MOD5Counter dut(clk,reset,count);
always #5 clk = ~clk;   // clock generation
initial
begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #100 
    $finish;
end

initial
begin
    $monitor("Time=%0t Count=%b", $time, count);
end
endmodule
