module RAM(
  input logic [11:0] address,
  input logic [31:0] data_input,
  input logic store,
  input logic load,
  input logic clk,
  output logic [31:0] data_output
);

  logic [31:0] memory [0:4095]; // 2^12 locations, each 32 bits

  always_ff @(posedge clk) begin
 if (store) begin
      // Write operation: store data_input at the specified address
      memory[address] <= data_input;
    end
    else 
    memory <= memory;
  end

  always_ff @(posedge clk) begin
  if (load) begin
      // Read operation: output data from the specified address
      data_output <= memory[address];
    end
    else 
    data_output = data_output;
  end
endmodule
