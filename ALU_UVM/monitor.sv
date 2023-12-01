
class alu_monitor extends uvm_monitor;
  //Utility Macro
  `uvm_component_utils(alu_monitor)
  
  virtual alu_if vif;
  alu_sequence_item item;
  uvm_analysis_port #(alu_sequence_item) monitor_port;
  
  //Constructor
  function new(string name="alu_monitor", uvm_component parent);
	super.new(name, parent);
    `uvm_info("MONITOR_Class","Inside Constructor",UVM_HIGH);
  endfunction: new

  //Build component instance
  function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	
    monitor_port = new("monitor_port", this);
    
    if(!(uvm_config_db #(virtual alu_if)::get(this, "*", "vif", vif))) begin
      `uvm_error("DRIVER_CLASS", "Failed to get VIF from config DB!")
    end
    
  endfunction: build_phase
   
  function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	
  endfunction: connect_phase
  
   //Run sequence
  task run_phase(uvm_phase phase);
    `uvm_info("MONITOR_Class","Inside Run Phase",UVM_HIGH);
    forever begin
      item = alu_sequence_item::type_id::create("item");
      
      wait(vif.rst);
      
      //input interconnection
      @(posedge vif.clk);
      item.en = vif.en;
      item.a = vif.a;
      item.b = vif.b;
      item.op_code = vif.op_code;
      
      //output intercooonection
      @(posedge vif.clk);
      item.result = vif.result;
      
      monitor_port.write(item);
    end
  endtask: run_phase

endclass: alu_monitor

