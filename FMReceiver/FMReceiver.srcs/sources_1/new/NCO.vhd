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
        Clk         : in  std_logic;    -- 1-bit system clock 
        Reset       : in std_logic;     -- 1-bit active low reset input
        FAdd        : in  std_logic_vector(ERR_BITS downto 0); -- accumulating input from phase error 
        FOutPLL     : out  std_logic   -- 1-bit oscillator output
    );
end NCO; 

architecture NCO of NCO is 
    signal FControl : unsigned(FCONT_BITS downto 0);    -- frequency control 
	signal Count : unsigned(MAX_COUNT_BITS_PLL downto 0); -- counts up to generate various frequencies
	signal SigOut : std_logic;                         -- intermediate output signal 
	
	--signal DivCount : unsigned(4 downto 0); 
	constant ERRDIV : natural := ERR_BITS - 5; -- use divided phase error input 
	
	begin 

	process(clk)
	   begin
	   if rising_edge(Clk) and Reset = '1' then 
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
	           if FControl < unsigned(not FAdd(ERR_BITS - 1 downto ERRDIV)) then
	               FControl <= (others => '0'); 
	           else 
	               FControl <= FControl - (unsigned(not FAdd(ERR_BITS - 1 downto ERRDIV))); -- TODO 
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
	   if Reset = '0' then 
	       -- reset counter and output signal on reset 
	       Count <= (others => '0'); 
	       SigOut <= '0'; 
	       FControl <= to_unsigned(12000, FControl'length); -- TODO reset to center frequency
	   end if; 
    end process;
    
    FOutPLL <= SigOut; -- output generated square wave
	
	--	-- divided b/c frequency changing too quickly 
--    ClkDiv: process(Clk) 
--        begin 
--        if Reset = '0' then 
--            DivCount <= (others => '0'); -- reset counter if reset 
--        elsif rising_edge(Clk)  then 
--            DivCount <= DivCount + 1;     -- accumulate counter on clk edge
--        end if; 
--    end process; 
end NCO; 