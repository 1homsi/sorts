module bogosort(input [31:0] arr, output [31:0] sorted);
  always @(*) begin
    if (!is_sorted) shuffle();
  end
endmodule
