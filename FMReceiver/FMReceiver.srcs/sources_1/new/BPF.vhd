----------------------------------------------------------------------------
-- 
-- Bandpass filter 
--
-- CIC and compensation filter 
--
-- Ports:
--
-- Revision History:
-- 05/01/19 Sophia Liu Initial revision
--
----------------------------------------------------------------------------

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
use ieee.math_real.all;

library work; 
use work.OscConstants.all;

entity BPF is 
        generic(
            N      : natural := FILTER_N; -- number of int, comb stages
            R      : natural := FILTER_R -- rate change

        );
        port(
            SigIn   : in std_logic_vector(ADC_BITS downto 0); -- Mixed IF input 
            Clk     : in std_logic; -- Sampling clock 
            Reset   : in std_logic; 
            --SClk  :  in std_logic; -- Sampling clock 
            SigOut  : out std_logic_vector(FILTER_BITS downto 0) -- filtered output
        );
end BPF; 

architecture BPF of BPF is 
    -- numbits = ceil(N log2 (RM) + Bin) = 37
    type SumArray is array(integer range <>) of unsigned(FILTER_BITS downto 0); 
    signal IntS : SumArray (N downto 0);
    signal CombS : SumArray (N downto 0);
    signal CombDelay : SumArray (N downto 0);
    signal Count : unsigned(integer(ceil(log2(real(R))))-1 downto 0); -- count up to rate change R
    
	begin 
	-- CIC filter
	-- N cascaded integrator stages at fs
	-- decimator R
	-- N cascased comb stages at fs/R 
	
	-- N integrator stages 
	IntS(0)(ADC_BITS downto 0) <= unsigned(SigIn);  
	IntS(0)(FILTER_BITS downto ADC_BITS + 1) <= (others => '0'); 
	Integrators : for x in 1 to N generate 
        process(Clk)
           begin  
            if rising_edge(Clk) and Reset = '1' then 
                IntS(x) <= IntS(x-1) + IntS(x);   
            end if; 
            if Reset = '0' then 
                IntS(x) <= (others => '0'); 
            end if; 
        end process; 
    end generate; 
    
    -- decimate: take every Rth sample 
    ClkDiv: process(Clk) 
        begin 
        if rising_edge(Clk) and Reset = '1' then 
            Count <= Count + 1; 
        end if; 
        if Reset = '0' then 
            Count <= (others => '0'); 
        end if; 
    end process; 
    
    -- N Comb stages 
    
    CombInit: process(Clk) -- assign initial input 
        begin 
        if rising_edge(Clk) and Reset = '1' then 
            if Count = (Count'range => '0') then 
                CombS(0) <= IntS(N);
                --CombDelay(0) <= CombS(0); 
            end if; 
            if Reset = '0' then 
                CombS(0) <= (others => '0'); -- unnecessary
            end if; 
        end if; 
    end process;  
     
	CombCas: for x in 1 to N generate 
	   CombS(x) <= CombS(x-1) - CombDelay(x-1);
	end generate; 
	
	CombDelayGen: for x in 0 to N-1 generate
        process(Clk)
           begin  
            if rising_edge(Clk) and Reset = '1' then
                if Count = (Count'range => '0') then  
                    CombDelay(x) <= CombS(x);
                end if; 
            end if; 
            if Reset = '0' then 
                CombDelay(x) <= (others => '0'); 
            end if; 
        end process; 

    end generate; 
    
    SigOut <= std_logic_vector(CombS(N)); 
    
end BPF; 