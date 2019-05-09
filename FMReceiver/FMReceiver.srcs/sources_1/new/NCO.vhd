----------------------------------------------------------------------------
-- 
-- Loop Filter
--
-- Desc
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
        FAdd        : in  std_logic_vector(ERR_BITS downto 0); -- accumulating input 
        FOutPLL     : out  std_logic   -- 1-bit oscillator output
    );
end NCO; 

architecture NCO of NCO is 
    signal FControl : unsigned(ERR_BITS - 1 downto 0);--FCONT_BITS downto 0);
	signal Count : unsigned(MAX_COUNT_BITS_2 downto 0); 
	signal SigOut : std_logic; 
	
	signal DivCount : unsigned(2 downto 0); 
	
	begin 
	    -- divided b/c frequency changing too quickly 
    ClkDiv: process(Clk) 
        begin 
        if Reset = '0' then 
            DivCount <= (others => '0'); -- reset counter if reset 
        elsif rising_edge(Clk)  then 
            DivCount <= DivCount + 1;     -- accumulate counter on clk edge
        end if; 

    end process; 
    
	process(clk)
	   begin
	   if rising_edge(Clk) and Reset = '1' then 
	       -- accumulate control 
	       -- TODO convert to signed, direct add 
	       if DivCount = 0 then --TODO slow increments
	       if FAdd(2) = '1' then --and (FControl < 25810) then --TODO gen
	           if to_integer(FControl) + to_integer(unsigned(FAdd(ERR_BITS - 1 downto 0))) >= CountArray2'length then 
	               FControl <= to_unsigned(CountArray2'length - 1, FControl'length); 
	           else 
	               FControl <= FControl + (unsigned(FAdd(ERR_BITS - 1 downto 0))); --TODO up/down input
	           end if; 
	           
	       elsif FAdd(2) = '0' and FControl > 2 then 
	           if to_integer(FControl) - to_integer(unsigned(not FAdd(ERR_BITS - 1 downto 0))) < 0 then
	               FControl <= (others => '0'); 
	           else 
	               FControl <= FControl - (unsigned(not FAdd(ERR_BITS - 1 downto 0))); 
	           end if; 
	       end if; 
	       end if; 
	       
	        Count <= Count + to_unsigned(COUNT_TABLE_2(to_integer(FControl)), Count'length); 
	        
	       -- Check if the counter has passed the maximum accumulation value 
	       if Count <= to_unsigned(COUNT_TABLE_2(to_integer(FControl)), Count'length) then 
	           -- if it has, switch the square wave output value 
	           SigOut <= not(SigOut); 
	       end if; 
	       
	   end if;     
	   if Reset = '0' then 
	       -- reset counter and output signal on reset 
	       Count <= (others => '0'); 
	       SigOut <= '0'; 
	       FControl <= to_unsigned(12000, FControl'length);--(FControl'length - 1 => '1', others => '0'); -- set to center freq 
	   end if; 
    end process;
    
    FOutPLL <= SigOut; -- output generated square wave
	
end NCO; 