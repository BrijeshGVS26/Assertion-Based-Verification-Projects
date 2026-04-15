module adder_assert(
  input [3:0] a,b,
  input [4:0] y
);
  assert #0 (y == a + b);
endmodule