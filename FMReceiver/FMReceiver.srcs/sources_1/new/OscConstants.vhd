----------------------------------------------------------------------------------
--
-- Constants for FM receiver
--
-- OscConstants.vhd
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

package OscConstants is

    constant CLK_FREQ : natural := 200000000; -- 200 MHz clock 
    constant CLK_PERIOD : time := 5 ns; -- period of clock, for testbench 
    
    constant FREQ_STEP : natural := 200000; -- 200 khz between frequencies
    constant NUM_STATIONS : natural := 105; -- 104 total stations 
    
    constant ADC_BITS : natural := 15; -- ADC resolution, number of bits -1
    
    -- NCO constants
    -- constants for generating frequencies, depend on clock frequency 
    constant MAX_COUNT : natural := 40000; -- max NCO count -- TODO this might be doubled idk
    constant MAX_COUNT_BITS : natural := 15; -- max count bits - 1 --n atural(ceil(log2(real(MAX_COUNT)))) -1
    --constant COUNT0 : natural := 3637; -- first NCO multiple 
    --constant COUNT_STEP : natural := 80; -- steps between multiples 
    
    type CountArray is array(0 to NUM_STATIONS - 1) of natural; 
    constant COUNT_TABLE : CountArray := ( 
        3637, 3717, 3797, 3877, 3957, 4037, 4117, 4197, 4277, 4357, 4437,
        4517, 4597, 4677, 4757, 4837, 4917, 4997, 5077, 5157, 5237, 5317,
        5397, 5477, 5557, 5637, 5717, 5797, 5877, 5957, 6037, 6117, 6197,
        6277, 6357, 6437, 6517, 6597, 6677, 6757, 6837, 6917, 6997, 7077,
        7157, 7237, 7317, 7397, 7477, 7557, 7637, 7717, 7797, 7877, 7957,
        8037, 8117, 8197, 8277, 8357, 8437, 8517, 8597, 8677, 8757, 8837,
        8917, 8997, 9077, 9157, 9237, 9317, 9397, 9477, 9557, 9637, 9717,
        9797, 9877, 9957, 10037, 10117, 10197, 10277, 10357, 10437, 10517,
        10597, 10677, 10757, 10837, 10917, 10997, 11077, 11157, 11237, 11317,
        11397, 11477, 11557, 11637, 11717, 11797, 11877, 11957); 
        
    --constant FREQ0 : natural := 9092500; -- first LO freq for 87.1 MHz, aliased to 9.1 MHz
    

end package OscConstants;