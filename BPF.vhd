----------------------------------------------------------------------------
-- 
-- Bandpass filter 
--
-- Cascaded integrator-comb filter implementation. 
-- This is a decimating CIC filter with N cascaded integrator stages
-- at the Clk input frequency, and N cascaded comb stages running 
-- at F(Clk)/R. 
--
-- Generic: 
--  N - number of integrator and comb stages
--  R - rate change factor
-- 
-- Inputs: 
--  SigIn   : std_logic_vector(ADC_BITS downto 0) - ADC_BITS-sized input signal to be filtered 
--  Clk     : std_logic - 1-bit original sampling clock 
--  Reset   : std_logic - 1-bit active low reset input 
--
-- Outputs: 
--  SigOut  : std_logic_vector - FILTER_BITS-sized filtered output signal 
--
-- Gate Count:  
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
use work.RecConstants.all;

entity BPF is 
    generic(
        N      : natural := FILTER_N;   -- number of integrator and comb stages
        R      : natural := FILTER_R;    -- rate change factor
        BITS_IN : natural := ADC_BITS;
        BITS_OUT : natural := FILTER_BITS
    );
    port(
        SigIn   : in std_logic_vector(BITS_IN downto 0); -- input signal to be filtered 
        Clk     : in std_logic;     -- original sampling clock 
        Reset   : in std_logic;     -- active low reset input 
        SigOut  : out std_logic_vector(BITS_OUT downto 0) -- filtered output signal 
    );
end BPF; 

architecture BPF of BPF is 
    -- intermediate signals 
    -- ceil(N log2 (RM) + Bin) - 1
    type SumArray is array(integer range <>) of unsigned(BITS_OUT downto 0); 
    signal IntS : SumArray (N downto 0);    -- integrator sums
    signal CombS : SumArray (N downto 0);   -- comb sums
    signal CombDelay : SumArray (N downto 0);   -- delay registers for comb 
    signal Count : unsigned(integer(ceil(log2(real(R))))-1 downto 0); -- counter for rate change R
    
	begin 

	-- N cascaded integrator stages; accumulate input 
	IntS(0)(BITS_IN downto 0) <= unsigned(SigIn);  -- initial integrator input is from input signal 
	IntS(0)(BITS_OUT downto BITS_IN + 1) <= (others => '0'); 
	Integrators : for x in 1 to N generate -- cascade N stages 
        process(Clk)
           begin  
            if Reset = '0' then 
                IntS(x) <= (others => '0'); -- set regs to zero if reset 
            elsif rising_edge(Clk) then 
                IntS(x) <= IntS(x-1) + IntS(x); -- integrator implementation  
            end if; 
        end process; 
    end generate; 
    
    -- Counter for decimated comb stages, which use every Rth sample 
    ClkDiv: process(Clk) 
        begin 
        if Reset = '0' then 
            Count <= (others => '0'); -- reset counter if reset 
        elsif rising_edge(Clk) then 
            Count <= Count + 1;     -- accumulate counter on clk edge
        end if; 
 
    end process; 
    
    -- N Comb stages 
    CombInit: process(Clk) -- assign initial inputs for comb stages 
        begin 
        if rising_edge(Clk) and Reset = '1' then 
            if Reset = '0' then 
                CombS(0) <= (others => '0');    -- set regs to zero if reset 
            elsif Count = (Count'range => '0') then -- enabled with counter to down-sample
                CombS(0) <= IntS(N);            -- input from integrator stages
            end if; 
        end if; 
    end process;  
    
    -- cascade comb stages; add delayed signal to itself 
	CombCas: for x in 1 to N generate 
	   CombS(x) <= CombS(x-1) - CombDelay(x-1);
	end generate; 
	
	-- regs for delayed comb signals 
	CombDelayGen: for x in 0 to N-1 generate
        process(Clk)
           begin  
            if Reset = '0' then 
                CombDelay(x) <= (others => '0');    -- set regs to zero if reset 
            elsif rising_edge(Clk) then
                if Count = (Count'range => '0') then  -- enabled with counter to down-sample
                    CombDelay(x) <= CombS(x);       -- store delayed comb inputs 
                end if; 
            end if; 
        end process; 
    end generate; 
    
    -- final comb stage output is the filtered signal 
    SigOut <= std_logic_vector(CombS(N)); 
    
end BPF; 