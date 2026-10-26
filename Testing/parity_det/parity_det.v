module parity_det ( input t, clear, clk,
					output reg q)
;

always @(posedge clk or posedge clear) begin
    if (clear) q <= 0;
    else if (t) q <= ~q;
end

endmodule