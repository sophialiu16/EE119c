----------------------------------------------------------------------------------
--
-- Constants for FM receiver
--
-- RecConstants.vhd
--
-- This file contains constants for the FM receiver implementation
--
-- Revision History:
-- 04/27/19 Sophia Liu Initial revision
--
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all; 

package RecConstants is

    constant CLK_FREQ : natural := 200000000; -- 200 MHz system clock 
    constant CLK_PERIOD : time := 5 ns; -- period of clock, for testbench 
    
    constant FREQ_STEP : natural := 200000; -- 200 khz between frequencies
    constant NUM_STATIONS : natural := 101; -- 100 total stations, 88.1 to 108.1 MHz 
    
    constant ADC_BITS : natural := 15; -- ADC resolution, number of bits -1
    
    -- CIC filter constants 
    --maximum number of filter bits needed, numbits = ceil(N log2 (RM) + Bin) = 40
    constant FILTER_BITS : natural := 39; -- numbits - 1
    constant FILTER_N : natural := 3; -- number of stages
    constant FILTER_M : natural := 1; -- diff delay 
    constant FILTER_R : natural := 256; -- rate change 
    
    -- Oscillator constants; depend on system clock frequency 
    constant MAX_COUNT : natural := 500; -- max oscillator count 
    constant MAX_COUNT_BITS : natural := 9; -- numbits - 1 to achieve max count without wrapping
    
    -- LUT for oscillator counter 
    type CountArray is array(0 to NUM_STATIONS - 1) of natural; 
    constant COUNT_TABLE : CountArray := ( 
        50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 
        61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 
        72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 
        83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 
        94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 
        104, 105, 106, 107, 108, 109, 110, 111, 112, 
        113, 114, 115, 116, 117, 118, 119, 120, 121, 
        122, 123, 124, 125, 126, 127, 128, 129, 130, 
        131, 132, 133, 134, 135, 136, 137, 138, 139, 
        140, 141, 142, 143, 144, 145, 146, 147, 148, 
        149, 150);

    -- TODO generalize
    -- Oscillator constants; depend on system clock frequency 
    constant MAX_COUNT_2 : natural := 30000; -- max oscillator count 
    constant MAX_COUNT_BITS_2 : natural := 14; -- numbits - 1 to achieve max count without wrapping
    
    -- LUT for oscillator counter 
    type CountArray2 is array(0 to 31) of natural; 
    constant COUNT_TABLE_2 : CountArray2 := ( 
        --7, 8, 9,
        10, 11, 12, 13, 14, 15, 16, 17, 
        18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 
        28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41);
    --40000 - 5-25 
end package RecConstants;