class alu_test extends uvm_test;
  //Utility Macro
  `uvm_component_utils(alu_test)
  alu_env env; //test holds env module
  alu_base_sequence rst_seq;
  alu_test_sequence test_seq;
  
  //Constructor
  function new(string name="alu_test", uvm_component parent);
	super.new(name, parent);
    `uvm_info("Test_Class","Inside Constructor",UVM_HIGH);
  endfunction: new

  //Build component instance
  function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env = alu_env::type_id::create("env", this);
  endfunction: build_phase
   
  function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	
  endfunction: connect_phase
  
   //Run sequence
  task run_phase(uvm_phase phase);
    `uvm_info("TEST_CLASS", "Run Phase!", UVM_HIGH)

    phase.raise_objection(this);
    //starting reset sequence
    rst_seq = alu_base_sequence::type_id::create("rst_seq");
    rst_seq.start(env.agent.seqr);
    #10;

    repeat(20) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
      test_seq.start(env.agent.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase

endclass: alu_test