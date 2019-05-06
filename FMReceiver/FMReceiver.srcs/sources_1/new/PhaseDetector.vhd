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
        PhaseDown : out std_logic; 
        PhaseUp : out std_logic--(FILTER_BITS downto 0) -- num clock diff for zero crossings 
    );
end PhaseDetector; 

architecture Arch of PhaseDetector is 
    signal PhaseDownInt : std_logic; 
    signal PhaseUpInt   : std_logic; 
    signal PDReset : std_logic; 
    -- counter size? max diff 75khz
    --signal PrevSigIn1 : std_logic_vector(FILTER_BITS downto 0); -- sigin from last clock 
    --signal PrevSigIn2 : std_logic_vector(FILTER_BITS downto 0); -- freqin from last clock 
	begin 
	
	-- typical phase detector implementation, 2 dffs 
	process(SigIn1) 
	   begin 
	   if rising_edge(SigIn1) and PDReset = '0' then 
	       PhaseDownInt <= '1'; -- set input active on signal edge 
	   end if; 
	   
	   if PDReset = '1' then -- reset signal 
	       PhaseDownInt <= '0'; 
	   end if; 
    end process; 
	
	process(SigIn2) 
	   begin 
	   if rising_edge(SigIn2) and PDReset = '0' then 
	       PhaseUpInt <= '1'; -- set input active on signal edge 
	   end if; 
	   
	   if PDReset = '1' then -- reset signal 
	       PhaseUpInt <= '0'; 
	   end if; 
    end process; 
    
	PDReset <= PhaseDownInt and PhaseUpInt; 
	PhaseDown <= PhaseDownInt; 
	PhaseUp <= PhaseUpInt; 
--	   process(Clk) 
--	       begin 
--	       if rising_edge(Clk) then 
--	           PrevSigIn1 <= SigIn1; 
--	           PrevSigIn2 <= SigIn2; 
--	       end if; 
--	   end process; 
	   
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