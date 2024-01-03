`timescale 1ns/1ns

module Top_Control_Decoder_tb;

initial begin
    $dumpfile("top_control_decoder_tb.vcd");
    $dumpvars(0, Top_Control_Decoder_tb);
end

bit [6:0]instruction;
bit  Func_7;
bit  [2:0] Func_3;

Top_Control_Decoder uut_Top_Control_Decoder(

    .instruction(instruction),
    .Func_3(Func_3),
    .Func_7(Func_7)
);

initial begin
    instruction = 0;
    Func_3 = 0;
    Func_7 = 0;
    #50
    instruction = 7'b0100111;
    Func_3 = 3'b000;
    Func_7 = 1'b0;
    #20
    Func_3 = 3'b000;
    Func_7 = 1'b1;
    #20
    Func_3 = 3'b001;
    Func_7 = 1'b0;
    #20
    Func_3 = 3'b001;
    Func_7 = 1'b1;
    #20
    Func_3 = 3'b010;
    Func_7 = 1'b0;
    #20
    Func_3 = 3'b010;
    Func_7 = 1'b1;
    #20
    Func_3 = 3'b011;
    Func_7 = 1'b1;
    #20
    Func_3 = 3'b011;
    Func_7 = 1'b0;
    #20
    Func_3 = 3'b100;
    Func_7 = 1'b1;
    #20
    Func_3 = 3'b100;
    Func_7 = 1'b0;
    #20
    Func_3 = 3'b101;
    Func_7 = 1'b0;
    #20
    Func_3 = 3'b101;
    Func_7 = 1'b1;
    #20
    Func_3 = 3'b110;
    Func_7 = 1'b0;
    #20
    Func_3 = 3'b110;
    Func_7 = 1'b1;
    #20
    Func_3 = 3'b111;
    Func_7 = 1'b0;
    #20
    Func_3 = 3'b111;
    Func_7 = 1'b1;
end



endmodule
