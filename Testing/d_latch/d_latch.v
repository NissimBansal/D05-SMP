module d_latch (input d, en,
                output reg q)
;

always @(en or d) begin
    if (en) q <= d;
end

endmodule