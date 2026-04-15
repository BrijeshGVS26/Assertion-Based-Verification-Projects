module tb;
  reg clk = 0,rst = 0,up = 0;
  wire [3:0] dout;

  counter dut (clk,rst,up,dout);  
  bind counter counter_assert dut2 (clk,rst,up,dout);
  
  always #5 clk = ~clk;
  
  initial begin
    rst = 1;
    #30 rst = 0;
    up = 1;
    #200 up = 0;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #360 $finish;
  end
endmodule