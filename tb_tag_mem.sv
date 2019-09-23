// Content          : Tag memory testbench
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.09.22

`timescale 1ns/100ps

import memory_sub_system_param::*;

module tb_tag_mem();
    reg                         clk;
    reg                         resetn;
    reg                         write;
    reg     [INDEX_LENGTH-1:0]  index;
    reg     [TAG_LENGTH-1:0]    tag_in;
    wire    [TAG_LENGTH-1:0]    tag_out;


    tag_mem tm0(
        .clk(clk),
        .resetn(resetn),
        .write(write),
        .index(index),
        .tag_in(tag_in),
        .tag_out(tag_out)
    );

    initial begin
        resetn  = 0;
        clk     = 0;

        #20

        resetn  = 1;

        write   = 1;
        index   = 1;
        tag_in  = 10;

        #20
        index   = 2;
        tag_in  = 15;

        #20
        write   = 0;
        index   = 1;

        $finish;
    end

    always
        #5 clk  = !clk;
endmodule

