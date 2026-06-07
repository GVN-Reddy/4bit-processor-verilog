module register_file(

    input clk,
    input rst,

    input we,

    input [1:0] write_addr,
    input [3:0] write_data,

    input [1:0] read_addr1,
    input [1:0] read_addr2,

    output [3:0] read_data1,
    output [3:0] read_data2,
    
    output [3:0] r0,
output [3:0] r1,
output [3:0] r2,
output [3:0] r3

);

reg [3:0] registers [0:3];

integer i;

always @(posedge clk or posedge rst)
begin

    if(rst)
begin

    registers[0] <= 4'd5;
    registers[1] <= 4'd3;
    registers[2] <= 4'd2;
    registers[3] <= 4'd1;

end

    else if(we)
    begin
        registers[write_addr] <= write_data;
    end

end

assign read_data1 = registers[read_addr1];
assign read_data2 = registers[read_addr2];

assign r0 = registers[0];
assign r1 = registers[1];
assign r2 = registers[2];
assign r3 = registers[3];
endmodule