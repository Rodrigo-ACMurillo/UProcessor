--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:34:40 04/05/2016
-- Design Name:   
-- Module Name:   C:/Users/utp/Documents/Procesador/unicycleprocessor-master/registerFile_tb.vhd
-- Project Name:  UProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registerFile
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
 
ENTITY registerFile_tb IS
END registerFile_tb;
 
ARCHITECTURE behavior OF registerFile_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerFile
    PORT(
         reset : IN  std_logic;
         registerSource1 : IN  std_logic_vector(4 downto 0);
         registerSource2 : IN  std_logic_vector(4 downto 0);
         registerDestination : IN  std_logic_vector(4 downto 0);
         dataToWrite : IN  std_logic_vector(31 downto 0);
         contentRegisterSource1 : OUT  std_logic_vector(31 downto 0);
         contentRegisterSource2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal registerSource1 : std_logic_vector(4 downto 0) := (others => '0');
   signal registerSource2 : std_logic_vector(4 downto 0) := (others => '0');
   signal registerDestination : std_logic_vector(4 downto 0) := (others => '0');
   signal dataToWrite : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal contentRegisterSource1 : std_logic_vector(31 downto 0);
   signal contentRegisterSource2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerFile PORT MAP (
          reset => reset,
          registerSource1 => registerSource1,
          registerSource2 => registerSource2,
          registerDestination => registerDestination,
          dataToWrite => dataToWrite,
          contentRegisterSource1 => contentRegisterSource1,
          contentRegisterSource2 => contentRegisterSource2
        );

   -- Stimulus process
   stim_proc: process
   begin	
		reset <= '1';
		wait for 100 ns;
		reset <= '0';
      -- hold reset state for 100 ns.	
		registerSource1 <= "00001";
		registerSource2 <= "00100";
		registerDestination <= "10000";
		dataToWrite <= x"00100111";
      wait;
   end process;

END;
