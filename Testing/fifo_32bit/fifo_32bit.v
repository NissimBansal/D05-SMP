module fifo_32bit #(parameter DEPTH = 8) 
                    (   input clk, reset, re, we, 
                        input [31:0] datain,
                        output reg [31:0] dataout,
                        output reg [$clog2(DEPTH)-1:0] wptr, rptr, 
                        output empty, full)
;

reg [31:0] fifo [DEPTH-1:0];

initial dataout <= 32'h0;

always @ (posedge clk) begin
    if (~reset) wptr <= 0;
    else if (we & ~full) begin 
            fifo[wptr] <= datain;
            wptr <= wptr + 1'b1;
    end
end

always @ (posedge clk) begin
    if (~reset) rptr <= 0;
    else if (re & ~empty) begin 
            dataout <= fifo[rptr];
            rptr <= rptr + 1;
    end
end

assign empty = ~|(wptr ^ rptr);
assign full = ~|((wptr + 1'b1) ^ rptr);

endmodule