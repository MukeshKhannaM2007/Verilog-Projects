`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2026 05:07:31 PM
// Design Name: 
// Module Name: mul_tb
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


module mul_tb();
reg  [2:0] A, B;
wire [5:0] P;

integer i, j;

// Instantiate DUT
mul uut (A,B,P);

initial begin
    $display(" A  B  |  P ");
    $display("--------------");

    for (i = 0; i < 8; i = i + 1) begin
        for (j = 0; j < 8; j = j + 1) begin
            A = i;
            B = j;
            #5;
            $display("%0d  %0d  |  %0d", A, B, P);
        end
    end

    $stop;
end
endmodule