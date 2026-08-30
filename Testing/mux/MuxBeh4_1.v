module MuxBeh4_1 (  input [3:0] in,
                    input [1:0] S,
                    output out)
;

assign out = (S == 2'd0) ? in[0] : (S == 2'd1) ? in[1] : (S == 2'd2) ? in[2] : (S == 2'd3) ? in[3] : 0;

endmodule