----------------------------------------------------------------------------------
--
-- Test Bench for Mixer
--
-- Test Bench for FM Receiver Mixer/LO
--
--  Revision History:
--     04/29/19 Sophia Liu initial revision
--
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.OscConstants.all;

entity MixerTB is
end MixerTB;

architecture TB_ARCH of MixerTB is

    -- test components
    component LO is
        port(
            Clk         : in  std_logic; -- System clock 
            Reset       : in std_logic; -- Active low reset input
            FControl    : in  std_logic_vector(6 downto 0); -- Frequency control 
            FOut        : out  std_logic; -- Oscillator output
            CountOut    : out std_logic_vector(MAX_COUNT_BITS downto 0) -- output counter for testing
        );
    end component;

    component Mixer is 
        port(
            RF    :  in  std_logic_vector(ADC_BITS downto 0); -- RF input 
            LO    :  in  std_logic; -- Local oscillator input
            Clk   :  in  std_logic; -- System clock
    
            IFOut :  out  std_logic_vector(ADC_BITS downto 0) -- Mixed intermediate frequency output 
        );
    end component; 
    
    -- Signal used to stop clock signal generators
    signal  END_SIM  :  BOOLEAN := FALSE;
    signal  Clk     : std_logic; -- system clock

    -- internal signals
    signal Reset        : std_logic;
    signal FControl     : std_logic_vector(6 downto 0); 
    signal FOut         : std_logic; 
    signal CountOut     : std_logic_vector(MAX_COUNT_BITS downto 0);
    signal RF           : std_logic_vector(ADC_BITS downto 0); -- RF input 
    signal IFOut        : std_logic_vector(ADC_BITS downto 0); -- Mixed intermediate frequency output 

begin
    -- test components
    UUT : LO
        port map(
            Clk         => Clk, 
            Reset       => Reset, 
            FControl    => FControl, 
            FOut        => FOut, 
            CountOut    => CountOut
        );

    UUTM : Mixer 
        port map(
            RF    => RF,  
            LO    => FOut, 
            Clk   => Clk,
            IFOut => IFOut
        );
        
        process
            variable  i  :  integer;        -- general loop indices
            variable  j  :  integer;

            begin

            -- have not yet started
            Reset <= '0';
            FControl <= (others => '0'); 
            wait for CLK_PERIOD * 10;

            Reset <= '1'; 
            wait for CLK_PERIOD * 1000;
            
            Reset <= '0'; 
            wait for CLK_PERIOD;
            Reset <= '1'; 
             
            FControl <= std_logic_vector(to_unsigned(100, FControl'length)); 
            wait for CLK_PERIOD * 1000;
            
--            for i in 0 to 100 loop
--                -- check output data
--                assert (DataOutTest77 = TestCycle577(i*2 + 1))
--                     report  "Mesh 7x7 failure; Initial : " & integer'image(to_integer(unsigned(TestCycle577(i*2))))
--                     & "     Final : "  &  integer'image(to_integer(unsigned(DataOutTest77)))
--                     & "     Correct : " & integer'image(to_integer(unsigned(TestCycle577(i*2 + 1))))
--                     & "     Test Number : " & integer'image(i)
--                     severity  ERROR;
--            end loop;

 

            END_SIM <= true;
            wait;
        end process;

        -- process for generating system clock
        CLOCK_CLK : process
        begin
            -- this process generates a CLK_PERIOD ns 50% duty cycle clock
            -- stop the clock when the end of the simulation is reached
            if END_SIM = FALSE then
                CLK <= '0';
                wait for CLK_PERIOD/2;
            else
                wait;
            end if;

            if END_SIM = FALSE then
                CLK <= '1';
                wait for CLK_PERIOD/2;
            else
                wait;
            end if;
        end process;

end TB_ARCH;

configuration TESTBENCH_FOR_MIXER of MixerTB is
    for TB_ARCH
		  for UUT : LO
            use entity work.LO;
        end for;
        for UUTM : Mixer
            use entity work.Mixer;
        end for;
    end for;
end TESTBENCH_FOR_MIXER;