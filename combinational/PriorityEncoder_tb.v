`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2026 01:26:14 PM
// Design Name: 
// Module Name: PriorityEncoder_tb
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


module PriorityEncoder_tb();
    reg I0,I1,I2,I3;
    wire A,B;
    PriorityEncoder PE(I0,I1,I2,I3,A,B);
    initial begin
    I0=0;I1=0;I2=0;I3=0; #10
    I0=1;I1=0;I2=0;I3=0; #10
    I0=0;I1=1;I2=0;I3=0; #10
    I0=0;I1=0;I2=1;I3=0; #10
    I0=0;I1=0;I2=0;I3=1; #10
    $stop;
    end
endmodule
