module top(
  input logic rst,
  input logic clk
);

// program_counter_start
logic [11:0] rom_address;
logic [11:0] pc_1;
logic [31:0] rom_address_32;


  instruction_reg dut_program_counter (
    .rst(rst),
    .clk(clk),
    .instruction_address(branch_mux),
    .rom_address_32(rom_address_32),
    .rom_address(rom_address)
  );

always_comb 
pc_1 = rom_address_32 + 1 ;
// program_counter_end 


// ROM_start
logic [31:0] ROM_data;
ROM dut_ROM(
    .address(rom_address),
    .data_output(ROM_data)
);
// ROM_end


// control_unit_start
bit  REG_write , Branch , Store , Men_2_Reg , operand_B ; 
bit  [1:0] operand_A , IMM_Selector , Next_pc;
bit [2:0] ALU;
bit [3:0] ALU_Selector;

Top_Control_Decoder dut_Control_Unit (
 
 .instruction(ROM_data[6:0]),
  .Func_7(ROM_data[30]),
  .Func_3(ROM_data[14:12]),

    .REG_write(REG_write), 
    .Branch(Branch),  
    .Store(Store),  
    .Men_2_Reg(Men_2_Reg),  
    .operand_B(operand_B),
    .operand_A(operand_A), 
    .IMM_Selector(IMM_Selector), 
    .Next_pc(Next_pc),
    .ALU(ALU),
    .ALU_Selector(ALU_Selector)
);

// control_unit_end 



// register_file_start
  //reg [31:0] data_input  = 32'b1111_1111_1111_1111_1111_1111_0011_0011;
  wire [31:0] data_output_RS1;
  wire [31:0] data_output_RS2;

  // Instantiate the RegisterFile module
  RegisterFile dut_Register_File (
    .data_input(write_back),
    .write_address(ROM_data[11:7]),
    .read_address_RS1(ROM_data[19:15]),
    .read_address_RS2(ROM_data[24:20]),
    .enable(REG_write),
    .clk(clk),
    .data_output_RS1(data_output_RS1),
    .data_output_RS2(data_output_RS2)
  );
// register_file_end


// ALU_started

  logic [31:0] operand_a_alu;
  logic [31:0] operand_b_alu;
  logic [31:0] result_alu;
  localparam  zero = 0;


  always_comb begin
    case(operand_A)
     00 : operand_a_alu = data_output_RS1;
     01 : operand_a_alu = pc_1;
     10 : operand_a_alu = rom_address_32;
     11 : operand_a_alu = zero;
    default 
         operand_a_alu = 0;
    endcase
  end

   always_comb begin
    case(operand_B)
     0 : operand_B = data_output_RS2;
     1 : operand_B = IMM_Selector_output;
    default 
         operand_B = 0;
    endcase
  end

  // Instantiate the ALU module
  ALU uut_ALU (
    .operand_a_alu(operand_a_alu),
    .operand_b_alu(operand_b_alu),
    .operation_alu(ALU_Selector),
    .result_alu(result_alu)
  );
// ALU_started


// RAM_started


  wire [31:0] data_output;

  // Instantiate the RAM module
  RAM uut (
    .address(result_alu[11:0]),
    .data_input(data_output_RS2),
    .store(store),
    .load(Men_2_Reg),
    .clk(clk),
    .data_output(data_output)
  );
 
 logic [31:0] write_back;
  always_comb begin
    case(Men_2_Reg)
     0 : write_back = result_alu;
     1 : write_back = data_output;
    default 
         write_back = 0;
    endcase
  end
// RAM_end


// IMM_GENERATION_start
  logic [31:0] output_extended_I_type;
  logic [31:0] output_extended_S_type;
  logic [31:0] output_extended_SB_type;
  logic [31:0] output_extended_U_type;
  logic [31:0] output_extended_UJ_type;

  // Instantiate the SignedExtender module
  SignedExtender uut (
    .Instruction(ROM_data),
    .PC(rom_address_32),

    .output_extended_I_type(output_extended_I_type),
    .output_extended_S_type(output_extended_S_type),
    .output_extended_SB_type(output_extended_SB_type),
    .output_extended_U_type(output_extended_U_type),
    .output_extended_UJ_type(output_extended_UJ_type)
  );

logic [31:0] IMM_Selector_output;

  always_comb begin
    case(IMM_Selector)
     00 : IMM_Selector_output = output_extended_I_type;
     01 : IMM_Selector_output = output_extended_S_type;
     10 : IMM_Selector_output = output_extended_U_type;
    default 
         IMM_Selector_output = 0;
    endcase
  end
// IMM_GENERATION_end


// branch_start
 logic output_result_branch;

  // Instantiate the BRANCH module
  BRANCH uut (
    .operand_a_branch(data_output_RS1),
    .operand_b_branch(data_output_RS2),
    .operation_branch(ROM_data[14:12]),
    .output_result_branch(output_result_branch)
  );
  
  logic [31:0] branch_mux;
  always_comb begin
    case(output_result_branch)
     0 : branch_mux = pc_1;
     1 : branch_mux = output_extended_SB_type;
    default 
         branch_mux = 0;
    endcase
  end


wire logic [31:0] sum_of_I_RS1;
assign sum_of_I_RS1 = output_extended_I_type + data_output_RS1;

 logic [31:0] pc_mux;
always_comb begin
    case(Next_pc)
     00 : pc_mux = pc_1;
     01 : pc_mux = output_extended_UJ_type;
     10 : pc_mux = sum_of_I_RS1;
     11 : pc_mux = branch_mux;
    default 
         pc_mux = 0;
    endcase
  end
// branch_end
endmodule