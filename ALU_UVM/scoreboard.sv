
class alu_scoreboard extends uvm_test;
  `uvm_component_utils(alu_scoreboard)
  
  uvm_analysis_imp #(alu_sequence_item, alu_scoreboard) scoreboard_port;
  
  alu_sequence_item transactions[$];
  
  
  //Constructor
  function new(string name = "alu_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SCB_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCB_CLASS", "Build Phase!", UVM_HIGH)
   
    scoreboard_port = new("scoreboard_port", this);
    
  endfunction: build_phase
  
  
  //Connect Phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCB_CLASS", "Connect Phase!", UVM_HIGH)
    
   
  endfunction: connect_phase
  
  
  //Write Method
  function void write(alu_sequence_item item);
    transactions.push_back(item);
  endfunction: write 
  
  
  
  //Run Phase
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SCB_CLASS", "Run Phase!", UVM_HIGH)
   
    forever begin
      //get the data and compare it with the result
      alu_sequence_item curr_trans;
      wait((transactions.size() != 0));
      curr_trans = transactions.pop_front();
      compare(curr_trans);
      
    end
    
  endtask: run_phase
  
  
  //executing compare task
  task compare(alu_sequence_item curr_trans);
    logic [63:0] expected;
    logic [63:0] actual;
    
    case(curr_trans.op_code)
        5'b00001: expected=curr_trans.a+curr_trans.b;//addition
        5'b00010: expected= curr_trans.a - curr_trans.b; //subtraction
        5'b00011: expected=curr_trans.a * curr_trans.b; //multiplication
        5'b00100: expected=curr_trans.a<<1; //1-bit left shift
        5'b00101: expected=curr_trans.a>>1; //1-bit right shift
        5'b00110: expected=curr_trans.a&curr_trans.b; // bitwise and
        5'b00111: expected=curr_trans.a|curr_trans.b; //bitwise or
        5'b01000: expected=curr_trans.a+1; //Adding 1 to Input A
        5'b01010: expected=curr_trans.a-1; //Subtracting 1 from Input A
  	endcase
    
    
    actual = curr_trans.result;
    
    if(actual == expected) begin
      `uvm_info("COMPARE", $sformatf("Passed : en=%d, a=%d, b=%d, s=%d, resulted_out=%d, expected_out=%d",curr_trans.en,curr_trans.a ,curr_trans.b,curr_trans.op_code, actual, expected),UVM_LOW);
    end
    else begin
      `uvm_error("COMPARE", $sformatf("Failed  : en=%d, a=%d, b=%d, s=%d, resulted_out=%d, expected_out=%d",curr_trans.en,curr_trans.a ,curr_trans.b,curr_trans.op_code, actual, expected));
    end
    
  endtask: compare
  
  
endclass: alu_scoreboard