module ser_add_moore(	input clk, clear, X, Y, 
						output reg Z);

	localparam IDLE = 2'b00, S = 2'b01, C = 2'b10, SC = 2'b11;
	reg[1:0] CS, NS;
	
	always @(posedge clk or negedge clear) begin
		if (!clear) CS <= IDLE;
		else CS <= NS;
	end
	
	always @(*) begin
		Z=1'b0;
		case (CS)
			IDLE, S: begin
				if (CS == S) Z = 1'b1;
				case({X,Y})
					2'b00: NS = IDLE;
					2'b01, 2'b10: NS = S;
					2'b11: NS = C;
				endcase
			end
			C, SC: begin
				if (CS == SC) Z = 1'b1;
				case({X,Y})
					2'b00: NS = S;
					2'b01, 2'b10: NS = C;
					2'b11: NS = SC;
				endcase
			end
		endcase
	end
endmodule