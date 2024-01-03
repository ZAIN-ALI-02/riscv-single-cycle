module Top_Control_Decoder (
 
 input   logic [6:0] instruction,

  input  logic  Func_7,
  input  logic  [2:0] Func_3,

  output logic REG_write , Branch , Store , Men_2_Reg , operand_B , 
  output logic [1:0] operand_A , IMM_Selector , Next_pc,
  output logic [2:0] ALU,
  output logic [3:0] ALU_Selector
);

logic  R , I , I_load , I_jalr , S , SB , U_auipc , U_lui , UJ_jal ;

InstructionDecoder uut_InstructionDecoder (

    .instruction(instruction),

    .R(R),
    .I(I),
    .I_load(I_load),
    .I_jalr(I_jalr),
    .S(S),
    .SB(SB),
    .U_auipc(U_auipc),
    .U_lui(U_lui),
    .UJ_jal(UJ_jal)
);

ControlDecoder uut_ControlDecoder(
     
    .Func_7(Func_7),
    .Func_3(Func_3),

    .REG_write(REG_write), 
    .Branch(Branch),  
    .Store(Store),  
    .Men_2_Reg(Men_2_Reg),  
    .operand_B(operand_B),
    .operand_A(operand_A), 
    .IMM_Selector(IMM_Selector), 
    .Next_pc(Next_pc),
    .ALU(ALU),
    .ALU_Selector(ALU_Selector),
    
    .R(R),
    .I(I),
    .I_load(I_load),
    .I_jalr(I_jalr),
    .S(S),
    .SB(SB),
    .U_auipc(U_auipc),
    .U_lui(U_lui),
    .UJ_jal(UJ_jal)


);


endmodule