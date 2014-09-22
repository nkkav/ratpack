=====================
 ratpack user manual
=====================

+-------------------+----------------------------------------------------------+
| **Title**         | ratpack (VHDL rational arithmetic package).              |
+-------------------+----------------------------------------------------------+
| **Author**        | Nikolaos Kavvadias 2009, 2010, 2011, 2012, 2013, 2014    |
+-------------------+----------------------------------------------------------+
| **Contact**       | nikos@nkavvadias.com                                     |
+-------------------+----------------------------------------------------------+
| **Website**       | http://www.nkavvadias.com                                |
+-------------------+----------------------------------------------------------+
| **Release Date**  | 22 September 2014                                        |
+-------------------+----------------------------------------------------------+
| **Version**       | 0.3.0                                                    |
+-------------------+----------------------------------------------------------+
| **Rev. history**  |                                                          |
+-------------------+----------------------------------------------------------+
|        **v0.3.0** | 2014-09-22                                               |
|                   |                                                          |
|                   | Updated for github (contents of /doc moved to top-level  |
|                   | directory, minor documentation changes).                 |
+-------------------+----------------------------------------------------------+
|        **v0.2.0** | 2014-02-21                                               |
|                   |                                                          |
|                   | Changed documentation format to RestructuredText.        |
|                   | Code has been reorganized into new directory structure.  |
+-------------------+----------------------------------------------------------+
|        **v0.1.3** | 2010-11-17                                               |
|                   |                                                          |
|                   | Added max, min.                                          |
+-------------------+----------------------------------------------------------+
|        **v0.1.2** | 2010-11-17                                               |
|                   |                                                          |
|                   | Added gcditer (iterative GCD using rational numbers).    |
+-------------------+----------------------------------------------------------+
|        **v0.1.1** | 2010-06-07                                               |
|                   |                                                          |
|                   | Minor update in documentation (README).                  |
+-------------------+----------------------------------------------------------+
|        **v0.1.0** | 2010-05-14                                               |
|                   |                                                          |
|                   | First public release.                                    |
+-------------------+----------------------------------------------------------+


1. Introduction
===============

``ratpack`` is a rational arithmetic package written in VHDL.

Currently, the ``ratpack`` package implements the following:

- the RATIONAL data type.

- to_rational: 
  construction function of a rational given two integers
  (numerator and denominator).
  
- int2rat: 
  conversion function of an integer to its rational representation.

- numerator: 
  extracts the numerator of a rational number.

- denominator: 
  extracts the denominator of a rational number.
  
- ``"+"``, ``"-"``, ``"*"``, ``"/"``: 
  implementation of the basic arithmetic operations for rationals.
  
- abs: 
  extracts the absolute value of a given rational number.
  
- max: 
  extracts the maximum of two rationals.

- min: 
  extracts the minimum of two rationals.
  
- ``">"``, ``"<"``, ``">="``, ``"<="``, ``"="``, ``"/="``: 
  overload comparison operators for rationals.
  
- gcd: 
  computes the greatest common divisor of two integers (positive,
  covers the pathological case of division by zero).

- mediant: 
  computes the mediant rational of two given rationals.

``ratpack`` is distributed along with two VHDL testbenches: a simple one 
(``ratpack_tb1.vhd``) and a testbench generating the Farey series of orders 
1 to 12 (``ratpack_tb2.vhd``). An exemplary rational arithmetic ALU has also 
been included but it is currently left untested (not testbench for it).

The ``ratpack`` project can be download from the following OpenCores website: 
http://opencores.org/project,ratpack

An up-to-date version of the ``ratpack`` code base is also maintained on 
Github: http://github.com/nkkav/ratpack.git


2. File listing
===============

The ``ratpack`` distribution includes the following files:
   
+-----------------------+------------------------------------------------------+
| /ratpack              | Top-level directory                                  |
+-----------------------+------------------------------------------------------+
| /bench/vhdl           | Benchmarks VHDL directory                            |
+-----------------------+------------------------------------------------------+
| AUTHORS               | List of ``ratpack`` authors.                         |
+-----------------------+------------------------------------------------------+
| BUGS                  | Bug list.                                            |
+-----------------------+------------------------------------------------------+
| ChangeLog             | A log for code changes.                              |
+-----------------------+------------------------------------------------------+
| COPYING               | The LGPL, version 3, governs ``ratpack``. There are  |
|                       | thoughts of changing the license to Modified BSD     |
|                       | eventually.                                          |
+-----------------------+------------------------------------------------------+
| README.rst            | This file.                                           |
+-----------------------+------------------------------------------------------+
| README.html           | HTML version of README.                              |
+-----------------------+------------------------------------------------------+
| README.pdf            | PDF version of README.                               |
+-----------------------+------------------------------------------------------+
| rst2docs.sh           | Bash script for generating the HTML and PDF versions.|
+-----------------------+------------------------------------------------------+
| THANKS                | Acknowledgements.                                    |
+-----------------------+------------------------------------------------------+
| TODO                  | A list of future enhancements.                       |
+-----------------------+------------------------------------------------------+
| VERSION               | Current version of the project sources.              |
+-----------------------+------------------------------------------------------+
| /bench/vhdl           | Testbench source code directory for the package      |
+-----------------------+------------------------------------------------------+
| ratpack_tb1.vhd       | A simple testbench.                                  |
+-----------------------+------------------------------------------------------+
| ratpack_tb2.vhd       | Testbench generating the Farey series (orders 1-12). |
+-----------------------+------------------------------------------------------+
| /rtl/vhdl             | RTL source code directory for the package            |
+-----------------------+------------------------------------------------------+
| ratalu.vhd            | Implementation of a rational arithmetic ALU.         |
+-----------------------+------------------------------------------------------+
| ratpack.vhd           | The rational arithmetic package.                     |
+-----------------------+------------------------------------------------------+
| /sim/rtl_sim          | RTL simulation files directory                       |
+-----------------------+------------------------------------------------------+
| /sim/rtl_sim/out      | RTL simulation output files directory                |
+-----------------------+------------------------------------------------------+
| ratpack_results1.txt  | Output generated by the ``ratpack_tb1.vhd`` tests.   |
+-----------------------+------------------------------------------------------+
| ratpack_results2.txt  | Output generated by the ``ratpack_tb2.vhd`` tests.   |
+-----------------------+------------------------------------------------------+
| /sim/rtl_sim/run      | RTL simulation run scripts directory                 |
+-----------------------+------------------------------------------------------+
| ratpack.mk            | GNU Makefile for running GHDL simulations.           |
+-----------------------+------------------------------------------------------+
| run.sh                | A bash script for running the GNU Makefile for GHDL. |
+-----------------------+------------------------------------------------------+


3. ``ratpack`` usage
====================

The ``ratpack`` package test script can be used as follows:

| ``$./run.sh <package name> <test case>``

After this process, the ``ratpack_results.txt`` file is generated containing 
simulation results.

Here follow some simple usage examples of this bash script.

1. Compile the ``ratpack`` package and do a simple test.

| ``$ ./run.sh ratpack 1``

2. Compile the ``ratpack`` package and generate the Farey series.

| ``$ ./run.sh ratpack 2``


4. Prerequisites
================

- Standard UNIX-based tools (tested on cygwin/x86)

  * make
  * bash
  
- GHDL simulator (http://ghdl.free.fr)

  Provides the "ghdl" executable and corresponding simulation environment.
