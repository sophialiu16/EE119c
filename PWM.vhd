----------------------------------------------------------------------------
-- 
-- PWM Audio Converter 
--
-- Outputs a pulse width modulated signal given a vector signal input. 
--
-- Revision History:
-- 05/21/19 Sophia Liu Initial revision
--
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

library work; 
use work.RecConstants.all; 

entity PWM is 
        port(
            Clk         : in  std_logic; -- Original sampling clock 
            Reset       : in std_logic; -- Active low reset input
            SigIn       : in std_logic_vector(FCOUNT_BITS downto 0); -- frequency demodulated (audio) input, sampled at Clk
            PWMOut      : out std_logic  -- pulse modulated output 
  
        );
end PWM; 

architecture behavioral of PWM is
    signal SigInDiv : unsigned(9 downto 0); --for simulation purposes
    signal PWMCount : unsigned(9 downto 0); 
    signal SampledSig : unsigned(9 downto 0); 
    begin 
        SigInDiv <= unsigned(SigIn(FCOUNT_BITS downto FCOUNT_BITS - 9)); 
        -- sample at 8 KHz (TODO)
        -- uses 39 MHz original sample clock 
        -- 14 bit input ->  divide down to max 12 bit
        -- divide down to 10 bits 
        
        -- counter for PWM
        process(Clk) 
            begin
                if Reset = '0' then 
                    PWMCount <= (others => '0'); 
                elsif rising_edge(Clk) then 
                    PWMCount <= PWMCount + 1; 
                    if PWMCount > to_unsigned(CountArrayPLL'length - 1, FCOUNT_BITS + 1)(FCOUNT_BITS downto FCOUNT_BITS - 9) then 
                        PWMCount <= (others => '0');
                        SampledSig <= SigInDiv;
                    end if; 
                end if; 
        end process; 
        
        -- generate PWM output 
        -- '1' when counter is less than signal input value, '0 when greater 
        PWMOut <= '1' when PWMCount < SigInDiv else 
                  '0'; 

end architecture behavioral; 