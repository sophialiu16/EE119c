----------------------------------------------------------------------------
-- 
-- Phase detector
--
-- Desc
--
-- Inputs: 
--
-- Outputs: 
--
-- 
-- Gate Count: 
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

entity PhaseDetector is 
    port(
        SigIn1 :  in  std_logic;--_vector(FILTER_BITS downto 0); -- Signal input 1  
        SigIn2 :  in  std_logic;--_vector(FILTER_BITS downto 0); -- Signal input 2, changing freq  
        Clk   :  in  std_logic; -- system ( sample?) clock input  
        Reset : in std_logic; -- active low system reset 
        PhaseDown : out std_logic; 
        PhaseUp : out std_logic --(FILTER_BITS downto 0) -- num clock diff for zero crossings 
    );
end PhaseDetector; 

architecture Arch of PhaseDetector is 
    signal PhaseDownInt : std_logic;
    signal PhaseUpInt   : std_logic; 
    signal PDReset : std_logic; 
	begin 
	
	-- typical phase detector implementation, 2 dffs 
	process(SigIn1, Reset, PDReset) 
	   begin 
	   if Reset = '0' or PDReset = '1' then 
	       PhaseUpInt <= '0';
	   elsif rising_edge(SigIn1) then-- and PDReset = '0' and Reset = '1' then 
	       PhaseUpInt <= '1'; -- set input active on signal edge 
	   end if;  
    end process; 
	
	process(SigIn2, Reset, PDReset) 
	   begin 
	   if Reset = '0' or PDReset = '1' then -- reset signal 
	       PhaseDownInt <= '0'; 
	   elsif rising_edge(SigIn2) then --and PDReset = '0' and Reset = '1' then 
	       PhaseDownInt <= '1'; -- set input active on signal edge 
	   end if; 
    end process; 
    
	PDReset <= SigIn1 and SigIn2; 
	PhaseDown <= PhaseDownInt; 
	PhaseUp <= PhaseUpInt; 

	   
	-- TODO  
	-- PhaseOut(FILTER_BITS) <= SigIn1(FILTER_BITS) xor SigIn2; 
	-- sync clock 
	-- look for rising edge of sigin -> have to determine  
	-- PrevSigIn1(FILTER_BITS) != SigIn1(FILTER_BITS)  
	-- wait until rising edge of phase in sig 
	-- count zero crossings per sigin? 
	
	-- TODO possibly mix 
	
	-- TODO more than 1 bit? 
end Arch; 