`timescale 1ns / 1ps


\\mux2to1
module mux2(in,sel,out);
  input [1:0] in;
  input sel;
  output out;
  wire t1,t2,t3;
  not g1(t1,sel);
  and g2 (t2,in[0],t1);
  and g3 (t3,in[1],sel);
  or g4(out,t2,t3);
endmodule

\\mux4to1 using mux2to1
module mux(in,sel,out);
input [3:0] in;
input [1:0] sel;
output out;
  wire [1:0] t;
  mux2 m0 (in[1:0],sel[0],t[0]);
  mux2 m1 (in[3:2],sel[0],t[1]);
  mux m2 (t,sel[1],out);
endmodule
\\mux16to1 using mux4to1
module mux16(in,sel,out);
input  [15:0] in;
input  [3:0] sel;
output wire out;
wire [3:0] t;
mux m0(in[3:0],sel[1:0],t[0]);
mux m1 (in[7:4],sel[1:0],t[1]);
mux m2(in[11:8],sel[1:0],t[2]);
mux m3(in[15:12],sel[1:0],t[3]);
mux m4 (t,sel[3:2],out);
endmodule
