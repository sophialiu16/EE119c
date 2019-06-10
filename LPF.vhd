----------------------------------------------------------------------------
-- 
-- Loop Filter
--
-- Low pass filter architecture implementation for phase error.
--
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
        Clk   :  in  std_logic; -- sample clock input  
        Reset : in std_logic;   -- active low system reset 
        PhaseDown : in std_logic; -- phase down error 
        PhaseUp : in std_logic;     -- phase up error
        PhaseErr : out std_logic_vector(ERR_BITS downto 0)  -- filtered combined phase error
    );
end LoopFilter; 

architecture LPF of LoopFilter is 
    -- intermediate signals  
    signal PhaseDownLPFI : std_logic_vector(ERR_BITS - 1 downto 0); 
    signal PhaseUpLPFI : std_logic_vector(ERR_BITS - 1 downto 0); 
    signal PhaseErrI : std_logic_vector(ERR_BITS downto 0);
    
	begin 
    
    -- LPF for up/down phases
    LPFUP : entity work.FIRLPF
		  generic map(
            N   => LPF_N
        )
        port map(
            SigIn   => PhaseUp,
            Clk     => Clk, 
            Reset   => Reset,
            SigOut  => PhaseUpLPFI
        );
        
    LPFDown : entity work.FIRLPF
		  generic map(
            N   => LPF_N
        )
        port map(
            SigIn   => PhaseDown,
            Clk     => Clk, 
            Reset   => Reset,
            SigOut  => PhaseDownLPFI
        );
	
	-- combine filtered up/down for phase error
	PhaseErr <= std_logic_vector(unsigned('1' & PhaseUpLPFI) - unsigned(PhaseDownLPFI)); 
	
end LPF; 