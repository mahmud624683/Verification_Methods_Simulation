interface alu_if(input logic clk);
  logic rst,en;
  logic [31:0] a,b;
  logic [4:0] op_code;
  logic [63:0] result;
endinterface 