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
            Clk         : in  std_logic; -- System clock 
            Reset       : in std_logic; -- Active low reset input
            RF          : in std_logic_vector(ADC_BITS downto 0); -- RF input 
            FControl    : in std_logic_vector(6 downto 0); -- Frequency control 
            IFOut       : out std_logic_vector(ADC_BITS downto 0) -- Oscillator output
            
        );
end Receiver; 

architecture behavioral of Receiver is 

    -- internal signals 
    signal FOut         : std_logic; 
    signal CountOut     : std_logic_vector(MAX_COUNT_BITS downto 0);
    signal IFSig         : std_logic_vector(ADC_BITS downto 0);
    
	 signal FilterOut   : std_logic_vector(FILTER_BITS downto 0);
	 
    signal PhaseUp : std_logic; 
    signal PhaseDown : std_logic;
    signal PhaseDownLPF : std_logic_vector(ERR_BITS - 1 downto 0); 
    signal PhaseUpLPF : std_logic_vector(ERR_BITS - 1 downto 0); 
    signal PhaseErr : std_logic_vector(ERR_BITS downto 0);
    
    signal FOutPLL : std_logic;
	 
    begin 
        LO : entity work.LO 
        port map (
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
            Clk   => Clk,
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
            Clk     => Clk, 
            Reset   => Reset,
            SigOut  => FilterOut
        );
		  
		  PhaseDetector: entity work.PhaseDetector 
			port map (
				  SigIn1 => FilterOut(FILTER_BITS),
				  SigIn2 => FOutPLL,  
				  Clk   => Clk, 
				  Reset => Reset, 
				  PhaseDown => PhaseDown,
				  PhaseUp => PhaseUp
			 );
    
		LoopFilter: entity work.LoopFilter
        port map(
            Clk         => Clk,  
            Reset       => Reset, 
            PhaseDown   => PhaseDown, 
            PhaseUp     => PhaseUp, 
            PhaseDownLPF    => PhaseDownLPF, 
            PhaseUpLPF      => PhaseUpLPF,
            PhaseErr        => PhaseErr
        );
    
		NCO: entity work.NCO 
        port map(
            Clk     => Clk, 
            Reset   => Reset, 
            FAdd    => PhaseErr,
            FOutPLL  => FOutPLL
        );
        
end behavioral; 
 