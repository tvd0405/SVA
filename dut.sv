//+++++++++++++++++++++++++++++++++++++++++++++++++
//   DUT With assertions
//+++++++++++++++++++++++++++++++++++++++++++++++++
module dut(
  input wire clk,req,reset, 
  output reg gnt);
//=================================================
// Actual DUT RTL
//=================================================
reg internal;
reg [15:0] count = 16'd0;
always @ (posedge clk)
  begin
     internal <= req;
     gnt <= internal;
     count <= count + 1'd1;
  end

endmodule
