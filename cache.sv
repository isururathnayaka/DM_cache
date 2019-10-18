// Content          : Cache memory
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.09.28

import memory_sub_system_param::*;

module cache #(
    parameter byte INDEX_LEN        = INDEX_LENGTH,
    parameter byte OFFSET_LEN       = OFFSET_LENGTH,
    parameter byte WORD_S           = WORD_SIZE,
    parameter integer NUM_CACHE_L   = NUM_CACHE_LINES,
    parameter integer CACHE_L_SIZE  = CACHE_LINE_SIZE
    )(
    input                       clk,  // TODO
    input                       resetn, //TODO
    input                       select,
    input                       write,
    input [INDEX_LEN-1:0]       index,
    input [OFFSET_LEN-1:0]      offset,
    //input [CACHE_L_SIZE-1:0]    din,
    input [WORD_S-1:0]          mem_write,
    input [CACHE_L_SIZE-1:0]    mem_read,
    output [CACHE_L_SIZE-1:0]   dout
    );

    localparam WORD_OFFSET = ;      // offset for word write in case of a cache write TODO

    logic [NUM_CACHE_L-1:0][CACHE_L_SIZE-1:0] cache_memory;

    logic [CACHE_L_SIZE-1:0] dout;

    always_ff @(posedge clk)
    begin
        if (!resetn) begin      // synchronous reset
            cache_memory = 0;
        end
        else begin
            if (write) begin
                cache_memory[index] = din;
                if (select) begin
                    cache_memory     = mem_read;     // select == 1, memory read
                end
                else begin
                    cache_memory[]     = mem_write;    // memory write TODO
                end
            end
            else begin
                dout = cache_memory[index];
            end
        end
    end
endmodule

