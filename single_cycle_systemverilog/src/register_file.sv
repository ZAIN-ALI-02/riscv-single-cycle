module RegisterFile(
  input logic [31:0] data_input,
  input logic [4:0] write_address,
  input logic [4:0] read_address_RS1,
  input logic [4:0] read_address_RS2,
  input logic enable,
  input logic clk,
  output logic [31:0] data_output_RS1,
  output logic [31:0] data_output_RS2
);

  logic [31:0] registers [31:0];

  always @(posedge clk) begin
 if (enable) begin
      // Write operation: store data_input in the specified register
      registers[write_address] <= data_input;
    end
    else
     registers <= registers;
  end

  // Read operations: output data from the specified registers
  assign data_output_RS1 =  registers[read_address_RS1];
  assign data_output_RS2 =  registers[read_address_RS2];
endmodule


