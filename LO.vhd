----------------------------------------------------------------------------
-- 
-- Local Oscillator 
--
-- This oscillator outputs a square wave from 9.0 MHz to 29.0 MHz, 
-- in steps of 200 KHz. FControl is used to control the frequency 
-- output. It is implemented as a simple numerically controlled oscillator,
-- and it accumulates a frequency control value at each clock.
--
-- Inputs: 
--  SClk        : std_logic - 1-bit sample clock 
--  Clk         : std_logic - 1-bit system clock 
--  Reset       : std_logic - 1-bit active low reset input
--  FControl    : std_logic_vector - 6-bit frequency control input 
-- 
-- Outputs: 
--  FOut        : std_logic - 1-bit oscillator output
--  CountOut    : std_logic_vector - MAX_COUNT_BITS-sized accumulator
--
-- Gate Count:  
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
use work.RecConstants.all; 

entity LO is 
    port(
        SClk        : in std_logic;     -- 1-bit sample clock 
        Clk         : in std_logic;    -- 1-bit system clock 
        Reset       : in std_logic;     -- 1-bit active low reset input
        FControl    : in std_logic_vector(6 downto 0); -- 6-bit frequency control input 
        FOut        : out std_logic;   -- 1-bit oscillator output
        CountOut    : out std_logic_vector(MAX_COUNT_BITS downto 0) -- MAX_COUNT_BITS-sized accumulator
    );
end LO; 

architecture LO of LO is 

	signal Count : unsigned(MAX_COUNT_BITS downto 0); -- counter for NCO
	signal SigOut : std_logic;     -- intermediate output signal  
	signal FOutInt: std_logic;     -- intermediate synchronized output signal 
	begin 
	
	process(Clk)
	   begin
	   if Reset = '0' then 
	       -- reset counter and output signal on reset 
	       Count <= (others => '0'); 
	       SigOut <= '0'; 
	   elsif rising_edge(Clk) then 
	       -- Check if the counter has passed the maximum accumulation value 
	       if Count + to_unsigned(COUNT_TABLE(to_integer(unsigned(FControl))), Count'length) > MAX_COUNT then 
	           -- if it has, wrap the counter and switch the square wave output value 
	           Count <= Count + to_unsigned(COUNT_TABLE(to_integer(unsigned(FControl))), Count'length) - MAX_COUNT; 
	           SigOut <= not(SigOut); 
	       else 
	           -- otherwise continue to accumulate counter 
	           Count <= Count + to_unsigned(COUNT_TABLE(to_integer(unsigned(FControl))), Count'length); 
	       end if;        
	   end if;     
    end process;
	
	-- synchronize lo with sample clock to interface with rest of system
	process(SClk)
	   begin 
	   if rising_edge(SClk) then 
	       FOutInt <= SigOut; 
	       FOut <= FOutInt; 
	   end if;  
	end process;  
	
end LO; 