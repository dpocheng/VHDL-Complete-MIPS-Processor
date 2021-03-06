LIBRARY IEEE; 
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_unsigned.all;
USE IEEE.numeric_std.all;
USE work.Glob_dcls.all;

entity reg is
	port(	
			clk, wr_en, reset_N	: IN STD_LOGIC;
			d_in    : IN word;
			d_out   : OUT word
		);
end reg;

architecture reg_arch of reg is
	signal reg_value : word;
	begin
		d_out <= reg_value;
		process(clk, reset_N)
		begin
			if(reset_N = '0') then
				reg_value <= Zero_word;
			elsif(clk'event AND clk = '1' AND wr_en = '1') then
				reg_value <= d_in;
			end if;
		end process;
end reg_arch;