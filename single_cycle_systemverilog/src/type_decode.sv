module InstructionDecoder (
  input  logic [6:0] instruction,
  output logic  R , I , I_load , I_jalr , S , SB , U_auipc , U_lui , UJ_jal
);

  always @(*) begin
    case (instruction)

      7'b0110011: R          = 1'b1;    // R_type Instruction 0
      7'b0010011: I          = 1'b1;    // I_type Instruction 1
      7'b0000011: I_load     = 1'b1;    // I(load)_type Instruction 2
      7'b1100111: I_jalr     = 1'b1;    // I(jalr)_type Instruction 3
      7'b0100011: S          = 1'b1;    // S_type Instruction 4
      7'b1100011: SB         = 1'b1;    // SB_type Instruction 5
      7'b0010111: U_auipc    = 1'b1;    // U(auipc)_type Instruction 6
      7'b0110111: U_lui      = 1'b1;    // U(lui)_type Instruction 7
      7'b1101111: UJ_jal     = 1'b1;    // UJ(jal)_type Instruction 8

      default:  begin
               R = 0 ; 
               I = 0 ; 
               I_load = 0 ; 
               I_jalr = 0 ; 
               S = 0 ; 
               SB = 0 ; 
               U_auipc = 0 ; 
               U_lui = 0 ; 
               UJ_jal = 0 ;
               end
           // Default for unknown instructions
    endcase
  end

endmodule