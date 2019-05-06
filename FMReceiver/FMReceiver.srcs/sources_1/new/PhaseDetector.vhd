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
    
    --signal Count : unsigned(5 downto 0); 
    --signal Rise : std_logic; 
    signal SigIn1Deb : std_logic; 
	begin 
	
	-- debounce sigin1??
    SigDeb: process(Clk, SigIn1) 
        variable pressed: std_logic := '0'; --- '0' if button unpressed, '1' if pressed
        variable counter : integer range 0 to 10 := 0;
        begin 
        if rising_edge(clk) then 
        if (pressed = '0' and SigIn1 = '0' and counter /= 10) then
        counter := counter + 1;    
            if counter = 10 then
                pressed := '1';
            end if;
       
        elsif (pressed = '0' and SigIn1 = '1') then
            counter := 0;
       
        elsif (pressed = '1'  and SigIn1 = '1' and counter /= 10) then
            counter := counter + 1;    
            if counter = 10 then
                pressed := '0';
            end if;
           
        elsif(pressed = '1' and SigIn1 = '0') then
            counter := 0;
        end if;
        
        if Reset = '0' then 
            counter := 0; 
        end if; 
        end if; 
        SigIn1Deb <= not pressed; 
    end process; 
    
	
	PDReset <= SigIn1 and SigIn2; 
	--PhaseDown <= PhaseDownInt; 
	--PhaseUp <= PhaseUpInt; 
	
	process(SigIn2, Reset, PDReset) 
	   begin 
	   if Reset = '0' or PDReset = '1' then -- reset signal 
	       PhaseDown <= '0'; 
	   elsif rising_edge(SigIn2) then --and PDReset = '0' and Reset = '1' then 
	       PhaseDown <= '1'; -- set input active on signal edge 
	   end if; 
    end process; 
    
	-- typical phase detector implementation, 2 dffs 
	process(SigIn1Deb, Reset, PDReset) 
	   begin 
	   if Reset = '0' or PDReset = '1' then 
	       PhaseUp <= '0';
	   elsif rising_edge(SigIn1Deb) then-- and PDReset = '0' and Reset = '1' then 
	       PhaseUp <= '1'; -- set input active on signal edge 
	   end if;  
    end process; 

	   
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