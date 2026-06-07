`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2026 01:27:11 PM
// Design Name: 
// Module Name: ShiftRegister_tb
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


`timescale 1ns / 1ps

// ============================================================
//  Testbench : ShiftRegister
//  Tests: reset, left-shift (LSB-in), checks all 4 stages
// ============================================================

module ShiftRegister_tb;

    reg  clk;
    reg  reset;
    reg  serial_in;
    wire [3:0] q;

    ShiftRegister uut (
        .clk       (clk),
        .reset     (reset),
        .serial_in (serial_in),
        .q         (q)
    );
    initial clk = 0;
    always #5 clk = ~clk;

    task apply_and_check;
        input       sin;
        input [3:0] expected_q;
        input [63:0] test_num;
        begin
            serial_in = sin;
            @(negedge clk);         
            if (q !== expected_q) begin
                $display("FAIL Test%0d | serial_in=%b | Got q=%b | Expected q=%b",
                          test_num, sin, q, expected_q);
            end else begin
                $display("PASS Test%0d | serial_in=%b | q=%b", test_num, sin, q);
            end
        end
    endtask

    initial begin
  
        $dumpfile("ShiftRegister_tb.vcd");
        $dumpvars(0, ShiftRegister_tb);

        reset     = 1;
        serial_in = 0;
        @(posedge clk); #1;
        if (q !== 4'b0000)
            $display("FAIL Reset | q=%b (expected 0000)", q);
        else
            $display("PASS Reset | q=%b", q);

        reset = 0;

        @(posedge clk); #1;
        apply_and_check(1, 4'b0001, 1);

        @(posedge clk); #1;
        apply_and_check(1, 4'b0011, 2);

        @(posedge clk); #1;
        apply_and_check(0, 4'b0110, 3);
        @(posedge clk); #1;
        apply_and_check(1, 4'b1101, 4);
        reset = 1;
        @(posedge clk); #1;
        if (q !== 4'b0000)
            $display("FAIL Mid-reset | q=%b (expected 0000)", q);
        else
            $display("PASS Mid-reset | q=%b", q);

        reset = 0;
        serial_in = 0;
        repeat(4) @(posedge clk);
        #1;
        if (q !== 4'b0000)
            $display("FAIL All-zero shift | q=%b", q);
        else
            $display("PASS All-zero shift | q=%b", q);
        serial_in = 1;
        repeat(4) @(posedge clk);
        #1;
        if (q !== 4'b1111)
            $display("FAIL All-one shift | q=%b", q);
        else
            $display("PASS All-one shift | q=%b", q);

        $display("\n--- Simulation complete ---");
        $finish;
    end

endmodule