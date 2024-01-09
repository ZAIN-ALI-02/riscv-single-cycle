module SignedExtender(
  input logic [31:0] Instruction,
  input logic [31:0] PC,
  output logic [31:0] output_extended_I_type,
  output logic [31:0] output_extended_S_type,
  output logic [31:0] output_extended_SB_type,
  output logic [31:0] output_extended_U_type,
  output logic [31:0] output_extended_UJ_type
);

// I_type
logic [11:0] bits_20_to_31; 
  always_comb begin
    // Extract bits 20 to 31
    bits_20_to_31 = Instruction[31:20];

    // Sign extend to 32 bits
    output_extended_I_type = { {20{bits_20_to_31[11]}}, bits_20_to_31 };
  end

  // S_type
logic [6:0] bits_24_to_31; 
logic [4:0] bits_7_to_11; 
  always_comb begin
    // Extract bits 20 to 31
   // bits_20_to_31 = input_data[31:20];
    bits_24_to_31 = Instruction[31:25]; 
    bits_7_to_11 = Instruction[11:7]; 

    // Sign extend to 32 bits
    output_extended_S_type = { {20{bits_24_to_31[6]}}, bits_24_to_31 , bits_7_to_11  };
  end

    // SB_type
logic  bit_31;
logic  bit_0;
logic  bit_7;      
logic [5:0] bits_24_to_30; 
logic [3:0]bits_8_to_11; 
logic [31:0] extended_SB_type;

localparam zero = 0;
  always_comb begin
    // Extract bits 20 to 31
    bit_31 = Instruction[31];
    bit_7 =  Instruction[7];
    bit_0 = zero;
    bits_24_to_30 = Instruction[30:25]; 
    bits_8_to_11 = Instruction[11:8]; 

    // Sign extend to 32 bits
    extended_SB_type = {{20{bit_31}},  bit_7 ,bits_24_to_30 , bits_8_to_11 , bit_0};
    output_extended_SB_type = (extended_SB_type + PC);
  end
  
  
     // U_type

    
logic [19:0] bits_12_to_31; 
logic [31:0] extended_U_type;
  always_comb begin
    // Extract bits 20 to 31
   
    bits_12_to_31 = Instruction[31:12]; 

    // Sign extend to 32 bits
    extended_U_type = {{12{bit_0}} , bits_12_to_31};
    output_extended_U_type = (extended_U_type << 12 );
  end


    // UJ_type

logic  bit_22;
logic [9:0] bits_21_to_30; 
logic [7:0]bits_12_to_23; 
logic [31:0] extended_UJ_type;

  always_comb begin
    // Extract bits 20 to 31
    
    bit_22 =  Instruction[22];

    bits_21_to_30 = Instruction[30:21]; 
    bits_12_to_23 = Instruction[23:12]; 

    // Sign extend to 32 bits
    extended_UJ_type = {{12{bit_31}}, bits_12_to_23 ,  bit_22 ,bits_21_to_30, bit_0};
    output_extended_UJ_type = (extended_UJ_type + PC);
  end
  
  
endmodule