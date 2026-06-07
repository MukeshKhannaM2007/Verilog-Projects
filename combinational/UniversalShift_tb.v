`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2026 01:16:12 PM
// Design Name: 
// Module Name: UniversalShift_tb
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


module UniversalShift_tb();

reg clk;
reg rst;
reg [1:0] sel;
reg [3:0] parallel_in;
reg shift_left_in;
reg shift_right_in;

wire [3:0] q;

    UniversalShift uut (
    .clk(clk),
    .rst(rst),
    .sel(sel),
    .parallel_in(parallel_in),
    .shift_left_in(shift_left_in),
    .shift_right_in(shift_right_in),
    .q(q)
);

initial
begin
    clk = 0;
end

always #5 clk = ~clk;

initial
begin
    rst = 1;
    sel = 2'b00;
    parallel_in = 4'b0000;
    shift_left_in = 1'b0;
    shift_right_in = 1'b0;

    #20;
    rst = 0;

    // Parallel Load
    #10;
    sel = 2'b11;
    parallel_in = 4'b1011;

    // Hold
    #10;
    sel = 2'b00;

    // Shift Right
    #10;
    sel = 2'b01;
    shift_right_in = 1'b1;

    #10;
    shift_right_in = 1'b0;

    // Shift Left
    #10;
    sel = 2'b10;
    shift_left_in = 1'b1;

    #10;
    shift_left_in = 1'b0;

    // Parallel Load again
    #10;
    sel = 2'b11;
    parallel_in = 4'b0101;

    // Hold
    #10;
    sel = 2'b00;

    #20;
    $finish;
end

endmodule