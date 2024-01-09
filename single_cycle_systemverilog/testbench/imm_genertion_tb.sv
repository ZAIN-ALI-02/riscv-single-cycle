module SignedExtender_tb;

  logic [31:0] input_data;
  logic [31:0] PC;
  logic [31:0] output_extended_I_type;
  logic [31:0] output_extended_S_type;
  logic [31:0] output_extended_SB_type;
  logic [31:0] output_extended_U_type;
   logic [31:0] output_extended_UJ_type;

  // Instantiate the SignedExtender module
  SignedExtender uut (
    .Instruction(input_data),
    .PC(PC),
    .output_extended_I_type(output_extended_I_type),
    .output_extended_S_type(output_extended_S_type),
    .output_extended_SB_type(output_extended_SB_type),
    .output_extended_U_type(output_extended_U_type),
    .output_extended_UJ_type(output_extended_UJ_type)
  );



  // Testbench stimulus
  initial begin
    // Test case 1: Positive number (no sign extension needed)
    input_data = 32'b1000_0000_0000_0000_0000_0000_0000_0000;
    PC = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    #10;
//    $display("Test case 1: input_data = %h, output_extended = %h", input_data, output_extended);

    // Test case 2: Negative number (sign extension needed)
    input_data = 32'b1000_0000_0000_0000_0000_0000_0000_1111;
    #10;
 //   $display("Test case 2: input_data = %h, output_extended = %h", input_data, output_extended);

    // Test case 3: Zero (no sign extension needed)
    input_data = 32'b1010_0000_0000_0000_0000_0000_0000_0000;
    #10;
  //  $display("Test case 3: input_data = %h, output_extended = %h", input_data, output_extended);

    // Test case 4: Largest positive number (no sign extension needed)
    input_data = 32'b1000_1111_0000_0000_0000_0000_1000_0000;
    #10;
  //  $display("Test case 4: input_data = %h, output_extended = %h", input_data, output_extended);

    // Test case 5: Largest negative number (sign extension needed)
    input_data = 32'h80000000;
    #10;
 //   $display("Test case 5: input_data = %h, output_extended = %h", input_data, output_extended);
 
    // Test case 2: Negative number (sign extension needed)
    input_data = 32'b1000_1111_0000_0000_0000_0000_0000_1111;
    #10;
 //   $display("Test case 2: input_data = %h, output_extended = %h", input_data, output_extended);

    // Test case 3: Zero (no sign extension needed)
    input_data = 32'b1010_0000_0110_0000_0000_0000_0000_0000;
    #10;
  //  $display("Test case 3: input_data = %h, output_extended = %h", input_data, output_extended);

    // Test case 4: Largest positive number (no sign extension needed)
    input_data = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
    #10;
  //  $display("Test case 4: input_data = %h, output_extended = %h", input_data, output_extended);

  end

endmodule