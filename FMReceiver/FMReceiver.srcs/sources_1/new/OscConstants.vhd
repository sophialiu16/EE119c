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
    constant ADC_ZERO : unsigned(ADC_BITS downto 0) := (ADC_BITS => '0', others => '1'); -- mid-point, or zero point, of adc 
    
    -- NCO constants
    -- constants for generating frequencies, depend on clock frequency 
    constant MAX_COUNT : natural := 1000; -- max NCO count 
    constant MAX_COUNT_BITS : natural := 10; -- max count bits - 1 --natural(ceil(log2(real(MAX_COUNT)))) - 1
                                                -- 2048
    
    type CountArray is array(0 to NUM_STATIONS - 1) of natural; 
    constant COUNT_TABLE : CountArray := ( 
        91, 93, 95, 97, 99, 101, 103, 105, 107, 109, 111, 113, 
        115, 117, 119, 121, 123, 125, 127, 129, 131, 133, 135, 
        137, 139, 141, 143, 145, 147, 149, 151, 153, 155, 157, 
        159, 161, 163, 165, 167, 169, 171, 173, 175, 177, 179, 
        181, 183, 185, 187, 189, 191, 193, 195, 197, 199, 201, 
        203, 205, 207, 209, 211, 213, 215, 217, 219, 221, 223, 
        225, 227, 229, 231, 233, 235, 237, 239, 241, 243, 245, 
        247, 249, 251, 253, 255, 257, 259, 261, 263, 265, 267, 
        269, 271, 273, 275, 277, 279, 281, 283, 285, 287, 289, 
        291, 293, 295, 297, 299); 
        
    --constant FREQ0 : natural := 9092500; -- first LO freq for 87.1 MHz, aliased to 9.1 MHz
    

end package OscConstants;