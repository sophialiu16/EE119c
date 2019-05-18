----------------------------------------------------------------------------------
--
-- Test Bench for Mixer
--
-- Test Bench for FM Receiver front-end mixer and filter. Uses several 
-- test signal input vectors. 
--
--  Revision History:
--     04/29/19 Sophia Liu initial revision
--
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work; 
use work.RecConstants.all;
use work.TestVectors.all;

entity MixerTB is
end MixerTB;

architecture TB_ARCH of MixerTB is

    -- test components
    component SampleOsc is
        port(
            Clk         : in  std_logic;    -- 1-bit system clock 
            Reset       : in std_logic;     -- 1-bit active low reset input 
            SClk        : out  std_logic   -- 1-bit sample clock output
        );
    end component;
    
    component LO is
        port(
            SClk        : in std_logic;     -- 1-bit sample clock 
            Clk         : in  std_logic;    -- 1-bit system clock 
            Reset       : in std_logic;     -- 1-bit active low reset input
            FControl    : in  std_logic_vector(6 downto 0); -- 6-bit frequency control input 
            FOut        : out  std_logic;   -- 1-bit oscillator output
            CountOut    : out std_logic_vector(MAX_COUNT_BITS downto 0) -- MAX_COUNT_BITS-sized accumulator
        );
    end component;

    component Mixer is 
        port(
            RF    :  in  std_logic_vector(ADC_BITS downto 0); -- Radio frequency input 
            LO    :  in  std_logic; -- Local oscillator input
            Clk   :  in  std_logic; -- Sampling clock input 
            IFOut :  out  std_logic_vector(ADC_BITS downto 0) -- Mixed intermediate frequency output 
        );
    end component; 
    
    component BPF is 
        generic(
            N      : natural := FILTER_N;   -- number of integrator and comb stages
            R      : natural := FILTER_R;    -- rate change factor
            BITS_IN : natural := ADC_BITS;
            BITS_OUT : natural := FILTER_BITS
        );
        port(
            SigIn   : in std_logic_vector(ADC_BITS downto 0); -- input signal to be filtered 
            Clk     : in std_logic;     -- original sampling clock 
            Reset   : in std_logic;     -- active low reset input 
            SigOut  : out std_logic_vector(FILTER_BITS downto 0) -- filtered output signal 
        ); 
    end component;
    
    component PhaseDetector is 
        port(
            SigIn1 :  in  std_logic;--_vector(FILTER_BITS downto 0); -- Signal input 1  
            SigIn2 :  in  std_logic;--_vector(FILTER_BITS downto 0); -- Signal input 2, changing freq  
            Clk   :  in  std_logic; -- system ( sample??) clock input  
            Reset : in std_logic;
            PhaseDown : out std_logic; 
            PhaseUp : out std_logic --(FILTER_BITS downto 0) -- num clock diff for zero crossings 
        );
    end component; 
    
    component LoopFilter is 
        port(
            Clk   :  in  std_logic; -- system ( sample?) clock input  
            Reset : in std_logic; 
            PhaseDown : in std_logic; 
            PhaseUp : in std_logic; 
            --PhaseDownLPF : out std_logic_vector(ERR_BITS - 1 downto 0); 
            --PhaseUpLPF : out std_logic_vector(ERR_BITS - 1 downto 0); 
            PhaseErr : out std_logic_vector(ERR_BITS downto 0) 
        );
    end component; 

    component NCO is 
        port(
            Clk         : in std_logic;    -- 1-bit sample clock 
            Reset       : in std_logic;     -- 1-bit active low reset input
            FAdd        : in std_logic_vector(ERR_BITS downto 0); -- accumulating input 
            FOutPLL     : out std_logic   -- 1-bit oscillator output
        );
    end component; 

    -- Signal used to stop clock signal generators
    signal  END_SIM  :  BOOLEAN := FALSE;
    signal  Clk     : std_logic; -- system clock
    signal  SClk    :  std_logic; 
    -- internal signals
    signal Reset        : std_logic;
    signal FControl     : std_logic_vector(6 downto 0); 
    signal FOut         : std_logic; 
    signal CountOut     : std_logic_vector(MAX_COUNT_BITS downto 0);
    signal RF           : std_logic_vector(ADC_BITS downto 0); -- RF input 
    signal IFOut        : std_logic_vector(ADC_BITS downto 0); -- Mixed intermediate frequency output 
    signal FilterOut    : std_logic_vector(FILTER_BITS downto 0); -- filtered IF signal
    
    --signal SigIn1 : std_logic_vector(FILTER_BITS downto 0); 
    --signal SigIn2 : std_logic;
    --signal PhaseOut : std_logic_vector(FILTER_BITS downto 0);
    signal PhaseUp : std_logic; 
    signal PhaseDown : std_logic;
    
    signal Sig1 : std_logic; 
    --signal PhaseDownLPF : std_logic_vector(ERR_BITS - 1 downto 0); 
    --signal PhaseUpLPF : std_logic_vector(ERR_BITS - 1 downto 0); 
    signal PhaseErr : std_logic_vector(ERR_BITS downto 0);
    
    signal FOutPLL : std_logic;
    --signal PDReset : std_logic; 

begin
    -- test components
    UUTSO  : SampleOsc 
        port map(
            Clk     => Clk,
            Reset   => Reset,
            SClk    => SClk
        );
    
    UUT : LO
        port map(
            SClk        => SClk,
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
            Clk   => SClk,
            IFOut => IFOut
        );
        
    UUTF: BPF 
        generic map(
            N   => FILTER_N, 
            R   => FILTER_R,
            BITS_IN => ADC_BITS,
            BITS_OUT => FILTER_BITS
        )
        port map(
            SigIn   => IFOut,
            Clk     => SClk, 
            Reset   => Reset,
            SigOut  => FilterOut
        );
        
    UUTP: PhaseDetector 
        port map (
        SigIn1 => FilterOut(FILTER_BITS),
        SigIn2 => FOutPLL,  
        Clk   => SClk, 
        Reset => Reset, 
        PhaseDown => PhaseDown,
        PhaseUp => PhaseUp
    );
        Sig1 <= FilterOut(FILTER_BITS);
    
    UUTF2: LoopFilter
        port map(
            Clk         => SClk,  
            Reset       => Reset, 
            PhaseDown   => PhaseDown, 
            PhaseUp     => PhaseUp, 
            --PhaseDownLPF    => PhaseDownLPF, 
            --PhaseUpLPF      => PhaseUpLPF,
            PhaseErr        => PhaseErr
        );
    
    UUTNCO: NCO 
        port map(
            Clk     => SClk, 
            Reset   => Reset, 
            FAdd    => PhaseErr,
            FOutPLL  => FOutPLL
        );
        process
            variable  i  :  integer;        -- general loop indices
            variable  j  :  integer;

            variable TestSig : real; 
            
            begin

            -- have not yet started
            Reset <= '0';
            FControl <= (others => '0'); 
            RF <= (others => '0'); 
            wait for CLK_PERIOD * 10;

            -- test 10 MHz osc
            Reset <= '1'; 
            wait for CLK_PERIOD * 1000;
            
            -- test 30 MHz osc
            Reset <= '0'; 
            FControl <= std_logic_vector(to_unsigned(100, FControl'length));
            wait for CLK_PERIOD;
            Reset <= '1'; 
            wait for CLK_PERIOD * 1000;
            
            -- 10.1 MHz carrier test signal 
            --Reset <= '0'; 
            FControl <= (others => '0'); 
            wait for CLK_PERIOD;
            
            -- catch up to sclk edge ?
            
            --Reset <= '1'; 
            for j in 0 to 5 loop 
            for i in 0 to Test101'length - 1 loop
                --wait until rising_edge(SClk)
                -- shift and quantize test input from [-1, 1] to 16 bits
                TestSig := Test101(i)*(2.0**(15)-1.0);
                TestSig := TestSig + (2.0**(15)-1.0); 
                RF <= std_logic_vector(to_unsigned(natural(TestSig), 16)); 
                wait for SAMPLE_CLK_PERIOD;
            end loop; 
            end loop; 
            
            -- 13.3 MHz carrier test signal 
            FControl <= std_logic_vector(to_unsigned(16, FControl'length)); 
            wait for CLK_PERIOD; 
            for j in 0 to 2 loop
            for i in 0 to Test133'length - 1 loop
                --wait until rising_edge(SClk)
                -- shift and quantize test input from [-1, 1] to 16 bits
                TestSig := Test133(i)*(2.0**(15)-1.0);
                TestSig := TestSig + (2.0**(15)-1.0); 
                RF <= std_logic_vector(to_unsigned(natural(TestSig), 16)); 
                wait for SAMPLE_CLK_PERIOD;
            end loop; 
            end loop; 
            
            -- 17.3 MHz carrier test
            FControl <= std_logic_vector(to_unsigned(36, FControl'length)); 
            wait for CLK_PERIOD; 
            for j in 0 to 3 loop
            for i in 0 to Test173'length - 1 loop
                --wait until rising_edge(SClk)
                -- shift and quantize test input from [-1, 1] to 16 bits
                TestSig := Test173(i)*(2.0**(15)-1.0);
                TestSig := TestSig + (2.0**(15)-1.0); 
                RF <= std_logic_vector(to_unsigned(natural(TestSig), 16)); 
                wait for SAMPLE_CLK_PERIOD;
            end loop; 
            end loop;

        -- i dont think the sample rate for this is correct
            FControl <= (others => '0'); 
            wait for CLK_PERIOD; 
            for j in 0 to 3 loop
            for i in 0 to Test1012'length - 1 loop
                --wait until rising_edge(SClk)
                -- shift and quantize test input from [-1, 1] to 16 bits
                TestSig := Test1012(i)*(2.0**(15)-1.0);
                TestSig := TestSig + (2.0**(15)-1.0); 
                RF <= std_logic_vector(to_unsigned(natural(TestSig), 16)); 
                wait for SAMPLE_CLK_PERIOD;
            end loop; 
            end loop;
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
        for UUTSO : SampleOsc 
            use entity work.SampleOsc;
        end for; 
		for UUT : LO
            use entity work.LO;
        end for;
        for UUTM : Mixer
            use entity work.Mixer;
        end for;
        for UUTF : BPF
            use entity work.BPF;
        end for;
        for UUTP: PhaseDetector
            use entity work.PhaseDetector;
        end for;
        for UUTF2: LoopFilter
            use entity work.LoopFilter;
        end for;
        for UUTNCO: NCO
            use entity work.NCO;
        end for;
    end for;
end TESTBENCH_FOR_MIXER;