----------------------------------------------------------------------------
-- 
-- Loop Filter
--
-- Low pass filter for phase error. Not sure if it does much right now. 
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
        Clk   :  in  std_logic; -- sample clock input  
        Reset : in std_logic;   -- active low system reset 
        PhaseDown : in std_logic; -- phase down error 
        PhaseUp : in std_logic;     -- phase up error
        PhaseDownLPF : out std_logic_vector(ERR_BITS - 1 downto 0); -- filtered phase down, for testing
        PhaseUpLPF : out std_logic_vector(ERR_BITS - 1 downto 0); -- filtered phase up, for testing
        PhaseErr : out std_logic_vector(ERR_BITS downto 0)  -- filtered combined phase error
    );
end LoopFilter; 

architecture LPF of LoopFilter is 
    -- intermediate signals 
    signal PhaseDown1 : std_logic_vector(1 downto 0); 
    signal PhaseUp1 : std_logic_vector(1 downto 0); 
    signal PhaseDownLPFI : std_logic_vector(ERR_BITS - 1 downto 0); 
    signal PhaseUpLPFI : std_logic_vector(ERR_BITS - 1 downto 0); 
	begin 
	-- assigning intermediate signals
    PhaseUp1 <= '0' & PhaseUp;
    PhaseDown1 <= '0' & PhaseDown;
    
    -- LPF for up/down phases
    CICUp : entity work.BPF
		  generic map(
            N   => 5, 
            R   => 16,
            BITS_IN => 1,
            BITS_OUT => ERR_BITS - 1
        )
        port map(
            SigIn   => PhaseUp1,
            Clk     => Clk, 
            Reset   => Reset,
            SigOut  => PhaseUpLPFI
        );
        
    CICDown : entity work.BPF
		  generic map(
            N   => 5, 
            R   => 16,
            BITS_IN => 1,
            BITS_OUT => ERR_BITS - 1
        )
        port map(
            SigIn   => PhaseDown1,
            Clk     => Clk, 
            Reset   => Reset,
            SigOut  => PhaseDownLPFI
        );
	
	-- combine filtered up/down for phase error
	PhaseUpLPF <= std_logic_vector(PhaseUpLPFI); 
	PhaseDownLPF <= std_logic_vector(PhaseDownLPFI); 
	PhaseErr <= std_logic_vector(unsigned('1' & PhaseUpLPFI) - unsigned(PhaseDownLPFI)); 
	
	
end LPF; 