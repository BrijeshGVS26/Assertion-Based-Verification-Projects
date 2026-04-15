module counter(
input clk,
input rst,
input up,
output reg [3:0] dout
);
  
  always@(posedge clk,posedge rst) begin
    if(rst)
      dout <= 0;
    else if(up)
      dout <= dout + 1;
    else
      dout <= dout - 1;
  end
  
endmodule