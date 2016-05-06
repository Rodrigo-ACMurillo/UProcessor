--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:01:07 05/06/2016
-- Design Name:   
-- Module Name:   C:/Users/UTP.XXX/Documents/Datamemory/DM/DataMemomry_tb.vhd
-- Project Name:  DM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataMemory
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
 
ENTITY DataMemomry_tb IS
END DataMemomry_tb;
 
ARCHITECTURE behavior OF DataMemomry_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         rst : IN  std_logic;
         data : IN  std_logic_vector(4 downto 0);
         writEnable : IN  std_logic;
         address : IN  std_logic_vector(4 downto 0);
         dataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal data : std_logic_vector(4 downto 0) := (others => '0');
   signal writEnable : std_logic := '0';
   signal address : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          rst => rst,
          data => data,
          writEnable => writEnable,
          address => address,
          dataOut => dataOut
        );

   -- Stimulus process
   stim_proc: process
   begin
		rst <= '0';
		address <= "10000";
		data <= "10001";
		writEnable <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst <= '1';
		writEnable <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
