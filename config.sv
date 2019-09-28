// Content          : Parameters for configuration
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.09.28

package memory_sub_system_param;
    localparam byte WORD_SIZE           = 32;       // 32bits

    localparam integer CACHE_SIZE       = 1024;     // 1kB
    localparam byte CACHE_LINE_SIZE     = 16;       // 128bits
    localparam integer NUM_CACHE_LINES  = CACHE_SIZE / CACHE_LINE_SIZE;

    localparam integer MEMORY_SIZE      = 64 * 1024;    // 64kB

    localparam byte ADDR_LENGTH     = $clog2(MEMORY_SIZE);      // Width of address bus
    localparam byte INDEX_LENGTH    = $clog2(NUM_CACHE_LINES);
    localparam byte TAG_LENGTH      = $clog2(MEMORY_SIZE / CACHE_SIZE);
    localparam byte OFFSET_LENGTH   = ADDR_LENGTH - INDEX_LENGTH - TAG_LENGTH;

endpackage

