module fa ( input a,
            input b,
            input cin,
            output sum,
            output cout)
;

assign sum = a ^ b ^ cin;
assign cout = ( a & b ) | ( a & cin ) | ( b & cin );

endmodule

module add_gen4bit (input [3:0] a,
                    input [3:0] b,
                    input cin,
                    output [3:0] sum,
                    output cout)
;

wire [3:0] ci, co;

assign ci[0] = cin;
assign cout = co[3];
assign ci[1] = co[0];
assign ci[2] = co[1];
assign ci[3] = co[2];

genvar i;

generate
    for (i = 0; i < 4; i = i + 1) begin
        fa u0(a[i], b[i], ci[i], sum[i], co[i]);
    end
endgenerate

endmodule