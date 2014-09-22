--------------------------------------------------------------------------------
-- Filename: ratpack_tb1.vhd
-- Purpose : A simple testbench for "ratpack".
-- Author  : Nikolaos Kavvadias <nikolaos.kavvadias@gmail.com>
-- Date    : 22-Sep-2014
-- Version : 0.1.0
-- Revision: 0.1.0 (2014/09/22)
--           Added testing of max, rmin (min), rmax (max) and automatic end of 
--           simulation (via forced assert).
--           0.0.0 (2010/05/14)
--           Initial version.
-- License : Copyright (C) 2010, 2011, 2012, 2013, 2014 by Nikolaos Kavvadias 
--           This program is free software. You can redistribute it and/or 
--           modify it under the terms of the GNU Lesser General Public License, 
--           either version 3 of the License, or (at your option) any later 
--           version. See COPYING.
--
--------------------------------------------------------------------------------

library STD, IEEE;
use STD.textio.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_bit.all;
use WORK.ratpack.all;


entity ratpack_tb is
end ratpack_tb;


architecture tb_arch of ratpack_tb is
  -------------------------------------------------------
  -- Declare results file
  -------------------------------------------------------
  file ResultsFile: text open write_mode is
  "ratpack_results.txt";
  -------------------------------------------------------
  -- Constant declarations
  -------------------------------------------------------
  constant CLK_PERIOD : time := 10 ns;
begin

  -- Test the basic operators. 
  TEST_OPS: process
    variable a, b, c, d: rational := RAT_ZERO;
    variable BufLine: line;
  begin
    a := to_rational(5, 12);
    b := to_rational(2, 3);
    d := to_rational(-3, 4);
    wait for CLK_PERIOD;
    -- Test rational addition
    c := a + b;    
    write(Bufline, a(numer));
    write(Bufline, string'("/"));
    write(Bufline, a(denom));
    write(Bufline, string'(" + "));            
    write(Bufline, b(numer));
    write(Bufline, string'("/"));
    write(Bufline, b(denom));
    write(Bufline, string'(" = "));
    write(Bufline, c(numer));
    write(Bufline, string'("/"));
    write(Bufline, c(denom));
    writeline(ResultsFile, Bufline);
    wait for CLK_PERIOD;
    -- Test rational subtraction
    c := a - b;    
    write(Bufline, a(numer));
    write(Bufline, string'("/"));
    write(Bufline, a(denom));
    write(Bufline, string'(" - "));            
    write(Bufline, b(numer));
    write(Bufline, string'("/"));
    write(Bufline, b(denom));
    write(Bufline, string'(" = "));
    write(Bufline, c(numer));
    write(Bufline, string'("/"));
    write(Bufline, c(denom));
    writeline(ResultsFile, Bufline);
    wait for CLK_PERIOD;
    -- Test rational multiplication
    c := a * b;    
    write(Bufline, a(numer));
    write(Bufline, string'("/"));
    write(Bufline, a(denom));
    write(Bufline, string'(" * "));            
    write(Bufline, b(numer));
    write(Bufline, string'("/"));
    write(Bufline, b(denom));
    write(Bufline, string'(" = "));
    write(Bufline, c(numer));
    write(Bufline, string'("/"));
    write(Bufline, c(denom));
    writeline(ResultsFile, Bufline);
    wait for CLK_PERIOD;
    -- Test rational division
    c := a / b;    
    write(Bufline, a(numer));
    write(Bufline, string'("/"));
    write(Bufline, a(denom));
    write(Bufline, string'(" : "));            
    write(Bufline, b(numer));
    write(Bufline, string'("/"));
    write(Bufline, b(denom));
    write(Bufline, string'(" = "));
    write(Bufline, c(numer));
    write(Bufline, string'("/"));
    write(Bufline, c(denom));
    writeline(ResultsFile, Bufline);
    wait for CLK_PERIOD;
    -- Test mediant
    c := mediant(a, b);
    write(Bufline, string'("mediant("));    
    write(Bufline, a(numer));
    write(Bufline, string'("/"));
    write(Bufline, a(denom));
    write(Bufline, string'(" , "));            
    write(Bufline, b(numer));
    write(Bufline, string'("/"));
    write(Bufline, b(denom));
    write(Bufline, string'(") = "));
    write(Bufline, c(numer));
    write(Bufline, string'("/"));
    write(Bufline, c(denom));
    writeline(ResultsFile, Bufline);
    wait for CLK_PERIOD;
    -- Test abs
    c := abs(d);
    write(Bufline, string'("abs("));    
    write(Bufline, d(numer));
    write(Bufline, string'("/"));
    write(Bufline, d(denom));
    write(Bufline, string'(") = "));
    write(Bufline, c(numer));
    write(Bufline, string'("/"));
    write(Bufline, c(denom));
    writeline(ResultsFile, Bufline);
    wait for CLK_PERIOD;
    -- Test rmax
    c := rmax(a, b);
    write(Bufline, string'("rmax("));    
    write(Bufline, a(numer));
    write(Bufline, string'("/"));
    write(Bufline, a(denom));
    write(Bufline, string'(" , "));            
    write(Bufline, b(numer));
    write(Bufline, string'("/"));
    write(Bufline, b(denom));
    write(Bufline, string'(") = "));
    write(Bufline, c(numer));
    write(Bufline, string'("/"));
    write(Bufline, c(denom));
    writeline(ResultsFile, Bufline);
    wait for CLK_PERIOD;
    -- Test rmin
    c := rmin(a, b);
    write(Bufline, string'("rmin("));    
    write(Bufline, a(numer));
    write(Bufline, string'("/"));
    write(Bufline, a(denom));
    write(Bufline, string'(" , "));            
    write(Bufline, b(numer));
    write(Bufline, string'("/"));
    write(Bufline, b(denom));
    write(Bufline, string'(") = "));
    write(Bufline, c(numer));
    write(Bufline, string'("/"));
    write(Bufline, c(denom));
    writeline(ResultsFile, Bufline);
    wait for CLK_PERIOD;    
    -- Automatic end of the current simulation.
    assert false
      report "NONE. End simulation time reached"
      severity failure;    
  end process TEST_OPS;
  
end tb_arch;
