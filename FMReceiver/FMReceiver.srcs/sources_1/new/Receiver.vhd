----------------------------------------------------------------------------
-- 
-- Receiver Entity
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
use work.OscConstants.all; 

entity Receiver is 
        port(
            Clk         : in  std_logic; -- System clock 
            Reset       : in std_logic; -- Active low reset input
            RF          : in std_logic_vector(ADC_BITS downto 0); -- RF input 
            FControl    : in std_logic_vector(6 downto 0); -- Frequency control 
            IFOut       : out std_logic_vector(ADC_BITS downto 0); -- Oscillator output
            FilterOut   : out std_logic_vector(FILTER_BITS downto 0)
        );
end Receiver; 

architecture behavioral of Receiver is 

    -- internal signals 
    signal FOut         : std_logic; 
    signal CountOut     : std_logic_vector(MAX_COUNT_BITS downto 0);
    signal IFSig         : std_logic_vector(ADC_BITS downto 0);
    
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
            N   => 3, 
            R   => 256  
        )
        port map(
            SigIn   => IFSig,
            Clk     => Clk,
            Reset   => Reset, 
            --SClk  :  in std_logic; -- Sampling clock 
            SigOut  => FilterOut
        ); 
        
end behavioral; 
 