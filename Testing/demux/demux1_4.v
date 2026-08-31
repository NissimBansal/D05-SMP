module demux1_4 (   input [7:0] data,
                    input [1:0] S,
                    output [7:0] Ch0, Ch1, Ch2, Ch3)
;

assign Ch0 = (S == 2'b00) ? data : 0;
assign Ch1 = (S == 2'b01) ? data : 0;
assign Ch2 = (S == 2'b10) ? data : 0;
assign Ch3 = (S == 2'b11) ? data : 0;

endmodule