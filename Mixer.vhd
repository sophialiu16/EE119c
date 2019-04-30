----------------------------------------------------------------------------
-- 
-- Mixer
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

entity Mixer is 
        port(
            RF    :  in  std_logic_vector(ADC_BITS downto 0); -- RF input 
            LO    :  in  std_logic; -- Local oscillator input
            Clk   :  in  std_logic; -- System clock
            
            IFOut :  out  std_logic_vector(ADC_BITS downto 0) -- Mixed intermediate frequency output 
        );
end Mixer; 

architecture Mixer of Mixer is 
	begin 
	
	process(Clk)
	   begin  
		if rising_edge(Clk) then 
		  -- switching mixer
		  if LO = '1' then 
		      -- multiply signal by 1, no modification
		      IFOut <= RF; 
		  elsif LO = '0' then  
		      -- multiply signal by "-1", invert signal
		      if RF(ADC_BITS) = '1' then 
		          IFOut <= std_logic_vector(unsigned(RF) - ADC_ZERO);
		      else 
		          IFOut <= std_logic_vector(unsigned(RF) + ADC_ZERO); 
		      end if; 
		  else 
		      IFOUT <= (others => 'X'); -- for simulation 
		  end if;  
		-- mix down to baseband
		-- center frequency 7500 
		end if; 
	end process; 
end Mixer; 