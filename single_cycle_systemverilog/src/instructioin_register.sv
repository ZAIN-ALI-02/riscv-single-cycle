module instruction_reg(
  input logic rst,
  input logic clk,
  input logic [31:0] instruction_address,
  output logic [31:0] rom_address_32,
  output logic [11:0] rom_address
);

 always@(posedge clk or posedge rst ) begin
 if (rst) begin
      // Reset operation: the output will be 0 as well as register will be reset;
      rom_address <= 0;
    end
    else 
    rom_address <= instruction_address[11:0];
    rom_address_32 <= instruction_address;
  end

endmodule

