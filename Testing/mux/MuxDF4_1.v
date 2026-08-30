module MuxDF4_1 (   input [3:0] in,
                    input [1:0] S,
                    output out)
;

assign out = (~S[0] & ~S[1] & in[0]) | (S[0] & ~S[1] & in[1]) | (~S[0] & S[1] & in[2]) | (S[0] & S[1] & in[3]);

endmodule