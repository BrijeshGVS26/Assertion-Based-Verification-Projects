module assert_fifo (
  input clk, rst, wr, rd, 
  input [7:0] din, dout,
  input empty, full
);

  // Reset condition
  assert property (@(posedge clk) rst |-> (!full && empty));

  // No read when empty
  assert property (@(posedge clk) disable iff(rst)
    empty |-> !rd);

  // No write when full
  assert property (@(posedge clk) disable iff(rst)
    full |-> !wr);

endmodule
