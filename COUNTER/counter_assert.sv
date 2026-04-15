module counter_assert (
input clk,
input rst,
input up,
input [3:0] dout
);
  
  // Reset behavior
  assert property (@(posedge clk) $rose(rst) |=> dout == 0);
  assert property (@(posedge clk) rst |-> dout == 0);

  // Up count
  assert property (@(posedge clk) disable iff(rst)
    up |-> (dout == $past(dout + 1)) || (dout == 0));

  // Down count
  assert property (@(posedge clk) disable iff(rst)
    !up |-> (dout == $past(dout - 1)) || (dout == 0));

endmodule