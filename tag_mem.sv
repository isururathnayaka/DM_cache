// Content          : Tag memory
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.09.22

import memory_sub_system_param::*;

module tag_mem(
    input                       clk,  // TODO
    input                       resetn, //TODO
    input                       write,
    input [INDEX_LENGTH-1:0]    index,
    input [TAG_LENGTH-1:0]      tag_in,
    output [TAG_LENGTH-1:0]     tag_out
    );

    reg [NUM_CACHE_LINES-1:0][TAG_LENGTH-1:0] tag_memory;

    reg [TAG_LENGTH-1:0] tag_out;

    always_ff @(posedge clk)
    begin
        if (!resetn) begin      // synchronous reset
            tag_memory = 0;
        end
        else begin
            if (write) begin
                tag_memory[index] = tag_in;
            end
            else begin
                tag_out = tag_memory[index];
            end
        end
    end
endmodule

