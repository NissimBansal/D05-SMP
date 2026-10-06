module tr_cntr (input [7:0] din,
                input reset, clk, init,
                output reg [7:0] q)
;

wire q7n = ~q[7];
always @(posedge clk or negedge init or negedge reset) begin
    if (!reset & init) q <= 7'b0;
    else if (reset & !init) q <= din;
    else q <= {q[6:0],q7n};
end

endmodule