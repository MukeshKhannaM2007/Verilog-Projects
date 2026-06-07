`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2026 02:27:44 PM
// Design Name: 
// Module Name: Full_Subtractor
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


module Full_Subtractor(
    input a,
    input b,
    input bin,
    output diff,
    output bout
    );
    assign diff = a^b^bin;
    assign bout = (~a&b)|(~(a^b)&bin);
endmodule
