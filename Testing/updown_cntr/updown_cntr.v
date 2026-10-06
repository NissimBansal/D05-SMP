module updown_cntr (input [3:0] din,
                    input clear, preset, clk, load, mode,
                    output reg [3:0] q)
;

always @(posedge clk) begin
    if (preset & !clear & load) q <= 4'b0;
    else if (!preset & clear & load) q <= 4'b1111;
    else if (preset & clear & !load) q <= din;
    else if (mode) q <= q + 1;
    else q <= q - 1;
end

endmodule