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
        FAdd        : in  std_logic_vector(2 downto 0); -- accumulating input 
        FOutPLL     : out  std_logic   -- 1-bit oscillator output
    );
end NCO; 

architecture NCO of NCO is 
    signal FControl : unsigned(4 downto 0); --TODO 
	signal Count : unsigned(MAX_COUNT_BITS_2 downto 0); 
	signal SigOut : std_logic; 
	
	begin 
	
	process(clk)
	   begin
	   if rising_edge(Clk) and Reset = '1' then 
	       -- accumulate control 
	       -- TODO convert to signed, direct add 
	       if FAdd(2) = '1' and (FControl < 29) then --TODO gen
	           FControl <= FControl + unsigned(FAdd(1 downto 0)); -- TODO wraps
	           
	       elsif FAdd(2) = '0' and FControl > 2 then 
	           FControl <= FControl - unsigned(not FAdd(1 downto 0)); --TODO swap aa
	       end if; 
	       
	       -- Check if the counter has passed the maximum accumulation value 
	       if Count + to_unsigned(COUNT_TABLE_2(to_integer(unsigned(FControl))), Count'length) > MAX_COUNT_2 then 
	           -- if it has, wrap the counter and switch the square wave output value 
	           Count <= Count + to_unsigned(COUNT_TABLE_2(to_integer(unsigned(FControl))), Count'length) - MAX_COUNT_2; 
	           SigOut <= not(SigOut); 
	       else 
	           -- otherwise continue to accumulate counter 
	           Count <= Count + to_unsigned(COUNT_TABLE_2(to_integer(unsigned(FControl))), Count'length); 
	       end if; 
	       
	   end if;     
	   if Reset = '0' then 
	       -- reset counter and output signal on reset 
	       Count <= (others => '0'); 
	       SigOut <= '0'; 
	       FControl <= (4 => '1', others => '0'); -- set to center freq 
	   end if; 
    end process;
    
    FOutPLL <= SigOut; -- output generated square wave
	
end NCO; 