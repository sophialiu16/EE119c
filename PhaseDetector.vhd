----------------------------------------------------------------------------
-- 
-- Phase detector
--
-- Takes two 1-bit inputs and outputs 1-bit up and down phase errors. 
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
        SigIn1 :  in  std_logic;-- Signal input 1  
        SigIn2 :  in  std_logic;-- Signal input 2, changing freq  
        Clk   :  in  std_logic; -- Sample clock input  
        Reset : in std_logic; -- active low system reset 
        PhaseDown : out std_logic; -- leading phase error (decrease freq)
        PhaseUp : out std_logic   -- lagging phase error (increase freq)
    );
end PhaseDetector; 

architecture Arch of PhaseDetector is 
    signal PhaseDownInt : std_logic; -- delayed phase down
    signal PhaseUpInt   : std_logic; -- delayed phase up 
    signal PhaseDown0 : std_logic;  -- intermediate phase down
    signal PhaseUp0   : std_logic;  -- intermediate phase up 
    signal PDReset : std_logic;     -- reset for phase err dffs
    --signal DivCount : unsigned(1 downto 0); -- larger delay for phase reset 
    
    signal SigIn1Deb : std_logic; -- less noisy signal 1 input 
    signal DebCount1 : unsigned(3 downto 0);
    signal SigIn2Deb : std_logic; -- less noise signal 2 input 
    signal DebCount2 : unsigned(3 downto 0); 
    constant MAX_DEB_COUNT : natural:= 3;  
	begin 
	
	-- TODO 
	-- debouncers b/c input signal seems to glitch
    SigDeb1: process(Clk, SigIn1, Reset) 
        begin 
        if Reset = '0' then 
            DebCount1 <= (others => '0');
        elsif rising_edge(Clk) then 
            if SigIn1Deb = SigIn1 then  
                DebCount1 <= (others => '0');  
            elsif DebCount1 = MAX_DEB_COUNT  then 
                SigIn1Deb <= SigIn1; 
        	elsif SigIn1Deb /= SigIn1 then 
                DebCount1 <= DebCount1 + 1; 			
            end if; 
        end if; 
    end process; 
    SigDeb2: process(Clk, SigIn2, Reset) 
        begin 
        if Reset = '0' then 
            DebCount2 <= (others => '0'); 
        elsif rising_edge(Clk) then 
            if SigIn2Deb = SigIn2 then  
                DebCount2 <= (others => '0');  
            elsif DebCount2 = MAX_DEB_COUNT  then 
                SigIn2Deb <= SigIn2; 
        	elsif SigIn2Deb /= SigIn2 then 
                DebCount2 <= DebCount2 + 1; 			
            end if; 
        end if; 
    end process; 
	
	PDReset <= PhaseDownInt and PhaseUpInt; 
	PhaseDown <= PhaseDown0; 
	PhaseUp <= PhaseUp0; 
	
    -- counter for phase reset delay 
--    ClkDiv: process(Clk) 
--        begin 
--        if Reset = '0' then 
--            DivCount <= (others => '0'); -- reset counter if reset 
--        elsif rising_edge(Clk)  then 
--            DivCount <= DivCount + 1;     -- accumulate counter on clk edge
--        end if; 
--    end process; 
    
    -- delay for phase reset
     process(Clk) 
        begin 
        if rising_edge(Clk) then-- and DivCount = 0 then 			
            PhaseDownInt <= PhaseDown0; 
            PhaseUpInt <= PhaseUp0; 
        end if; 
    end process; 
	
	-- typical phase detector implementation, 2 dffs
	process(SigIn1Deb, Reset, PDReset) 
	   begin 
	   if Reset = '0' or PDReset = '1' then 
	       PhaseUp0 <= '0';
	   elsif rising_edge(SigIn1Deb) then --Deb) then 
	       PhaseUp0 <= '1'; -- set phase err active on sig1 edge 
	   end if;  
    end process; 
    
	process(SigIn2Deb, Reset, PDReset) 
	   begin 
	   if Reset = '0' or PDReset = '1' then -- reset signal 
	       PhaseDown0 <= '0'; 
	   elsif rising_edge(SigIn2Deb) then 
	       PhaseDown0 <= '1'; -- set phase active on sig2 edge 
	   end if; 
    end process;
end Arch; 