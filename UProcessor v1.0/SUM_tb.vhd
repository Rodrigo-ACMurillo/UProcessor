--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:27:05 04/04/2016
-- Design Name:   
-- Module Name:   C:/Users/UTP.XXX/Documents/unicycleprocessor-master/SUM_tb.vhd
-- Project Name:  UProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SUM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SUM_tb IS
END SUM_tb;
 
ARCHITECTURE behavior OF SUM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SUM
    PORT(
         cFour : IN  std_logic_vector(31 downto 0);
         nPCOut : IN  std_logic_vector(31 downto 0);
         SUMOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal cFour : std_logic_vector(31 downto 0) := (others => '0');
   signal nPCOut : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal SUMOut : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SUM PORT MAP (
          cFour => cFour,
          nPCOut => nPCOut,
          SUMOut => SUMOut
        );


   -- Stimulus process
   stim_proc: process
   begin
		cFour  <= "00000000000000000000000000000100";
		npCout <= "00000000000000000000000000001000";
      wait for 50 ns;	
			npCout <= "00000000000000000000000000001100";
      wait;
   end process;

END;
