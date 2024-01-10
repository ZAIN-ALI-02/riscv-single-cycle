module RAM_tb;

  reg clk, store, load;
  reg [11:0] address;
  reg [31:0] data_input;
  wire [31:0] data_output;

  // Instantiate the RAM module
  RAM uut (
    .address(address),
    .data_input(data_input),
    .store(store),
    .load(load),
    .clk(clk),
    .data_output(data_output)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test scenario
  initial begin
    // Initialize inputs

    store = 0;
    load = 0;
    address = 12'h0;
    data_input = 32'h12345678;



    // Store data at address 12'h5
    #10 address = 12'h5;
    data_input = 32'hABCDEF01;
    store = 1;
    #10 store = 0;

    // Load data from address 12'h5
    #10 address = 12'h5;
    load = 1;
    #10 load = 0;

    // Monitor outputs
    $display("Data at address %h: %h", address, data_output);

    // End simulation
  
  end

endmodule
