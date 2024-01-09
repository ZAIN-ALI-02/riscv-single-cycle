`timescale 1ns/1ns

module ALU_tb;

initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, ALU_tb);
end

  logic [31:0] operand_a_alu;
  logic [31:0] operand_b_alu;
  logic [3:0] operation_alu;
  logic [31:0] result_alu;

  // Instantiate the ALU module
  ALU uut (
    .operand_a_alu(operand_a_alu),
    .operand_b_alu(operand_b_alu),
    .operation_alu(operation_alu),
    .result_alu(result_alu)
  );


  // Testbench stimulus
  initial begin
    // Test case 1: Addition
    operand_a_alu = 32'hABCDEFFF;
    operand_b_alu = 32'h12345678;
    operation_alu = 4'b0000; // Addition
    #10;

    // Test case 2: Subtraction
    operand_a_alu = 32'hABCDEF01;
    operand_b_alu = 32'h12345678;
    operation_alu = 4'b0110; // Subtraction
    #10;

    // Test case 3: Logical AND
    operand_a_alu = 32'hABCDEFFF;
    operand_b_alu = 32'h12345678;
    operation_alu = 4'b0001; // Logical AND
    #10;

    // Test case 4: Logical OR
    operand_a_alu = 32'hABCDEF01;
    operand_b_alu = 32'h12345678;
    operation_alu = 4'b0010; // Logical OR
    #10;

    // Test case 5: Logical XOR
    operand_a_alu = 32'hABCDEFFF;
    operand_b_alu = 32'h12345678;
    operation_alu = 4'b1011; // Logical XOR
    #10;

    // Test case 6: Logical LEFT
    operand_a_alu = 32'hABCDEFFF;
    operand_b_alu = 5'b01010; // Shifting by 10 bits
    operation_alu = 4'b0100; // Logical LEFT
    #10;

    // Test case 7: Logical RIGHT
    operand_a_alu = 32'hABCDEFFF;
    operand_b_alu = 5'b01010; // Shifting by 10 bits
    operation_alu = 4'b1010; // Logical RIGHT
    #10;

    // Test case 8: Arithmetic RIGHT
    operand_a_alu = 32'hABCDEFFF;
    operand_b_alu = 5'b01010; // Shifting by 10 bits
    operation_alu = 4'b1100; // Arithmetic RIGHT
    #10;

    // Test case 9: slti
    operand_a_alu = 32'h12345678;
    operand_b_alu = 32'hABCDEF01;
    operation_alu = 4'b1000; // slti
    #10;

    // Test case 10: sltiu
    operand_a_alu = 32'h12345678;
    operand_b_alu = 32'hABCDEF01;
    operation_alu = 4'b0011; // sltiu
    #10;
  end

endmodule
