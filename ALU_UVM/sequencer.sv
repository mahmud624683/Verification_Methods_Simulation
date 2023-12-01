
class alu_sequencer extends uvm_sequencer#(alu_sequence_item);
  //Utility Macro
  `uvm_component_utils(alu_sequencer)
  
  //Constructor
  function new(string name="alu_sequencer", uvm_component parent);
	super.new(name, parent);
    `uvm_info("SEQ_Class","Inside Constructor",UVM_HIGH);
  endfunction: new

  //Build component instance
  function void build_phase(uvm_phase phase);
	super.build_phase(phase);
    `uvm_info("SEQ_Class","Inside Build Phase",UVM_HIGH);
  endfunction: build_phase
   
  function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	
  endfunction: connect_phase


endclass: alu_sequencer

