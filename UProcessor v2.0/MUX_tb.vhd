--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:15:49 04/04/2016
-- Design Name:   
-- Module Name:   C:/Users/UTP.XXX/Documents/unicycleprocessor-master/MUX_tb.vhd
-- Project Name:  UProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX
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
 
ENTITY MUX_tb IS
END MUX_tb;
 
ARCHITECTURE behavior OF MUX_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         CRs2 : IN  std_logic_vector(31 downto 0);
         sign_next : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         MUXOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal sign_next : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal MUXOut : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          CRs2 => CRs2,
          sign_next => sign_next,
          i => i,
          MUXOut => MUXOut
        );

   -- Stimulus process
   stim_proc: process
   begin		
		CRs2      <= "00000000000000000000000000000010";
		sign_next <= "00000000000000000000000000100010";
		i    <= '1';
      wait for 50 ns;	
			i <= '0';
      wait;
   end process;

END;
