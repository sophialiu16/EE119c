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
    --signal PhaseDownInt : std_logic;
    --signal PhaseUpInt   : std_logic; 
    signal PDReset : std_logic; 
    
    signal SigIn1Deb : std_logic; 
    signal DebCount1 : unsigned(3 downto 0);
    signal SigIn2Deb : std_logic; 
    signal DebCount2 : unsigned(3 downto 0); 
    constant MAX_DEB_COUNT : natural:= 3;  
	begin 
	
	-- TODO input signal seems to glitch
    SigDeb1: process(Clk, SigIn1) 
        begin 
        if rising_edge(Clk) then 
            if Reset = '0' then  
                DebCount1 <= (others => '0');  
            elsif SigIn1Deb = SigIn1 then 
                DebCount1 <= (others => '0'); 
            elsif DebCount1 = MAX_DEB_COUNT  then 
                SigIn1Deb <= SigIn1; 
        	elsif SigIn1Deb /= SigIn1 then 
                DebCount1 <= DebCount1 + 1; 			
            end if; 
        end if; 
    end process; 
    
    SigDeb2: process(Clk, SigIn2) 
        begin 
        if rising_edge(Clk) then 
            if Reset = '0' then  
                DebCount2 <= (others => '0');  
            elsif SigIn2Deb = SigIn2 then 
                DebCount2 <= (others => '0'); 
            elsif DebCount2 = MAX_DEB_COUNT  then 
                SigIn2Deb <= SigIn2; 
        	elsif SigIn2Deb /= SigIn2 then 
                DebCount2 <= DebCount2 + 1; 			
            end if; 
        end if; 
    end process; 
	
	PDReset <= SigIn1 and SigIn2; 
	--PhaseDown <= PhaseDownInt; 
	--PhaseUp <= PhaseUpInt; 
	
	-- typical phase detector implementation, 2 dffs
	process(SigIn1Deb, Reset, PDReset) 
	   begin 
	   if Reset = '0' or PDReset = '1' then 
	       PhaseUp <= '0';
	   elsif rising_edge(SigIn1Deb) then-- and PDReset = '0' and Reset = '1' then 
	       PhaseUp <= '1'; -- set input active on signal edge 
	   end if;  
    end process; 
    
	process(SigIn2, Reset, PDReset) 
	   begin 
	   if Reset = '0' or PDReset = '1' then -- reset signal 
	       PhaseDown <= '0'; 
	   elsif rising_edge(SigIn2) then --and PDReset = '0' and Reset = '1' then 
	       PhaseDown <= '1'; -- set input active on signal edge 
	   end if; 
    end process;
	   
	-- TODO mix, n bit, zero cross
end Arch; 