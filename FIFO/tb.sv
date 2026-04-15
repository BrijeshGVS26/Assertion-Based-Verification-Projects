module tb;
  reg clk = 0, rst = 0, wr = 0, rd = 0;
  reg [7:0] din = 0;
  wire [7:0] dout;
  wire empty, full;

  FIFO dut (clk,rst,wr,rd,din,dout,empty,full);
  bind FIFO assert_fifo dut2 (clk,rst,wr,rd,din,dout,empty,full);

  always #5 clk = ~clk;

  initial begin
    rst = 1; #20 rst = 0;

    // Write data
    wr = 1;
    repeat(10) begin
      din = $urandom();
      @(posedge clk);
    end

    // Read data
    wr = 0; rd = 1;
    repeat(10) @(posedge clk);
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #500 $finish;
  end

endmodule
