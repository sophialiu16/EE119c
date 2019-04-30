----------------------------------------------------------------------------
-- 
-- Numerically Controlled Oscillator
-- Local Oscillator 
--
-- Description
--
-- Ports:
--
-- Revision History:
-- 04/27/19 Sophia Liu Initial revision
-- 04/27/19 Sophia Liu Updated comments
--
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

library work; 
use work.OscConstants.all; 

entity LO is 
        port(
            Clk         : in  std_logic; -- System clock 
            Reset       : in std_logic; -- Active low reset input
            FControl    : in  std_logic_vector(6 downto 0); -- Frequency control 
            FOut        : out  std_logic; -- Oscillator output
            CountOut    : out std_logic_vector(MAX_COUNT_BITS downto 0) -- output counter for testing
        );
end LO; 

architecture LO of LO is 
    -- generates square wave with frequency starting at 9.0925 MHz 
	signal Count : unsigned(MAX_COUNT_BITS downto 0); 
	signal SigOut : std_logic; 
	begin 
	
	process(clk)
	   begin
	   if rising_edge(Clk) and Reset = '1' then 
	       --Count <= Count + to_unsigned(COUNT_TABLE(to_integer(unsigned(FControl))), Count'length);
	       
	       -- check if count wrapped (be sure it hasn't automatically wrapped, depending on max_cnt)
	       if Count + to_unsigned(COUNT_TABLE(to_integer(unsigned(FControl))), Count'length) > MAX_COUNT then 
	           -- wrap count, switch output
	           Count <= Count + to_unsigned(COUNT_TABLE(to_integer(unsigned(FControl))), Count'length) - MAX_COUNT; 
	           SigOut <= not(SigOut); 
	       else 
	           Count <= Count + to_unsigned(COUNT_TABLE(to_integer(unsigned(FControl))), Count'length); 
	       end if; 
	       
	   end if;     
	   if Reset = '0' then 
	       -- reset counter on reset 
	       Count <= (others => '0'); 
	       SigOut <= '0'; 
	   end if; 
    end process;
    FOut <= SigOut; 
    CountOut <= std_logic_vector(Count); 
	
end LO; 