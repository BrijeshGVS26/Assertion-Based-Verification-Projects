module tb;
  reg clk = 0;
  reg din = 0;
  reg rst = 0;
  wire dout;
  
  top dut (clk,rst,din,dout);
  
  always #5 clk = ~clk;
  
  initial begin
    #3 rst = 1;
    #30 rst = 0;
    din = 1;
    #45 din = 0;
    #25 rst = 1;
    #40 rst = 0;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #180 $finish;
  end

  assert property (@(posedge clk) $onehot(dut.state));
  assert property (@(posedge clk) rst |=> dut.state == dut.idle);

endmodule