module ROM(
  input logic [11:0] address,
  output logic [31:0] data_output
);

  // Contents of the ROM, you can initialize this with your data
  logic [31:0] rom_content [0:4095] ;
 
  always_comb begin
  rom_content [0] = 32'h11223344;
   rom_content [1] = 32'hAABBCCDD;
    rom_content [2] = 32'h00112233;
     rom_content [3] = 32'hAABBCC21;
        rom_content [4] = 32'h11227799;
          rom_content [5] = 32'h001122DD;
 end
 
  always_comb begin
    // Read operation: output data from the specified address
    data_output = rom_content[address];
  end

endmodule
