----------------------------------------------------------------------------
-- 
-- Receiver Entity
--
-- Description
--
-- Ports:
--
-- Revision History:
-- 04/29/19 Sophia Liu Initial revision
--
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

library work; 
use work.OscConstants.all; 

entity Receiver is 
        port(
            Clk         : in  std_logic; -- System clock 
            Reset       : in std_logic; -- Active low reset input
            FControl    : in  std_logic_vector(6 downto 0); -- Frequency control 
            FOut        : out  std_logic; -- Oscillator output
            CountOut    : out std_logic_vector(MAX_COUNT_BITS downto 0) -- output counter for testing
        );
end Receiver; 