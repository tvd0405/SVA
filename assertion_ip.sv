//+++++++++++++++++++++++++++++++++++++++++++++++++
//   Assertion Verification IP
//+++++++++++++++++++++++++++++++++++++++++++++++++
module assertion_ip(clk, req,reset,gnt,int_sig, count);
input clk, req,reset,gnt,int_sig;
input [15:0] count;
//=================================================
// Sequence Layer
//=================================================
sequence req_gnt_seq;
  (~req & gnt) ##1 (~req & ~gnt);
endsequence
//=================================================
// Property Specification Layer
//=================================================
property req_gnt_prop;
  @ (posedge clk) 
    disable iff (reset)
      req |=> req_gnt_seq;
endproperty
property count_prop;
  @ (posedge clk) 
    disable iff (reset)
      count == $past(count,1) + 1'b1;
      //count[3:0] != 4'd15;
endproperty
//=================================================
// Assertion Directive Layer
//=================================================
req_gnt_assert : assert property (req_gnt_prop)
                 else
                 $display("@%0dns Assertion Failed", $time);
count_assert: assert property (count_prop)
                 else
                 $display("@%0dns Count is NOT working - Count = %0d; Last_count = %0d", $time, $past(count,1), $past(count,2));

endmodule
