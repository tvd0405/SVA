//+++++++++++++++++++++++++++++++++++++++++++++++
//   Testbench Code
//+++++++++++++++++++++++++++++++++++++++++++++++
`include "assertion_ip.sv"
//`include "dut.sv"

module tb();

reg clk = 0;
reg reset, req = 0;
wire gnt;

/*
bind dut   assertion_ip      U_assert_ip (
// .vip port (RTL port)
 .clk   (clk),
 .req   (req),
 .reset (reset),
 .int_sig (internal),
 .gnt   (gnt)
);
*/

bind dut   assertion_ip      U_assert_ip (.int_sig(internal),.*);

always #3 clk ++;

initial begin
  reset <= 1;
  #20 reset <= 0;
  // Make the assertion pass
  #100 @ (posedge clk) req  <= 1;
  @ (posedge clk) req <= 0;
  // Make the assertion fail
  #100 @ (posedge clk) req  <= 1;
  repeat (5) @ (posedge clk);
  req <= 0;
  #10 $finish;
end

dut dut_i (clk,req,reset,gnt);

endmodule
