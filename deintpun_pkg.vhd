
--------------------------------------------------------------------------------
-- End of file
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--       ------------      Project : WILD Modem 802.11a2
--    ,' GoodLuck ,'      RCSfile: deintpun_pkg.vhd,v  
--   '-----------'     Only for Study  
--
--  Revision: 1.3  
--  Date: 1999.12.31
--  State: Exp  
--  Locker:   
--------------------------------------------------------------------------------
--
-- Description : Package for deintpun.
--
--------------------------------------------------------------------------------
--
--  Source: ./git/COMMON/IPs/WILD/MODEM802_11a2/RX_TOP/FREQ_DOMAIN/deintpun/vhdl/rtl/deintpun_pkg.vhd,v  
--  Log: deintpun_pkg.vhd,v  
-- Revision 1.3  2003/05/16 16:34:30  Dr.J
-- Changed the type of field_length_i
--
-- Revision 1.2  2003/03/28 15:33:45  Dr.F
-- changed modem802_11a2 package name.
--
-- Revision 1.1  2003/03/18 14:29:13  Dr.C
-- Initial revision
--
--
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Library
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

--library modem802_11a2_pkg;
library work;
--use modem802_11a2_pkg.modem802_11a2_pack.all;
use work.modem802_11a2_pack.all;


--------------------------------------------------------------------------------
-- Package
--------------------------------------------------------------------------------
package deintpun_pkg is

--------------------------------------------------------------------------------
-- Types & constants
--------------------------------------------------------------------------------
  constant SUBCARRIER_PER_SYMBOL_CT     : integer :=  48;

  constant BITS_PER_SYMBOL_BPSK_1_2_CT  : integer :=  24;
  constant BITS_PER_SYMBOL_BPSK_3_4_CT  : integer :=  36;
  constant BITS_PER_SYMBOL_QPSK_1_2_CT  : integer :=  48;
  constant BITS_PER_SYMBOL_QPSK_3_4_CT  : integer :=  72;
  constant BITS_PER_SYMBOL_QAM16_1_2_CT : integer :=  96;
  constant BITS_PER_SYMBOL_QAM16_3_4_CT : integer := 144;
  constant BITS_PER_SYMBOL_QAM64_2_3_CT : integer := 192;
  constant BITS_PER_SYMBOL_QAM64_3_4_CT : integer := 216;

  subtype CARR_T is integer range 0 to SUBCARRIER_PER_SYMBOL_CT-1;
  subtype SOFT_T is integer range 0 to 5;
  subtype PUNC_T is integer range 0 to 1;

  type CARR_TABLE_T is array (1 to BITS_PER_SYMBOL_QAM64_3_4_CT) of CARR_T;
  type SOFT_TABLE_T is array (1 to BITS_PER_SYMBOL_QAM64_3_4_CT) of SOFT_T;
  type PUNC_TABLE_T is array (1 to BITS_PER_SYMBOL_QAM64_3_4_CT) of PUNC_T;

  
-------------------------------------------------------------------------------
-- Table Writing
------------------------------------------------------------------------------
  constant TABLE_WRITE_CT : CARR_TABLE_T :=
    ( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,
     24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,
     others => 0);

-------------------------------------------------------------------------------
-- Tables Puncuring
-------------------------------------------------------------------------------
  constant TABLE_PUNC_X_1_2_CT : PUNC_TABLE_T := (others => 0);
  constant TABLE_PUNC_Y_1_2_CT : PUNC_TABLE_T := (others => 0);

  constant TABLE_PUNC_X_2_3_CT : PUNC_TABLE_T := (others => 0);
  constant TABLE_PUNC_Y_2_3_CT : PUNC_TABLE_T :=
    (0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,
     0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,
     0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,
     0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,
     0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,
     0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1);

  constant TABLE_PUNC_X_3_4_CT : PUNC_TABLE_T :=
    (0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,
     0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,
     0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,
     0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,
     0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,
     0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1);

  constant TABLE_PUNC_Y_3_4_CT : PUNC_TABLE_T := 
    (0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,
     0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,
     0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,
     0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,
     0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,
     0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0);
  
-------------------------------------------------------------------------------
-- Tables QAM BPSK 1/2
-------------------------------------------------------------------------------
  constant TABLE_CARR_X_BPSK_1_2_CT : CARR_TABLE_T :=
    (  0,  6, 12, 18, 24, 30, 36, 42,  1,  7, 13, 19,
      25, 31, 37, 43,  2,  8, 14, 20, 26, 32, 38, 44,
     others => 0);

  constant TABLE_CARR_Y_BPSK_1_2_CT : CARR_TABLE_T :=
    (  3,  9, 15, 21, 27, 33, 39, 45,  4, 10, 16, 22,
      28, 34, 40, 46,  5, 11, 17, 23, 29, 35, 41, 47,
     others => 0);

  constant TABLE_SOFT_X_BPSK_1_2_CT : SOFT_TABLE_T := (others => 0);
  constant TABLE_SOFT_Y_BPSK_1_2_CT : SOFT_TABLE_T := (others => 0);

-------------------------------------------------------------------------------
-- Tables QAM BPSK 3/4
-------------------------------------------------------------------------------
  constant TABLE_CARR_X_BPSK_3_4_CT : CARR_TABLE_T :=
    (  0,  6,  0, 12, 18,  0, 24, 30,  0, 36, 42,  0,
       1,  7,  0, 13, 19,  0, 25, 31,  0, 37, 43,  0,
       2,  8,  0, 14, 20,  0, 26, 32,  0, 38, 44,  0,
     others => 0);

  constant TABLE_CARR_Y_BPSK_3_4_CT : CARR_TABLE_T :=
    (  3,  0,  9, 15,  0, 21, 27,  0, 33, 39,  0, 45,
       4,  0, 10, 16,  0, 22, 28,  0, 34, 40,  0, 46,
       5,  0, 11, 17,  0, 23, 29,  0, 35, 41,  0, 47,
     others => 0);

  constant TABLE_SOFT_X_BPSK_3_4_CT : SOFT_TABLE_T := (others => 0);
  constant TABLE_SOFT_Y_BPSK_3_4_CT : SOFT_TABLE_T := (others => 0);
    
-------------------------------------------------------------------------------
-- Tables QAM QPSK 1/2
-------------------------------------------------------------------------------
  constant TABLE_CARR_X_QPSK_1_2_CT : CARR_TABLE_T :=
    (  0,  6, 12, 18, 24, 30, 36, 42,  0,  6, 12, 18, 24, 30, 36, 42,
       1,  7, 13, 19, 25, 31, 37, 43,  1,  7, 13, 19, 25, 31, 37, 43,
       2,  8, 14, 20, 26, 32, 38, 44,  2,  8, 14, 20, 26, 32, 38, 44,
     others => 0);

  constant TABLE_CARR_Y_QPSK_1_2_CT : CARR_TABLE_T :=
    (  3,  9, 15, 21, 27, 33, 39, 45,  3,  9, 15, 21, 27, 33, 39, 45,
       4, 10, 16, 22, 28, 34, 40, 46,  4, 10, 16, 22, 28, 34, 40, 46,
       5, 11, 17, 23, 29, 35, 41, 47,  5, 11, 17, 23, 29, 35, 41, 47,
     others => 0);

  constant TABLE_SOFT_X_QPSK_1_2_CT : SOFT_TABLE_T :=
    (0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,
     0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,
     0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,
     others => 0);

  constant TABLE_SOFT_Y_QPSK_1_2_CT : SOFT_TABLE_T :=
    TABLE_SOFT_X_QPSK_1_2_CT;

-------------------------------------------------------------------------------
-- Tables QPSK 3/4
-------------------------------------------------------------------------------
  constant TABLE_CARR_X_QPSK_3_4_CT : CARR_TABLE_T :=
    (  0,  6,  0, 12, 18,  0, 24, 30,  0, 36, 42,  0,
       0,  6,  0, 12, 18,  0, 24, 30,  0, 36, 42,  0,
       1,  7,  0, 13, 19,  0, 25, 31,  0, 37, 43,  0,
       1,  7,  0, 13, 19,  0, 25, 31,  0, 37, 43,  0,
       2,  8,  0, 14, 20,  0, 26, 32,  0, 38, 44,  0,
       2,  8,  0, 14, 20,  0, 26, 32,  0, 38, 44,  0,
     others => 0);
           
  constant TABLE_CARR_Y_QPSK_3_4_CT : CARR_TABLE_T :=
    (  3,  0,  9, 15,  0, 21, 27,  0, 33, 39,  0, 45,
       3,  0,  9, 15,  0, 21, 27,  0, 33, 39,  0, 45,
       4,  0, 10, 16,  0, 22, 28,  0, 34, 40,  0, 46,
       4,  0, 10, 16,  0, 22, 28,  0, 34, 40,  0, 46,
       5,  0, 11, 17,  0, 23, 29,  0, 35, 41,  0, 47,
       5,  0, 11, 17,  0, 23, 29,  0, 35, 41,  0, 47,
     others => 0);

  constant TABLE_SOFT_X_QPSK_3_4_CT : SOFT_TABLE_T := 
    (0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,
     0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,
     0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,
     others => 0);

  constant TABLE_SOFT_Y_QPSK_3_4_CT : SOFT_TABLE_T :=
    TABLE_SOFT_X_QPSK_3_4_CT;

-------------------------------------------------------------------------------
-- Tables 16QAM 1/2
-------------------------------------------------------------------------------
  constant TABLE_CARR_X_QAM16_1_2_CT : CARR_TABLE_T :=
    (  0,  6, 12, 18, 24, 30, 36, 42,  0,  6, 12, 18, 24, 30, 36, 42,
       0,  6, 12, 18, 24, 30, 36, 42,  0,  6, 12, 18, 24, 30, 36, 42,
       1,  7, 13, 19, 25, 31, 37, 43,  1,  7, 13, 19, 25, 31, 37, 43,
       1,  7, 13, 19, 25, 31, 37, 43,  1,  7, 13, 19, 25, 31, 37, 43,
       2,  8, 14, 20, 26, 32, 38, 44,  2,  8, 14, 20, 26, 32, 38, 44,
       2,  8, 14, 20, 26, 32, 38, 44,  2,  8, 14, 20, 26, 32, 38, 44,
     others => 0);

  constant TABLE_CARR_Y_QAM16_1_2_CT : CARR_TABLE_T :=
    (  3,  9, 15, 21, 27, 33, 39, 45,  3,  9, 15, 21, 27, 33, 39, 45,
       3,  9, 15, 21, 27, 33, 39, 45,  3,  9, 15, 21, 27, 33, 39, 45,
       4, 10, 16, 22, 28, 34, 40, 46,  4, 10, 16, 22, 28, 34, 40, 46,
       4, 10, 16, 22, 28, 34, 40, 46,  4, 10, 16, 22, 28, 34, 40, 46,
       5, 11, 17, 23, 29, 35, 41, 47,  5, 11, 17, 23, 29, 35, 41, 47,
       5, 11, 17, 23, 29, 35, 41, 47,  5, 11, 17, 23, 29, 35, 41, 47,
     others => 0);
  
  constant TABLE_SOFT_X_QAM16_1_2_CT : SOFT_TABLE_T := 
    (0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,
     0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,
     0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,
     others => 0);

  constant TABLE_SOFT_Y_QAM16_1_2_CT : SOFT_TABLE_T := 
    (1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3,3,
     1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3,3,
     1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3,3,
     others => 0);

-------------------------------------------------------------------------------
-- Tables QAM 16QAM 3/4
-------------------------------------------------------------------------------
  constant TABLE_CARR_X_QAM16_3_4_CT : CARR_TABLE_T := 
    (  0,  6,  0, 12, 18,  0, 24, 30,  0, 36, 42,  0,
       0,  6,  0, 12, 18,  0, 24, 30,  0, 36, 42,  0,
       0,  6,  0, 12, 18,  0, 24, 30,  0, 36, 42,  0,
       0,  6,  0, 12, 18,  0, 24, 30,  0, 36, 42,  0,
       1,  7,  0, 13, 19,  0, 25, 31,  0, 37, 43,  0,
       1,  7,  0, 13, 19,  0, 25, 31,  0, 37, 43,  0,
       1,  7,  0, 13, 19,  0, 25, 31,  0, 37, 43,  0,
       1,  7,  0, 13, 19,  0, 25, 31,  0, 37, 43,  0,
       2,  8,  0, 14, 20,  0, 26, 32,  0, 38, 44,  0,
       2,  8,  0, 14, 20,  0, 26, 32,  0, 38, 44,  0,
       2,  8,  0, 14, 20,  0, 26, 32,  0, 38, 44,  0,
       2,  8,  0, 14, 20,  0, 26, 32,  0, 38, 44,  0,
     others => 0);
     
  constant TABLE_CARR_Y_QAM16_3_4_CT : CARR_TABLE_T :=
    (  3,  0,  9, 15,  0, 21, 27,  0, 33, 39,  0, 45,
       3,  0,  9, 15,  0, 21, 27,  0, 33, 39,  0, 45,
       3,  0,  9, 15,  0, 21, 27,  0, 33, 39,  0, 45,
       3,  0,  9, 15,  0, 21, 27,  0, 33, 39,  0, 45,
       4,  0, 10, 16,  0, 22, 28,  0, 34, 40,  0, 46,
       4,  0, 10, 16,  0, 22, 28,  0, 34, 40,  0, 46,
       4,  0, 10, 16,  0, 22, 28,  0, 34, 40,  0, 46,
       4,  0, 10, 16,  0, 22, 28,  0, 34, 40,  0, 46,
       5,  0, 11, 17,  0, 23, 29,  0, 35, 41,  0, 47,
       5,  0, 11, 17,  0, 23, 29,  0, 35, 41,  0, 47,
       5,  0, 11, 17,  0, 23, 29,  0, 35, 41,  0, 47,
       5,  0, 11, 17,  0, 23, 29,  0, 35, 41,  0, 47,
     others => 0);

  constant TABLE_SOFT_X_QAM16_3_4_CT : SOFT_TABLE_T :=
    (0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,0,1,1,0,
     3,3,0,3,3,0,3,3,0,3,3,0,4,4,0,4,4,0,4,4,0,4,4,0, 
     0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,0,1,1,0,
     3,3,0,3,3,0,3,3,0,3,3,0,4,4,0,4,4,0,4,4,0,4,4,0, 
     0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,0,1,1,0,
     3,3,0,3,3,0,3,3,0,3,3,0,4,4,0,4,4,0,4,4,0,4,4,0,
     others => 0); 

  constant TABLE_SOFT_Y_QAM16_3_4_CT : SOFT_TABLE_T :=
    (1,0,1,1,0,1,1,0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
     4,0,4,4,0,4,4,0,4,4,0,4,3,0,3,3,0,3,3,0,3,3,0,3,
     1,0,1,1,0,1,1,0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
     4,0,4,4,0,4,4,0,4,4,0,4,3,0,3,3,0,3,3,0,3,3,0,3,
     1,0,1,1,0,1,1,0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
     4,0,4,4,0,4,4,0,4,4,0,4,3,0,3,3,0,3,3,0,3,3,0,3,
     others => 0);

-------------------------------------------------------------------------------
-- Tables QAM 64QAM 2/3
-------------------------------------------------------------------------------
  constant TABLE_CARR_X_QAM64_2_3_CT : CARR_TABLE_T :=
    (  0,  6,  9, 15, 18, 24, 27, 33, 36, 42, 45,  3,  6, 12, 15, 21,
      24, 30, 33, 39, 42,  0,  3,  9, 12, 18, 21, 27, 30, 36, 39, 45,   
       0,  6,  9, 15, 18, 24, 27, 33, 36, 42, 45,  3,  6, 12, 15, 21,
      24, 30, 33, 39, 42,  0,  3,  9, 12, 18, 21, 27, 30, 36, 39, 45,   
       1,  7, 10, 16, 19, 25, 28, 34, 37, 43, 46,  4,  7, 13, 16, 22,
      25, 31, 34, 40, 43,  1,  4, 10, 13, 19, 22, 28, 31, 37, 40, 46,
       1,  7, 10, 16, 19, 25, 28, 34, 37, 43, 46,  4,  7, 13, 16, 22,
      25, 31, 34, 40, 43,  1,  4, 10, 13, 19, 22, 28, 31, 37, 40, 46,
       2,  8, 11, 17, 20, 26, 29, 35, 38, 44, 47,  5,  8, 14, 17, 23,
      26, 32, 35, 41, 44,  2,  5, 11, 14, 20, 23, 29, 32, 38, 41, 47,     
       2,  8, 11, 17, 20, 26, 29, 35, 38, 44, 47,  5,  8, 14, 17, 23,
      26, 32, 35, 41, 44,  2,  5, 11, 14, 20, 23, 29, 32, 38, 41, 47,
     others => 0);
  
  constant TABLE_CARR_Y_QAM64_2_3_CT : CARR_TABLE_T :=
    (  3,  0, 12,  0, 21,  0, 30,  0, 39,  0,  0,  0,  9,  0, 18,  0,
      27,  0, 36,  0, 45,  0,  6,  0, 15,  0, 24,  0, 33,  0, 42,  0,
       3,  0, 12,  0, 21,  0, 30,  0, 39,  0,  0,  0,  9,  0, 18,  0,
      27,  0, 36,  0, 45,  0,  6,  0, 15,  0, 24,  0, 33,  0, 42,  0,
       4,  0, 13,  0, 22,  0, 31,  0, 40,  0,  1,  0, 10,  0, 19,  0,
      28,  0, 37,  0, 46,  0,  7,  0, 16,  0, 25,  0, 34,  0, 43,  0,
       4,  0, 13,  0, 22,  0, 31,  0, 40,  0,  1,  0, 10,  0, 19,  0,
      28,  0, 37,  0, 46,  0,  7,  0, 16,  0, 25,  0, 34,  0, 43,  0,
       5,  0, 14,  0, 23,  0, 32,  0, 41,  0,  2,  0, 11,  0, 20,  0,
      29,  0, 38,  0, 47,  0,  8,  0, 17,  0, 26,  0, 35,  0, 44,  0,     
       5,  0, 14,  0, 23,  0, 32,  0, 41,  0,  2,  0, 11,  0, 20,  0,
      29,  0, 38,  0, 47,  0,  8,  0, 17,  0, 26,  0, 35,  0, 44,  0,
     others => 0);     
      
      
  constant TABLE_SOFT_X_QAM64_2_3_CT : SOFT_TABLE_T := 
    (0,1,0,1,0,1,0,1,0,1,0,0,2,0,2,0,2,0,2,0,2,2,1,2,1,2,1,2,1,2,1,2,
     3,4,3,4,3,4,3,4,3,4,3,3,5,3,5,3,5,3,5,3,5,5,4,5,4,5,4,5,4,5,4,5,
     0,1,0,1,0,1,0,1,0,1,0,0,2,0,2,0,2,0,2,0,2,2,1,2,1,2,1,2,1,2,1,2,
     3,4,3,4,3,4,3,4,3,4,3,3,5,3,5,3,5,3,5,3,5,5,4,5,4,5,4,5,4,5,4,5,
     0,1,0,1,0,1,0,1,0,1,0,0,2,0,2,0,2,0,2,0,2,2,1,2,1,2,1,2,1,2,1,2,
     3,4,3,4,3,4,3,4,3,4,3,3,5,3,5,3,5,3,5,3,5,5,4,5,4,5,4,5,4,5,4,5,
     others => 0);

  constant TABLE_SOFT_Y_QAM64_2_3_CT : SOFT_TABLE_T := 
    (2,0,2,0,2,0,2,0,2,0,1,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,
     5,0,5,0,5,0,5,0,5,0,4,0,4,0,4,0,4,0,4,0,4,0,3,0,3,0,3,0,3,0,3,0,  
     2,0,2,0,2,0,2,0,2,0,1,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,
     5,0,5,0,5,0,5,0,5,0,4,0,4,0,4,0,4,0,4,0,4,0,3,0,3,0,3,0,3,0,3,0,  
     2,0,2,0,2,0,2,0,2,0,1,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,
     5,0,5,0,5,0,5,0,5,0,4,0,4,0,4,0,4,0,4,0,4,0,3,0,3,0,3,0,3,0,3,0,
     others => 0);  

-------------------------------------------------------------------------------
-- Tables QAM 64QAM 3/4
-------------------------------------------------------------------------------
  constant TABLE_CARR_X_QAM64_3_4_CT : CARR_TABLE_T :=
    (  0,  6,  0, 12, 18,  0, 24, 30,  0, 36, 42,  0,
       0,  6,  0, 12, 18,  0, 24, 30,  0, 36, 42,  0,
       0,  6,  0, 12, 18,  0, 24, 30,  0, 36, 42,  0,
       0,  6,  0, 12, 18,  0, 24, 30,  0, 36, 42,  0,
       0,  6,  0, 12, 18,  0, 24, 30,  0, 36, 42,  0,
       0,  6,  0, 12, 18,  0, 24, 30,  0, 36, 42,  0,
       1,  7,  0, 13, 19,  0, 25, 31,  0, 37, 43,  0,
       1,  7,  0, 13, 19,  0, 25, 31,  0, 37, 43,  0,
       1,  7,  0, 13, 19,  0, 25, 31,  0, 37, 43,  0,
       1,  7,  0, 13, 19,  0, 25, 31,  0, 37, 43,  0,
       1,  7,  0, 13, 19,  0, 25, 31,  0, 37, 43,  0,
       1,  7,  0, 13, 19,  0, 25, 31,  0, 37, 43,  0,
       2,  8,  0, 14, 20,  0, 26, 32,  0, 38, 44,  0,
       2,  8,  0, 14, 20,  0, 26, 32,  0, 38, 44,  0,
       2,  8,  0, 14, 20,  0, 26, 32,  0, 38, 44,  0,
       2,  8,  0, 14, 20,  0, 26, 32,  0, 38, 44,  0,
       2,  8,  0, 14, 20,  0, 26, 32,  0, 38, 44,  0,
       2,  8,  0, 14, 20,  0, 26, 32,  0, 38, 44,  0,
     others => 0);
      
  constant TABLE_CARR_Y_QAM64_3_4_CT : CARR_TABLE_T :=
    (  3,  0,  9, 15,  0, 21, 27,  0, 33, 39,  0, 45,
       3,  0,  9, 15,  0, 21, 27,  0, 33, 39,  0, 45,
       3,  0,  9, 15,  0, 21, 27,  0, 33, 39,  0, 45,
       3,  0,  9, 15,  0, 21, 27,  0, 33, 39,  0, 45,
       3,  0,  9, 15,  0, 21, 27,  0, 33, 39,  0, 45,
       3,  0,  9, 15,  0, 21, 27,  0, 33, 39,  0, 45,
       4,  0, 10, 16,  0, 22, 28,  0, 34, 40,  0, 46,
       4,  0, 10, 16,  0, 22, 28,  0, 34, 40,  0, 46,
       4,  0, 10, 16,  0, 22, 28,  0, 34, 40,  0, 46,
       4,  0, 10, 16,  0, 22, 28,  0, 34, 40,  0, 46,
       4,  0, 10, 16,  0, 22, 28,  0, 34, 40,  0, 46,
       4,  0, 10, 16,  0, 22, 28,  0, 34, 40,  0, 46,
       5,  0, 11, 17,  0, 23, 29,  0, 35, 41,  0, 47,
       5,  0, 11, 17,  0, 23, 29,  0, 35, 41,  0, 47,
       5,  0, 11, 17,  0, 23, 29,  0, 35, 41,  0, 47,
       5,  0, 11, 17,  0, 23, 29,  0, 35, 41,  0, 47,
       5,  0, 11, 17,  0, 23, 29,  0, 35, 41,  0, 47,
       5,  0, 11, 17,  0, 23, 29,  0, 35, 41,  0, 47,
     others => 0);

  constant TABLE_SOFT_X_QAM64_3_4_CT : SOFT_TABLE_T :=
    (0,1,0,2,0,0,1,2,0,0,1,0,1,2,0,0,1,0,2,0,0,1,2,0,2,0,0,1,2,0,0,1,0,2,0,0,
     3,4,0,5,3,0,4,5,0,3,4,0,4,5,0,3,4,0,5,3,0,4,5,0,5,3,0,4,5,0,3,4,0,5,3,0,
     0,1,0,2,0,0,1,2,0,0,1,0,1,2,0,0,1,0,2,0,0,1,2,0,2,0,0,1,2,0,0,1,0,2,0,0,
     3,4,0,5,3,0,4,5,0,3,4,0,4,5,0,3,4,0,5,3,0,4,5,0,5,3,0,4,5,0,3,4,0,5,3,0,
     0,1,0,2,0,0,1,2,0,0,1,0,1,2,0,0,1,0,2,0,0,1,2,0,2,0,0,1,2,0,0,1,0,2,0,0,
     3,4,0,5,3,0,4,5,0,3,4,0,4,5,0,3,4,0,5,3,0,4,5,0,5,3,0,4,5,0,3,4,0,5,3,0,
     others => 0);
 
  constant TABLE_SOFT_Y_QAM64_3_4_CT : SOFT_TABLE_T :=
    (2,0,0,1,0,2,0,0,1,2,0,0,0,0,1,2,0,0,1,0,2,0,0,1,1,0,2,0,0,1,2,0,0,1,0,2,
     5,0,3,4,0,5,3,0,4,5,0,3,3,0,4,5,0,3,4,0,5,3,0,4,4,0,5,3,0,4,5,0,3,4,0,5,
     2,0,0,1,0,2,0,0,1,2,0,0,0,0,1,2,0,0,1,0,2,0,0,1,1,0,2,0,0,1,2,0,0,1,0,2,
     5,0,3,4,0,5,3,0,4,5,0,3,3,0,4,5,0,3,4,0,5,3,0,4,4,0,5,3,0,4,5,0,3,4,0,5,
     2,0,0,1,0,2,0,0,1,2,0,0,0,0,1,2,0,0,1,0,2,0,0,1,1,0,2,0,0,1,2,0,0,1,0,2,
     5,0,3,4,0,5,3,0,4,5,0,3,3,0,4,5,0,3,4,0,5,3,0,4,4,0,5,3,0,4,5,0,3,4,0,5,
     others => 0);


--------------------------------------------------------------------------------
-- Components list declaration done by <fb> script.
--------------------------------------------------------------------------------
----------------------
-- File: deintpun_control.vhd
----------------------
  component deintpun_control
  port (
    --------------------------------------
    -- Clocks & Reset
    --------------------------------------
    reset_n        : in  std_logic;  -- Async Reset
    clk            : in  std_logic;  -- Clock
    sync_reset_n   : in  std_logic;  -- Software reset

    --------------------------------------
    -- Symbol Strobe
    --------------------------------------
    enable_i       : in  std_logic;  -- Enable signal
    data_valid_i   : in  std_logic;  -- Data Valid signal for input
    data_valid_o   : out std_logic;  -- Data Valid signal for following block

    data_ready_o   : out std_logic;  -- reading phase ready
    
    start_field_i  : in  std_logic;  -- start either signal or data field 
    field_length_i : in  std_logic_vector (15 downto 0);
    qam_mode_i     : in  std_logic_vector (1 downto 0);
    pun_mode_i     : in  std_logic_vector (1 downto 0);

    enable_read_o  : out std_logic;  -- enable softbit output
    enable_write_o : out std_logic;  -- write softbits to deint registers

    write_addr_o   : out CARR_T;
    read_carr_x_o  : out CARR_T;
    read_carr_y_o  : out CARR_T;
    read_soft_x_o  : out SOFT_T;
    read_soft_y_o  : out SOFT_T;
    read_punc_x_o  : out PUNC_T;     -- give out dontcare on soft_x_o
    read_punc_y_o  : out PUNC_T      -- give out dontcare on soft_y_o
  );

  end component;


----------------------
-- File: deintpun_datapath.vhd
----------------------
  component deintpun_datapath
  port (
    --------------------------------------
    -- Clocks & Reset
    --------------------------------------
    reset_n        : in  std_logic;  -- Async Reset
    clk            : in  std_logic;  -- Clock

    --------------------------------------
    -- Interface Synchronization
    --------------------------------------
    enable_write_i : in  std_logic;  -- Enable signal for write phase
    enable_read_i  : in  std_logic;  -- Enable signal for read phase

    --------------------------------------
    -- Datapath interface
    --------------------------------------
    soft_x0_i      : in  std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
    soft_x1_i      : in  std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
    soft_x2_i      : in  std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
    soft_y0_i      : in  std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
    soft_y1_i      : in  std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
    soft_y2_i      : in  std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
                                       -- Softbits from equalizer_softbit

    soft_x_o       : out std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
    soft_y_o       : out std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
                                       -- Softbits to Viterbi

    write_addr_i   : in  CARR_T;   

    read_carr_x_i  : in  CARR_T;
    read_carr_y_i  : in  CARR_T;
    read_soft_x_i  : in  SOFT_T;
    read_soft_y_i  : in  SOFT_T;
    read_punc_x_i  : in  PUNC_T;   -- give out dontcare on soft_x_o
    read_punc_y_i  : in  PUNC_T    -- give out dontcare on soft_y_o
  );

  end component;


----------------------
-- File: deintpun.vhd
----------------------
  component deintpun
  port (
    --------------------------------------
    -- Clocks & Reset
    --------------------------------------
    reset_n        : in  std_logic;  -- Async Reset
    clk            : in  std_logic;  -- Clock
    sync_reset_n   : in  std_logic;  -- Software reset

    --------------------------------------
    -- Symbol Strobe
    --------------------------------------
    enable_i       : in  std_logic;   -- Enable signal
    data_valid_i   : in  std_logic;   -- Data Valid signal for input
    start_field_i  : in  std_logic;    -- start signal or data field
    --
    data_valid_o   : out std_logic;   -- Data Valid signal for following block
    data_ready_o   : out std_logic;   -- ready to take values from input
    
    --------------------------------------
    -- Datapath interface
    --------------------------------------
    field_length_i : in std_logic_vector (15 downto 0);
    qam_mode_i     : in std_logic_vector (1 downto 0);
    pun_mode_i     : in std_logic_vector (1 downto 0);
    soft_x0_i      : in std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
    soft_x1_i      : in std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
    soft_x2_i      : in std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
    soft_y0_i      : in std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
    soft_y1_i      : in std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
    soft_y2_i      : in std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
                                       -- Softbits from equalizer_softbit
    --
    soft_x_o       : out std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0);
    soft_y_o       : out std_logic_vector (SOFTBIT_WIDTH_CT-1 downto 0)
                                           -- Softbits to Viterbi
    );

  end component;



 
end deintpun_pkg;
