module MuxBeh4_1 (  input [3:0] in,
                    input [1:0] S,
                    output out)
;

assign out = (S == 2'd0) ? in[0] : (S == 2'd1) ? in[1] : (S == 2'd2) ? in[2] : (S == 2'd3) ? in[3] : 0;

endmodule

module Mux_7seg (   input [3:0] BCD,
                    output a, b, c, d, e, f, g)
;

wire w1, w2, w3, w4, w5, w6, w7, w8, w9;

assign w1 = BCD[0] & ~BCD[1];
assign w2 = ~BCD[0] & ~BCD[1];
assign w3 = BCD[0] ^ BCD[1];
assign w4 = ~BCD[0] & BCD[1];
assign w5 = ~(BCD[0] ^ BCD[1]);
assign w6 = BCD[0] | ~BCD[1];
assign w7 = BCD[0] | BCD[1];
assign w8 = BCD[0] & BCD[1];
assign w9 = ~BCD[1];

MuxBeh4_1 A (.in({1'b0, 1'b0, w2, w1}), .S(BCD[3:2]), .out(a));
MuxBeh4_1 B (.in({1'b0, 1'b0, w3, 1'b0}), .S(BCD[3:2]), .out(b));
MuxBeh4_1 C (.in({1'b0, 1'b0, 1'b0, w4}), .S(BCD[3:2]), .out(c));
MuxBeh4_1 D (.in({1'b0, BCD[0],w5, w1}), .S(BCD[3:2]), .out(d));
MuxBeh4_1 E (.in({1'b0, BCD[0], w6, BCD[0]}), .S(BCD[3:2]), .out(e));
MuxBeh4_1 F (.in({1'b0, 1'b0, w8, w7}), .S(BCD[3:2]), .out(f));
MuxBeh4_1 G (.in({1'b0, 1'b0, w8, w9}), .S(BCD[3:2]), .out(g));

endmodule