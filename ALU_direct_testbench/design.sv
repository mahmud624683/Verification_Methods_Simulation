module alu (out,a,b,op_code,clk,rst,en);
  input clk,rst,en;
  input [31:0]a,b;
  input [4:0]op_code;
  output [63:0] out;
  reg [63:0] out;

  always@(posedge clk or posedge rst) 
  begin
    if (rst == 0) begin
        out = 0;
    end 
    else if (en == 1) begin
        case(op_code)
          5'b00001: out=a+b; //32-bit addition
          5'b00010: out=a-b; //32-bit subtraction
          5'b00011: out=a*b; //32-bit multiplication
          5'b00100: out=a<<1; //1-bit left shift
          5'b00101: out=a>>1; //1-bit right shift
          5'b00110: out=a&b; //32-bit bitwise and
          5'b00111: out=a|b; //32-bit bitwise or
          5'b01000: out=a+1; //Adding 1 to Input A
          5'b01010: out=a-1; //Subtracting 1 from Input A
  		endcase
    end
    
  end
endmodule

