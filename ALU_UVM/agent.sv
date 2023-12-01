class alu_agent extends uvm_agent;
  //Utility Macro
  `uvm_component_utils(alu_agent)
  //agent contains driver, monitor and sequencer class
  alu_driver drv;
  alu_monitor mon;
  alu_sequencer seqr;
  
  //Constructor
  function new(string name="alu_agent", uvm_component parent);
	super.new(name, parent);
    `uvm_info("AGENT_Class","Inside Constructor",UVM_HIGH);
  endfunction: new

  //Build component instance
  function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	drv = alu_driver::type_id::create("drv", this);
    mon = alu_monitor::type_id::create("mon", this);
    seqr = alu_sequencer::type_id::create("seqr", this);
  endfunction: build_phase
   
  function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
    
	drv.seq_item_port.connect(seqr.seq_item_export);
    
  endfunction: connect_phase
  
   //Run sequence
  task run_phase(uvm_phase phase);
    
  endtask: run_phase

endclass: alu_agent

