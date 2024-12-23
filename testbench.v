`timescale 1ns / 1ps
//This is The test bench of 16bit mux,you can change the value of 'A' and 'S'.The Dumpfile and dumpvars require for iverilog and edatool platform.In vivado you have to remove the dumpfile and dumpvars
module testbench;
  reg [15:0] A;
  reg [3:0] S;
  wire F;
  mux16 DUT(.in(A),.sel(S),.out(F));
  initial begin
    $monitor("$time,A=%h,S=%h,F=%b",A,S<F);
    $dumpfile("Mux16.vcd");
    $dumpvars(0,test);
    #5 A=16'h3f0a;S=4'h0;
    #5 S=4'h1;
    #5 S=4'hf;
    #5 S=4'hd;
    #5 $finish;
  end
endmodule
