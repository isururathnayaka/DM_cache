// Content          : Parameters for configuration
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.09.22

package memory_sub_system_param;
    localparam WORD_SIZE        = 32;       // 32bits

    localparam CACHE_SIZE       = 1024;     // 1kB
    localparam CACHE_LINE_SIZE  = 16;       // 128bits
    localparam NUM_CACHE_LINES  = CACHE_SIZE / CACHE_LINE_SIZE;

    localparam MEMORY_SIZE      = 64 * 1024;    // 64kB

    localparam ADDR_LENGTH      = $clog2(MEMORY_SIZE);      // Width of address bus
    localparam INDEX_LENGTH     = $clog2(NUM_CACHE_LINES);
    localparam TAG_LENGTH       = $clog2(MEMORY_SIZE / CACHE_SIZE);
    localparam OFFSET_LENGTH    = ADDR_LENGTH - INDEX_LENGTH - TAG_LENGTH;

endpackage

