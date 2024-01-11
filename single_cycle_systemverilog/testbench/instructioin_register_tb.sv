`timescale 1ns/1ps

module instruction_reg_tb;

  // Inputs
  reg logic rst;
  reg logic clk;
  reg logic [31:0] instruction_address;

  // Outputs
  wire logic [11:0] rom_address;
  wire logic [31:0] rom_address_32;

  // Instantiate the module
  instruction_reg dut (
    .rst(rst),
    .clk(clk),
    .instruction_address(instruction_address),
    .rom_address_32(rom_address_32),
    .rom_address(rom_address)
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
    instruction_address = 32'hABCDEFF0;

    // Apply reset
    #10 rst = 0;

    // Apply some instruction addresses
    #20 instruction_address = 32'h12345678;
    #20 instruction_address = 32'h87654321;
    #20 instruction_address = 32'hABCDEF01;

    // Reset after some cycles
    #50 rst = 1;

    // Wait for a few cycles
    #30;

    // Apply new instruction addresses
    #20 instruction_address = 32'h55555555;
    #20 instruction_address = 32'hAAAAAAAA;
    #20 instruction_address = 32'h12345678;

    // End simulation
    #50 $finish;
  end

endmodule
