module top(input clk,rst,din,output reg dout);
  
  enum bit [2:0]
  {
    idle = 3'b001,
    s0   = 3'b010,
    s1   = 3'b100
  } state = idle , next_state = idle;
  
  always@(posedge clk) begin
    if(rst)
      state <= idle;
    else 
      state <= next_state;
  end
  
  always@(*) begin
    case(state)
      idle: begin
        dout = 0;
        next_state = s0;
      end
        
      s0: begin
        if(din) begin
          next_state = s1;
          dout = 0;
        end else begin  
          next_state = s0;
          dout = 0;
        end
      end
          
      s1: begin
        if(din) begin
          next_state = s0;
          dout = 1;
        end else begin  
          next_state = s1;
          dout = 0;
        end  
      end
          
      default: begin  
        next_state = idle;
        dout = 0;
      end 
    endcase
  end
endmodule