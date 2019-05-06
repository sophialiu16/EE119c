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

entity LoopFilter is 
    port(
        Clk   :  in  std_logic; -- system ( sample?) clock input  
        PhaseDown : in std_logic; 
        PhaseUp : in std_logic; 
        PhaseDownLPF : out std_logic_vector(1 downto 0); 
        PhaseUpLPF : out std_logic_vector(1 downto 0); 
        PhaseErr : out std_logic_vector(3 downto 0) -- TODO numbits  
    );
end LoopFilter; 

architecture LPF of LoopFilter is 
	begin 
	
	-- TODO design filter (generalize?) 
	
	-- temporary basic LPF
	process(Clk) 
	begin 
	   
	end process; 
end LPF; 