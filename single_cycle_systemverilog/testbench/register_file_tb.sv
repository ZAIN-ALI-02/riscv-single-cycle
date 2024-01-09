module RegisterFile_tb;

  reg [31:0] data_input;
  reg [4:0] write_address;
  reg [4:0] read_address_RS1;
  reg [4:0] read_address_RS2;
  logic enable;
  logic clk;
  wire [31:0] data_output_RS1;
  wire [31:0] data_output_RS2;

  // Instantiate the RegisterFile module
  RegisterFile uut (
    .data_input(data_input),
    .write_address(write_address),
    .read_address_RS1(read_address_RS1),
    .read_address_RS2(read_address_RS2),
    .enable(enable),
    .clk(clk),
    .data_output_RS1(data_output_RS1),
    .data_output_RS2(data_output_RS2)
  );

  // Clock generation
  
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Initialize registers with known values
    clk = 0;


    // Test case 1: Write data_input to register at write_address
    enable = 1;
    write_address = 5'h0;
    data_input = 32'hABCDEFFF;
    #10;
    enable = 0;

      // Test case 2: Write data_input to register at write_address
    enable = 1;
    write_address = 5'h5;
    data_input = 32'hFFFABCDE;
    #10;
    enable = 0;

      // Test case 3: Write data_input to register at write_address
    enable = 1;
    write_address = 5'h9;
    data_input = 32'hABEFFFCD;
    #10;
    enable = 0;

      // Test case 4: Write data_input to register at write_address
    enable = 1;
    write_address = 5'h24;
    data_input = 32'hFAFCDEFF;
    #10;
    enable = 0;
  end

endmodule