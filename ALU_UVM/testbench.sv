`timescale 1ns/1ns

import uvm_pkg::*;
`include "uvm_macros.svh" 

//included files called here
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module testbench;
  logic clk;
  alu_if intf(.clk(clk));
  
  //DUT called
  alu dut(
    .out(intf.result),
    .a(intf.a),
    .b(intf.b),
    .op_code(intf.op_code),
    .clk(intf.clk),
    .rst(intf.rst),
    .en(intf.en));
  
  //interface handling
  initial begin
    uvm_config_db #(virtual alu_if)::set(null, "*", "vif", intf );
  end
  
  
  
  //initiate test
  initial begin
    run_test("alu_test");
  end
  
  //setting clock
  initial begin
    clk=0;
    #5;
    forever begin
      clk=~clk;
      #2;
    end
  end
  
  //initiate termination
  initial begin
    #5000;
    $display("Simulation time is over");
    $finish();
  end
  
  //generating dump file
  initial begin
    $dumpfile("aluUvmDump.vcd");
    $dumpvars;
  end
  
endmodule 
