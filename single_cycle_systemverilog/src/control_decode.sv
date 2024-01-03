module ControlDecoder (
  input  logic  R , I , I_load , I_jalr , S , SB , U_auipc , U_lui , UJ_jal , Func_7,
  input  logic  [2:0] Func_3,
  
  output logic REG_write , Branch , Store , Men_2_Reg , operand_B , 
  output logic [1:0] operand_A , IMM_Selector , Next_pc,
  output logic [2:0] ALU,
  output logic [3:0] ALU_Selector
);


localparam  zero = 0  ;
logic op_B ,jal_jalr  , branch_auipc; 

always @(*)begin

    REG_write = (R | I | I_load | I_jalr  | U_auipc | U_lui | UJ_jal) ; 

    Branch = SB ;
    
    Store = S ;
    
    Men_2_Reg = I_load ;
    
    op_B =  (U_auipc | U_lui);
    operand_B = (S | I | SB | op_B) ;
    
    jal_jalr = (I_jalr | UJ_jal) ;
    operand_A [0] = (zero | jal_jalr) ;
    operand_A [1] = (zero | U_auipc) ;

    branch_auipc = (U_lui | U_auipc) ;
    IMM_Selector [0] = (~I) & (~branch_auipc) ;
    IMM_Selector [1] = (~I) & (~S) ;

    Next_pc [0] = (UJ_jal | Branch) ;
    Next_pc [1] = (I_jalr | Branch) ;

    ALU [0] = (I_jalr | UJ_jal | U_auipc | I) ;
    ALU [1] = (I_jalr | UJ_jal | I_load | U_lui) ;
    ALU [2] = (S | UJ_jal | U_lui | U_auipc) ;

    ALU_Selector [0] = (((~ALU[2]) & (~ALU[1]) & (~Func_3[2]) & Func_3[1] & (~Func_3[0])) | ((~ALU[2]) & (~ALU[1]) & Func_3[2] & (~Func_3[1]) ) | (ALU[0] & ALU[1]) );
    ALU_Selector [1] = (((~ALU[2]) & (~ALU[1]) & (~ALU[0]) & Func_7) | ((~ALU[2]) & (~ALU[1]) & (~Func_3[2]) & (~Func_3[1]) & Func_3[0] ) | ((~ALU[2]) & (~ALU[1]) & Func_3[0] & (~Func_3[1]) & Func_7) | (ALU[0] & ALU[1]));
    ALU_Selector [2] = (((~ALU[2]) & (~ALU[1]) & (~ALU[0]) & (~Func_3[2])  & Func_7 ) | ((~ALU[2]) & (~ALU[1]) & (~Func_3[2]) & Func_3[1] & Func_3[0]) | ((~ALU[2]) & (~ALU[1]) & Func_3[2] & (~Func_3[1])  & (~Func_7)) | ((~ALU[2]) & (~ALU[1]) & Func_3[2] & (~Func_3[0])) | (ALU[1] & ALU[0])) ;
    ALU_Selector [3] = (((~ALU[2]) & (~ALU[1]) & Func_3[1] & Func_3[0] ) | ((~ALU[2]) & (~ALU[1]) & Func_3[2] & (~Func_3[1]) & (~Func_3[0])) | (ALU[1] & ALU[0]));

end
endmodule