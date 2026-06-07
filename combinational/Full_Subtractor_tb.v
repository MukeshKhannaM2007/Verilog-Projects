`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2026 02:32:13 PM
// Design Name: 
// Module Name: Full_Subtractor_tb
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


module Full_Subtractor_tb();
    reg a,b,bin;
    wire diff,bout;
    Full_Subtractor FS(a,b,bin,diff,bout);
    initial begin
    a=0;b=0;bin=0; #10
    a=0;b=0;bin=1; #10
    a=0;b=1;bin=0; #10
    a=0;b=1;bin=1; #10
    a=1;b=0;bin=0; #10
    a=1;b=0;bin=1; #10
    a=1;b=1;bin=0; #10
    a=1;b=1;bin=1; #10
    $stop;
    end
endmodule
