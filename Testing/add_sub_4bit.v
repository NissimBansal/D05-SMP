module add_sub_4bit (   input a,
                        input b,
                        input cin,
                        output out,
                        output cout)
;

assign out = a ^ b ^ cin;
assign cout = ( a & b ) | ( a & cin ) | ( b & cin );
endmodule