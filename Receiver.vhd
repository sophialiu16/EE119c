----------------------------------------------------------------------------
-- 
-- Receiver Entity (TODO)
--
-- Description
--
-- Ports:
--
-- Revision History:
-- 04/29/19 Sophia Liu Initial revision
--
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

library work; 
use work.RecConstants.all; 

entity Receiver is 
        port(
            Clk         : in std_logic; -- System clock 
            Reset       : in std_logic; -- Active low reset input
            RF          : in std_logic_vector(ADC_BITS downto 0); -- RF input 
            FControl    : in std_logic_vector(6 downto 0); -- Frequency control 
            IFOut       : out std_logic_vector(ADC_BITS downto 0); -- Oscillator output
            PWMOut      : out std_logic
        );
end Receiver; 

architecture behavioral of Receiver is 

    -- internal signals 
    signal SClk         : std_logic; 
    
    signal FOut         : std_logic; 
    signal CountOut     : std_logic_vector(MAX_COUNT_BITS downto 0);
    signal IFSig         : std_logic_vector(ADC_BITS downto 0);
    
	signal FilterOut   : std_logic_vector(FILTER_BITS downto 0);
	 
    signal PhaseUp : std_logic; 
    signal PhaseDown : std_logic;
    signal PhaseErr : std_logic_vector(ERR_BITS downto 0);
    
    signal FOutPLL : std_logic;
    signal FControlOut : std_logic_vector(FCOUNT_BITS downto 0); 
    
    begin 
    
        SOsc: entity work.SampleOsc 
            port map(
                Clk     => Clk,
                Reset   => Reset,
                SClk    => SClk
            );
    
        LO : entity work.LO 
        port map (
            SClk        => SClk,
            Clk         => Clk, 
            Reset       => Reset, 
            FControl    => FControl, 
            FOut        => FOut, 
            CountOut    => CountOut
        );
        
        Mixer : entity work.Mixer 
        port map (
            RF    => RF,  
            LO    => FOut, 
            Clk   => SClk,
            IFOut => IFSig
        );
        
        IFOut <= IFSig; 
        
        BPF : entity work.BPF 
		  generic map(
            N   => FILTER_N, 
            R   => FILTER_R,
            BITS_IN => ADC_BITS,
            BITS_OUT => FILTER_BITS
        )
        port map(
            SigIn   => IFSig,
            Clk     => SClk, 
            Reset   => Reset,
            SigOut  => FilterOut
        );
		  
		  PhaseDetector: entity work.PhaseDetector 
			port map (
				  SigIn1 => FilterOut(FILTER_BITS),
				  SigIn2 => FOutPLL,  
				  Clk   => SClk, 
				  Reset => Reset, 
				  PhaseDown => PhaseDown,
				  PhaseUp => PhaseUp
			 );
    
		LoopFilter: entity work.LoopFilter
        port map(
            Clk         => SClk,  
            Reset       => Reset, 
            PhaseDown   => PhaseDown, 
            PhaseUp     => PhaseUp, 
            PhaseErr    => PhaseErr
        );
    
		NCO: entity work.NCO 
        port map(
            Clk     => SClk, 
            Reset   => Reset, 
            FAdd    => PhaseErr,
            FOutPLL  => FOutPLL,
            FControlOut => FControlOut
        );
        
        PWM: entity work.PWM
        port map (
            Clk         => Clk, 
            Reset       => Reset, 
            SigIn       => FControlOut,
            PWMOut      => PWMOut
       ); 
end behavioral; 
 