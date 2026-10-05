module jk_ff (  input j, k, clear, preset, clk,
                output reg q)
;

always @(posedge clk or negedge preset or negedge clear) begin // active-low control signals
    if (preset & !clear) q <= 0;
    else if (!preset & clear) q <= 1;
    else begin case ({j,k})
                2'b00 : q <= q;
                2'b01 : q <= 0;
                2'b10 : q <= 1;
                2'b11 : q <= ~q;
        endcase
    end
end

endmodule