class alu_env extends uvm_env;
  //Utility Macro
  `uvm_component_utils(alu_env)
  alu_agent agent;//environment contains agent class
  alu_scoreboard scb;
  
  //Constructor
  function new(string name="alu_env", uvm_component parent);
	super.new(name, parent);
    `uvm_info("ENV_Class","Inside Constructor",UVM_HIGH);
  endfunction: new

  //Build component instance
  function void build_phase(uvm_phase phase);
	super.build_phase(phase);
    agent = alu_agent::type_id::create("agent", this);
    scb = alu_scoreboard::type_id::create("scb", this);
  endfunction: build_phase
   
  function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	agent.mon.monitor_port.connect(scb.scoreboard_port);
  endfunction: connect_phase
  
   //Run sequence
  task run_phase(uvm_phase phase);
    
  endtask: run_phase

endclass: alu_env

