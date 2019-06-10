----------------------------------------------------------------------------
-- 
-- Sample Clock Oscillator
--
-- This oscillator outputs a 39 MHz square wave for the sample clock 
-- by dividing down the system clock. 
--
-- Inputs: 
--  Clk         : std_logic - 1-bit system clock 
--  Reset       : std_logic - 1-bit active low reset input
-- 
-- Outputs: 
--  SClk        : std_logic - 1-bit sample clock oscillator output
--
-- Revision History:
-- 05/11/19 Sophia Liu Initial revision
--
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

library work; 
use work.RecConstants.all; 

entity SampleOsc is 
    port(
        Clk         : in  std_logic;    -- 1-bit system clock 
        Reset       : in std_logic;     -- 1-bit active low reset input 
        SClk        : out  std_logic   -- 1-bit sample clock output
    );
end SampleOsc; 

architecture NCO of SampleOsc is 
	signal Count : unsigned(SCLK_MAX_COUNT_BITS - 1 downto 0); 
	signal SigOut : std_logic; 	
	begin 
	
	process(clk)
	   begin
	   if Reset = '0' then  
	       Count  <= (others => '0'); 
	       SigOut <= '0'; 
	   elsif rising_edge(Clk) then 
	       -- Check if the counter has passed the maximum accumulation value 
	       if Count + SCLK_MULT > SCLK_MAX_COUNT then 
	           -- if it has, wrap the counter and switch the square wave output value 
	           Count <= Count + SCLK_MULT - SCLK_MAX_COUNT; 
	           SigOut <= not(SigOut); 
	       else 
	           -- otherwise continue to accumulate counter 
	           Count <= Count + SCLK_MULT; 
	       end if; 
	   end if; 
    end process;
    
    SClk <= SigOut; -- output generated square wave
	
end NCO; 