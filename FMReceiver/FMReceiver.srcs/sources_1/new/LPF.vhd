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
        Reset : in std_logic; 
        PhaseDown : in std_logic; 
        PhaseUp : in std_logic; 
        PhaseDownLPF : out std_logic_vector(ERR_BITS - 1 downto 0); 
        PhaseUpLPF : out std_logic_vector(ERR_BITS - 1 downto 0); 
        PhaseErr : out std_logic_vector(ERR_BITS downto 0) -- TODO numbits  
    );
end LoopFilter; 

architecture LPF of LoopFilter is 
    signal PhaseDown1 : std_logic_vector(1 downto 0); 
    signal PhaseUp1 : std_logic_vector(1 downto 0); 
    signal PhaseDownLPFI : std_logic_vector(ERR_BITS - 1 downto 0); 
    signal PhaseUpLPFI : std_logic_vector(ERR_BITS - 1 downto 0); 
	begin 
	
	-- TODO design filter (generalize?) 
	
	-- temporary basic LPF
--	process(Clk) 
--	begin 
--	   if rising_edge(Clk) then 
--	       PhaseDown1 <= PhaseDown; 
--	       PhaseUp1 <= PhaseUp; 
--	   end if; 
--	end process; 
--	--"average"
--	PhaseDownLPFI <= ('0' & PhaseDown1) + ('0' & PhaseDown); 
--	PhaseUpLPFI <= ('0' & PhaseUp1) + ('0' & PhaseUp); 
    PhaseUp1 <= '0' & PhaseUp;
    PhaseDown1 <= '0' & PhaseDown;
    
    CICUp : entity work.BPF
		  generic map(
            N   => 5, 
            R   => 512,
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
            R   => 512,
            BITS_IN => 1,
            BITS_OUT => ERR_BITS - 1
        )
        port map(
            SigIn   => PhaseDown1,
            Clk     => Clk, 
            Reset   => Reset,
            SigOut  => PhaseDownLPFI
        );
	
	-- combine up/down
	PhaseUpLPF <= std_logic_vector(PhaseUpLPFI); 
	PhaseDownLPF <= std_logic_vector(PhaseDownLPFI); 
	
	PhaseErr <= std_logic_vector(unsigned('1' & PhaseUpLPFI) - unsigned(PhaseDownLPFI)); 
	
	
end LPF; 