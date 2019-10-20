// Content          : Tag memory testbench
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.10.20

`timescale 1ns/100ps

import memory_sub_system_param::*;

module tb_cache();
    logic                       clk;
    logic                       resetn;
    logic                       select;
    logic                       write;
    logic   [INDEX_LENGTH-1:0]  index;
    logic   [OFFSET_LENGTH-1:0]    offset;
    logic   [WORD_SIZE-1:0]        mem_write;
    logic   [CACHE_LINE_SIZE-1:0]  mem_read;
    wire    [CACHE_LINE_SIZE-1:0]  dout;


    cache cm0(
        .clk(clk),
        .resetn(resetn),
        .select(select),
        .write(write),
        .index(index),
        .offset(offset),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .dout(dout)
    );

    initial begin
        resetn  = 0;
        clk     = 0;

        #20

        resetn  = 1;
        write   = 1;

        for (int i=0; i<NUM_CACHE_LINES; i++) begin
            #20
            index   = i;
            offset  = i % (OFFSET_LENGTH ** 2);
            select  = i % 2;
            mem_write   = $urandom_range(1, WORD_SIZE ** 2);
            mem_read    = $urandom_range(1, CACHE_LINE_SIZE ** 2);
        end

        #20

        write   = 0;
        for (int i=0; i<NUM_CACHE_LINES; i++) begin
            #20
            index   = i;
        end

        $finish;
    end

    always
        #5 clk  = !clk;
endmodule

