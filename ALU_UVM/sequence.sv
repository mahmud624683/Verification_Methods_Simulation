class alu_base_sequence extends uvm_sequence#(alu_sequence_item);
  //Utility Macro
  `uvm_object_utils(alu_base_sequence)
  
  alu_sequence_item rst_pkt;
  
  //Constructor
  function new(string name="alu_base_sequence");
	super.new(name);
    `uvm_info("SEQuence_Class","Inside Constructor",UVM_HIGH);
  endfunction: new

  //Create transaction, send transaction to driver for #Run of times
  task body();
    `uvm_info("SEQuence_Class","Inside Body",UVM_HIGH);
    rst_pkt = alu_sequence_item::type_id::create("rst_pkt");
    start_item(rst_pkt);
    rst_pkt.randomize() with {rst==0;};
    finish_item(rst_pkt);
  endtask: body
  
endclass: alu_base_sequence


//Initiating test sequences
class alu_test_sequence extends alu_base_sequence;
  `uvm_object_utils(alu_test_sequence)
  
  alu_sequence_item item;
  
  //Constructor
  function new(string name= "alu_test_sequence");
    super.new(name);
    `uvm_info("TEST_SEQ", "Inside Constructor!", UVM_HIGH)
  endfunction
  
  
  //Body Task
  task body();
    `uvm_info("TEST_SEQ", "Inside body task!", UVM_HIGH)
    
    item = alu_sequence_item::type_id::create("item");
    start_item(item);
    item.randomize() with {rst==1;};
    finish_item(item);
        
  endtask: body
  
  
endclass: alu_test_sequence


