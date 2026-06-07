`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2026 01:19:15 PM
// Design Name: 
// Module Name: PriorityEncoder
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


module PriorityEncoder(
    input I0,
    input I1,
    input I2,
    input I3,
    output A,
    output B
    );
    assign A = I2 | I3;
    assign B = I3|(I1&~I2);
endmodule
