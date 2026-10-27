module ser_add_mealy(	input clk, clear, X, Y, 
						output reg Z);
	localparam IDLE = 1'b0, C = 1'b1;
	reg[1:0] CS, NS;
	
	always @(posedge clk or negedge clear) begin
		if (!clear) CS <= IDLE;
		else CS <= NS;
	end
	
	always @(*) begin
		Z=1'b0;
		case (CS)
			IDLE: begin
				case({X,Y})
					2'b00: NS = IDLE;
					2'b01, 2'b10: begin 
						NS = IDLE;
						Z=1'b1;
					end
					2'b11: NS = C;
				endcase
			end
			C: begin
				case({X,Y})
					2'b00: begin
						NS = IDLE;
						Z=1'b1;
					end
					2'b01, 2'b10: NS = C;
					2'b11: begin
						NS = C;
						Z=1'b1;
					end
				endcase
			end
		endcase
	end
endmodule