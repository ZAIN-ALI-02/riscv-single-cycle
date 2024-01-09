module BRANCH_tb;

  reg [31:0] operand_a_branch;
  reg [31:0] operand_b_branch;
  reg [2:0] operation_branch;
  wire logic output_result_branch;

  // Instantiate the BRANCH module
  BRANCH uut (
    .operand_a_branch(operand_a_branch),
    .operand_b_branch(operand_b_branch),
    .operation_branch(operation_branch),
    .output_result_branch(output_result_branch)
  );

  // Testbench stimulus
  initial begin
    // Test case 1: Equal to
    operand_a_branch = 32'hABCDEFFF;
    operand_b_branch = 32'hABCDEFFF;
    operation_branch = 3'b000; // Equal to
    #10;
    $display("Test case 1: Equal to -> Output: %b", output_result_branch);

    // Test case 2: Not equal to
    operand_a_branch = 32'hABCDEFFF;
    operand_b_branch = 32'h12345678;
    operation_branch = 3'b001; // Not equal to
    #10;
    $display("Test case 2: Not equal to -> Output: %b", output_result_branch);

    // Test case 3: Less than signed
    operand_a_branch = 32'hABCDEF01;
    operand_b_branch = 32'h12345678;
    operation_branch = 3'b100; // Less than signed
    #10;
    $display("Test case 3: Less than signed -> Output: %b", output_result_branch);

    // Test case 4: Less than unsigned
    operand_a_branch = 32'hABCDEF01;
    operand_b_branch = 32'h12345678;
    operation_branch = 3'b110; // Less than unsigned
    #10;
    $display("Test case 4: Less than unsigned -> Output: %b", output_result_branch);

    // Test case 5: Greater than or equal to signed
    operand_a_branch = 32'hABCDEF01;
    operand_b_branch = 32'h12345678;
    operation_branch = 3'b101; // Greater than or equal to signed
    #10;
    $display("Test case 5: Greater than or equal to signed -> Output: %b", output_result_branch);

    // Test case 6: Greater than or equal to unsigned
    operand_a_branch = 32'hABCDEF01;
    operand_b_branch = 32'h12345678;
    operation_branch = 3'b111; // Greater than or equal to unsigned
    #10;
    $display("Test case 6: Greater than or equal to unsigned -> Output: %b", output_result_branch);

    // Test case 7: Default case
    operand_a_branch = 32'hABCDEF01;
    operand_b_branch = 32'h12345678;
    operation_branch = 3'b010; // Default case
    #10;
    $display("Test case 7: Default case -> Output: %b", output_result_branch);

    $stop;
  end

endmodule