module ALU(
  input [31:0] operand_a_alu,  // RS_1 
  input [31:0] operand_b_alu,  // RS_2
  input [3:0] operation_alu,
  output logic [31:0] result_alu
);

  always_comb begin
    case (operation_alu)
      4'b0000: // Addition
        begin
          result_alu = operand_a_alu + operand_b_alu;
        end

      4'b0110: // Subtraction
        begin
          result_alu = operand_a_alu - operand_b_alu;
        end

      4'b0001: // Logical AND
        begin
          result_alu = operand_a_alu & operand_b_alu;
        end

      4'b0010: // Logical OR
        begin
          result_alu = operand_a_alu | operand_b_alu;
        end

      4'b1011: // Logical XOR
        begin
          result_alu = operand_a_alu ^ operand_b_alu;
        end

        4'b0100: // Logical LEFT
        begin
          result_alu = operand_a_alu << operand_b_alu[4:0];
        end

        4'b1010: // Logical RIGHT
        begin
          result_alu = operand_a_alu >> operand_b_alu[4:0];
        end

        4'b1100: // Arithmetic RIGHT
        begin
          result_alu = $signed (operand_a_alu) >>> $signed (operand_b_alu[4:0]);
        end

        
        4'b1000: // slti
        begin
        if ($signed(operand_a_alu) < $signed(operand_b_alu))begin
          result_alu[31:1] = 0;
          result_alu[0] = 1;
          end
        else
        begin
          result_alu[0] = 0;
          result_alu[31:1] = 0;
          end
        end

        4'b0011: // sltiu
        begin
        if (operand_a_alu < operand_b_alu)
        begin
          result_alu[31:1] = 0;
          result_alu[0] = 1;
          end
        else
        begin
            result_alu[0] = 0;
            result_alu[31:1] = 0;
            end
        end

      default:
        begin
          result_alu = 32'b0;
        end
    endcase
  end

endmodule