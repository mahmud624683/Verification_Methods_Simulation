`timescale 1ns/1ns

module testbench;
  reg clk,rst,en;
  reg [31:0] a,b;
  reg [4:0] op_code;
  wire [63:0] out;
  
  // Clock generation
  initial 
    forever #5 clk = ~clk;
  
  // Module instantiation
  alu DUT( .out (out), .a (a), .b (b), .op_code (op_code), .clk (clk), .rst(rst), .en(en));
  
  initial begin
    #0
      clk = 1'b0;
      op_code = 5'bx;
  	  en = 0;
      rst = 0;
    #5 
      rst =1;
      en=1;
    
    #10 
      op_code = 5'b00001;
      a = 8'h00000019;
      b = 8'h00000014;
      //out = 0000002D
    #10
      op_code = 5'b00010;
      a = 8'h075A2988;
      b = 8'h0023CAB9;
    //out = 07365ECF
    #10
      op_code = 5'b00011;
      a = 8'h3B9AC9FF;
      b = 8'h34FB5E38;
    //out = 0C55F7BBB90CD220
    #10
      op_code = 5'b00100;
      a = 32'b00110100111110110101111000111000;
    
    #10
      op_code = 5'b00101;
      a = 32'b00110100111110110101111000111000;
    
    #10
      op_code = 5'b00110;
      a = 32'b00110100111110110101111000111000;
      b = 32'b00000100101000101100101101110001;
    //out 00000100101000100100101000110000
    
    #10
      op_code = 5'b00111;
      a = 32'b00110100111110110101111000111000;
      b = 32'b00000100101000101100101101110001;
        //out 00110100111110111101111101111001
    #10
      op_code = 5'b01000;
      a = 8'h04A2CB71;
    
    #10
      op_code = 5'b01010;
      a = 8'h04A2CB75;
    $finish;
  end
  
  
  //generating dump file
  initial begin
    $dumpfile("aluDirectDump.vcd");
    $dumpvars;
  end  
endmodule
  
  