----------------------------------------------------------------------------
-- 
-- Type 1 linear phase FIR filter
--
-- Low pass filter implementation
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

entity FIRLPF is 
    generic(
        N : natural := LPF_N  -- order of filter (even)
    );
    port(
        Clk     :  in  std_logic;   -- sample clock input  
        Reset   : in std_logic;     -- active low system reset 
        SigIn : in std_logic;     -- phase up error
        SigOut : out std_logic_vector(ERR_BITS - 1 downto 0)  -- filtered combined phase error
    );
end FIRLPF; 

architecture FIR of FIRLPF is 
    type SumArray is array(integer range <>) of unsigned(ERR_BITS - 1 downto 0); 
    signal IntS : SumArray(N downto 0);    -- integrator sums
    signal RegN : SumArray(N downto 0);
	begin 

	-- avg N+1 samples 
	RegN(0) <= (0 => SigIn, others => '0');  
	Integrators : for x in 1 to N generate -- cascade N stages 
        process(Clk)
           begin  -- ended with coeffs = 1 
            if Reset = '0' then  
                RegN(x) <= (others => '0'); 
                IntS(x) <= (others => '0'); -- set regs to zero if reset  
            elsif rising_edge(Clk) then 
                RegN(x) <= RegN(x-1); 
                IntS(x) <= RegN(x) + RegN(x-1);-- + RegN(x); -- accumulate regs  
            end if; 
        end process; 
    end generate; 
    SigOut <= std_logic_vector(IntS(N)); 
	
end FIR; 