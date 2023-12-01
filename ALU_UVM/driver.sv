
class alu_driver extends uvm_driver#(alu_sequence_item);
  //Utility Macro
  `uvm_component_utils(alu_driver)
  
  virtual alu_if vif;
  alu_sequence_item item;
  
  //Constructor
  function new(string name="alu_driver", uvm_component parent);
	super.new(name, parent);
    `uvm_info("DRIVER_Class","Inside Constructor",UVM_HIGH);
  endfunction: new

  //Build component instance
  function void build_phase(uvm_phase phase);
	super.build_phase(phase);
    
    if(!(uvm_config_db #(virtual alu_if)::get(this, "*", "vif", vif))) begin
      `uvm_error("DRIVER_CLASS", "Failed to get VIF from config DB!")
    end
      
  endfunction: build_phase
   
  
  
  function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	
  endfunction: connect_phase
  
   //Run sequence
  task run_phase(uvm_phase phase);
    `uvm_info("Driver_Class", "In Run Phase", UVM_HIGH)
    
    forever begin
      item = alu_sequence_item::type_id::create("item"); 
      seq_item_port.get_next_item(item);
      drive(item);
      seq_item_port.item_done();
    end
  endtask: run_phase
  
  
  //Defining drive task
  task drive(alu_sequence_item item);
    @(posedge vif.clk);
    vif.en <= item.en;
    vif.rst <= item.rst;
    vif.a <= item.a;
    vif.b <= item.b;
    vif.op_code <= item.op_code;
  endtask: drive
endclass: alu_driver

