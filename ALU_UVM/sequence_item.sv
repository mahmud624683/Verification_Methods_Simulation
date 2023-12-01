class alu_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(alu_sequence_item)
  
  //Instatiation
  rand logic rst;
  //rand logic en;
  logic en=1;
  rand logic [31:0] a,b;
  rand logic [4:0] op_code;
  
  logic [63:0] result;
  
  //Default Constrain
  constraint input1_c {a inside {[10000:20000]};}
  constraint input2_c {b inside {[1:10000]};}
  constraint op_code_c {op_code inside {1,2,3,4,5,6,7,8,10};}
  
  //Constructor
  function new(string name="alu_sequence_item");
	super.new(name);
    `uvm_info("SEQ_ITEM_Class","Inside Constructor",UVM_HIGH);
  endfunction: new
  
endclass: alu_sequence_item