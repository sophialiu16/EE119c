----------------------------------------------------------------------------
-- 
-- NCO 
--
-- Oscillator for PLL. Adds to a frequency control value using a phase 
-- error input, and accumulates that value to generate frequencies 
-- from 25 kHz to 175 kHz. 
--
-- Inputs: 
--
-- Outputs: 
--
-- Revision History:
-- 05/04/19 Sophia Liu Initial revision
--
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

library work; 
use work.RecConstants.all; 

entity NCO is 
    port(
        Clk         : in std_logic;    -- 1-bit sample clock 
        Reset       : in std_logic;     -- 1-bit active low reset input
        FAdd        : in std_logic_vector(ERR_BITS downto 0); -- accumulating input from phase error 
        FOutPLL     : out std_logic;   -- 1-bit oscillator output
        FControlOut : out std_logic_vector(FCOUNT_BITS downto 0)
    );
end NCO; 

architecture NCO of NCO is 
    signal FControl : unsigned(FCOUNT_BITS downto 0);    -- frequency control 
	signal Count : unsigned(MAX_COUNT_BITS_PLL downto 0); -- counts up to generate various frequencies
	signal SigOut : std_logic;                         -- intermediate output signal 
	
	--signal DivCount : unsigned(4 downto 0); 
	constant ERRDIV : natural := 0; -- use divided phase error input 
	
	begin 
    FControlOut <= std_logic_vector(FControl); 
	process(clk)
	   begin
	   if Reset = '0' then 
	       -- reset counter and output signal on reset 
	       Count <= (others => '0'); 
	       SigOut <= '0'; 
	       FControl <= to_unsigned(7000, FControl'length); -- TODO reset to center frequency
	   elsif rising_edge(Clk) then 
	       -- modify frequency control based on phase error
	       
	       if FAdd(ERR_BITS) = '1' then -- increase with positive phase error 
	           -- max out frequency control to maximum LUT value 
	           if FControl + (unsigned(FAdd(ERR_BITS - 1 downto ERRDIV))) >= CountArrayPLL'length then 
	               FControl <= to_unsigned(CountArrayPLL'length - 1, FControl'length); 
	           else 
	               FControl <= FControl + (unsigned(FAdd(ERR_BITS - 1 downto ERRDIV))); 
	           end if; 
	           
	       elsif FAdd(ERR_BITS) = '0' then -- decrease with negative phase error
	           -- bottom out frequency control to 0  
	           if FControl < unsigned(not (FAdd(ERR_BITS - 1 downto ERRDIV))) then
	               FControl <= (others => '0'); 
	           else 
	               FControl <= FControl - (unsigned(not (FAdd(ERR_BITS - 1 downto ERRDIV)))); -- TODO 
	           end if; 
	       end if;  
	       
	       -- increment counter, indexing lookup table with frequency control
	        Count <= Count + to_unsigned(COUNT_TABLE_PLL(to_integer(FControl)), Count'length); 
	        
	       -- Check if the counter has passed the maximum accumulation value 
	       if Count <= to_unsigned(COUNT_TABLE_PLL(to_integer(FControl)), Count'length) then 
	           -- if it has, switch the square wave output value 
	           SigOut <= not(SigOut); 
	       end if; 
	       
	   end if;     

    end process;
    
    FOutPLL <= SigOut; -- output generated square wave
end NCO; 