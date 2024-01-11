`timescale 1ns/1ps

module top_tb;

  // Inputs
  logic rst;
  logic clk;

  // Instantiate the top module
  top dut_top (
    .rst(rst),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Testbench stimulus
  initial begin
    // Initialize inputs
    rst = 1;

    // Apply reset
    #10 rst = 0;

    // Wait for a few cycles
    #20;

    // Apply some clock cycles with changing rom_address
    #10;
    #10;
    #10;
    #10;
    #10;

    // Apply reset
    #10 rst = 1;

    // Wait for a few cycles
    #20;
   // Apply reset
   rst = 0;

    // End simulation
    
  end

endmodule
