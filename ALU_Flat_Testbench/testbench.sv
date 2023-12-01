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
  	  en = 1;
      rst = 0;
    
    #5 rst =1;
    
    #10 
      op_code = 5'b00001;
      a = $random;
      b = $random;
    #10 
      result_checker(op_code,a,b,out);
    #10
      op_code = 5'b00010;
      a = $random;
      b = $random;
    #10 
      result_checker(op_code,a,b,out);
    #10
      op_code = 5'b00011;
      a = $random;
      b = $random;
    #10
      result_checker(op_code,a,b,out);
    #10
      op_code = 5'b00100;
      a = $random;
      b = $random;
    #10
      result_checker(op_code,a,b,out);
    #10
      op_code = 5'b00101;
      a = $random;
      b = $random;
    #10
      result_checker(op_code,a,b,out);
    #10
      op_code = 5'b00110;
      a = $random;
      b = $random;
    #10
      result_checker(op_code,a,b,out);
    #10
      op_code = 5'b00111;
      a = $random;
      b = $random;
    #10
      result_checker(op_code,a,b,out);
    #10
      op_code = 5'b01000;
      a = $random;
      b = $random;
    #10
      result_checker(op_code,a,b,out);
    #10
      op_code = 5'b01010;
      a = $random;
      b = $random;
    #10
      result_checker(op_code,a,b,out);
    $finish;
  end
  
  // Task : result_checker
  task result_checker(input [4:0] op_code,input [31:0] a,b,input [63:0]resulted_out);
    begin
      reg [63:0] out;
      if(op_code==5'b00001)  out=a+b;
      else if(op_code==5'b00010) out=a-b;
      else if(op_code==5'b00011) out=a*b;
      else if(op_code==5'b00100) out=a<<1;
      else if(op_code==5'b00101) out=a>>1;
      else if(op_code==5'b00110) out=a&b; 
      else if(op_code==5'b00111) out=a|b;
      else if(op_code==5'b01000) out=a+1; 
      else if(op_code==5'b01010) out=a-1;
 
      if(resulted_out == out)
        $display("Passed : a=%d, b=%d, s=%d, resulted_out=%d, expected_out=%d",a ,b,op_code,resulted_out,out);
      else
        $display("Failed : a=%d, b=%d, s=%d, resulted_out=%d, expected_out=%d", a,b,op_code,resulted_out,out);
      end
  endtask
  
  
  //generating dump file
  initial begin
    $dumpfile("aluFlatDump.vcd");
    $dumpvars;
  end  
endmodule
  
  