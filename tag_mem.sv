// Content          : Tag memory
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.09.28

import memory_sub_system_param::*;

module tag_mem #(
    parameter byte INDEX_LEN        = INDEX_LENGTH,
    parameter byte TAG_LEN          = TAG_LENGTH,
    parameter integer NUM_CACHE_L   = NUM_CACHE_LINES
    )(
    input                       clk,  // TODO
    input                       resetn, //TODO
    input                       write,
    input [INDEX_LEN-1:0]       index,
    input [TAG_LEN-1:0]         tag_in,
    output [TAG_LEN-1:0]        tag_out
    );

    logic [NUM_CACHE_L-1:0][TAG_LEN-1:0] tag_memory;

    logic [TAG_LEN-1:0] tag_out;

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

