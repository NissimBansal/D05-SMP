module t_ff (   input t, clear, preset, clk,
                output reg q)
;

always @(negedge clk) begin
    if (preset & !clear) q <= 0;
    else if (!preset & clear) q <= 1;
    else if (t) q <= ~q;
end

endmodule