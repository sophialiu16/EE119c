----------------------------------------------------------------------------
-- 
-- Mixer
--
-- Frequency mixer for FM receiver. The n-bit RF input is switched using  
-- a 1-bit LO input to create an IF output with frequencies 
-- F(RF) + F(LO) and F(RF) - F(LO). Runs using a sampling clock Clk. 
--
-- Inputs: 
--  RF    : std_logic_vector - ADC_BITS-sized radio frequency input 
--  LO    : std_logic - 1-bit local oscillator input
--  Clk   : std_logic - 1-bit clock input 
--
-- Outputs: 
--  IFOut :  std_logic_vector - Mixed intermediate frequency output 
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

entity Mixer is 
    port(
        RF    :  in  std_logic_vector(ADC_BITS downto 0); -- Radio frequency input 
        LO    :  in  std_logic; -- Local oscillator input
        Clk   :  in  std_logic; -- Sampling clock input 
        IFOut :  out  std_logic_vector(ADC_BITS downto 0) -- Mixed intermediate frequency output 
    );
end Mixer; 

architecture Mixer of Mixer is 
	begin 
	process(Clk)
	   begin  
		if rising_edge(Clk) then 
		  if LO = '1' then 
		      -- multiply signal by 1, no modification
		      IFOut <= RF; 
		  elsif LO = '0' then  
		  	   -- multiply signal by "-1", invert signal
		      IFOut <= not(RF);
		  else 
		      IFOUT <= (others => 'X'); -- for simulation 
		  end if;  
		end if; 
	end process; 
end Mixer; 