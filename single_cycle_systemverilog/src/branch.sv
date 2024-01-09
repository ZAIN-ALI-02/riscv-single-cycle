module BRANCH(
  input [31:0] operand_a_branch,
  input [31:0] operand_b_branch,
  input [2:0] operation_branch,
  output logic output_result_branch
);

  always_comb begin
    case (operation_branch)
      3'b000: // Equal to
        output_result_branch = (operand_a_branch == operand_b_branch);

      3'b001: // Not equal to
        output_result_branch = (operand_a_branch != operand_b_branch);

      3'b100: // Less than signed
        output_result_branch = ($signed(operand_a_branch) < $signed(operand_b_branch));

      3'b110: // Less than unsigned
        output_result_branch = (operand_a_branch < operand_b_branch);

      3'b101: // Greater than or equal to signed
        output_result_branch = ($signed(operand_a_branch) >= $signed(operand_b_branch));

      3'b111: // Greater than or equal to unsigned
        output_result_branch = (operand_a_branch >= operand_b_branch);

      default:
        output_result_branch = 1'b0; // Default case (you may choose a different default behavior)
    endcase
  end

endmodule