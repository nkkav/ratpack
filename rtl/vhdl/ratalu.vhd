--------------------------------------------------------------------------------
-- Filename: ratalu.vhd
-- Purpose : Rational arithmetic unit (RAU or RATALU) using ratpack.
-- Author  : Nikolaos Kavvadias <nikolaos.kavvadias@gmail.com>
-- Date    : 21-Feb-2014
-- Version : 0.1.0
-- Revision: 0.1.0 (2014/02/21)
--           Initial version.
-- License : Copyright (C) 2014 by Nikolaos Kavvadias
--           This program is free software. You can redistribute it and/or 
--           modify it under the terms of the GNU Lesser General Public License, 
--           either version 3 of the License, or (at your option) any later 
--           version. See COPYING.
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use WORK.ratpack.all;

entity ratalu is
  port (
    a   : in  rational;
    b   : in  rational;
    sel : in  std_logic_vector(4 downto 0);
    y   : out rational
  );
end ratalu;

architecture rtl of ratalu is
  signal temp : rational;
  constant OP_ADD : std_logic_vector(4 downto 0) := "00000";
  constant OP_SUB : std_logic_vector(4 downto 0) := "00001";
  constant OP_MUL : std_logic_vector(4 downto 0) := "00010";
  constant OP_DIV : std_logic_vector(4 downto 0) := "00011";
  constant OP_ABS : std_logic_vector(4 downto 0) := "00100";
  constant OP_MAX : std_logic_vector(4 downto 0) := "00101";
  constant OP_MIN : std_logic_vector(4 downto 0) := "00110";
  constant OP_CGT : std_logic_vector(4 downto 0) := "00111";
  constant OP_CLT : std_logic_vector(4 downto 0) := "01000";
  constant OP_CGE : std_logic_vector(4 downto 0) := "01001";
  constant OP_CLE : std_logic_vector(4 downto 0) := "01010";
  constant OP_CEQ : std_logic_vector(4 downto 0) := "01011";
  constant OP_CNE : std_logic_vector(4 downto 0) := "01100";
  constant OP_MED : std_logic_vector(4 downto 0) := "01101";  
begin
 process (a, b, sel)
  begin
    case sel is
      when OP_ADD => temp <= a + b;
      when OP_SUB => temp <= a - b;
      when OP_MUL => temp <= a * b;
      when OP_DIV => temp <= a / b;
      when OP_ABS => temp <= a abs b;
      when OP_MAX => temp <= a max b;
      when OP_MIN => temp <= a min b;
      when OP_CGT => 
        if (a > b) then 
          temp <= RAT_ONE; 
        else 
          temp <= RAT_ZERO; 
        end if;
      when OP_CLT => 
        if (a < b) then 
          temp <= RAT_ONE; 
        else 
          temp <= RAT_ZERO; 
        end if;
      when OP_CGE => 
        if (a >= b) then 
          temp <= RAT_ONE; 
        else 
          temp <= RAT_ZERO; 
        end if;
      when OP_CLE => 
        if (a <= b) then 
          temp <= RAT_ONE; 
        else 
          temp <= RAT_ZERO; 
        end if;
      when OP_CEQ => 
        if (a = b) then 
          temp <= RAT_ONE; 
        else 
          temp <= RAT_ZERO; 
        end if;
      when OP_CNE => 
        if (a /= b) then 
          temp <= RAT_ONE; 
        else 
          temp <= RAT_ZERO; 
        end if;
      when OP_MED => temp <= mediant(a, b);
      when others => temp <= RAT_ZERO;
    end case;
  end process;
  y <= temp;
end rtl;
