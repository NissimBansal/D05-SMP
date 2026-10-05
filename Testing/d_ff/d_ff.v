module d_ff (   input d, clear, preset, clk,
                output reg q)
;

always @(posedge clk or negedge preset or negedge clear) begin // active-low control signals
    if (preset & !clear) q <= 0;
    else if (!preset & clear) q <= 1;
    else q <= d;
end

endmodule