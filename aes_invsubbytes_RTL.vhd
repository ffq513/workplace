--------------------------------------------------------------------------------
-- End of file
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--       ------------      Project : Stream Processor
--    ,' GoodLuck ,'      RCSfile: aes_invsubbytes.vhd,v  
--   '-----------'     Author: DR \*
--
--  Revision: 1.1  
--  Date: 1999.12.31
--  State: Exp  
--  Locker:   
--------------------------------------------------------------------------------
--
-- Description : This block performs the Inverse SubBytes transformation in the
--               AES encryption algorithm.
--
--------------------------------------------------------------------------------
--
--  Source: ./git/COMMON/IPs/WILD/STREAM_PROCESSOR/aes_blockcipher/vhdl/rtl/aes_invsubbytes.vhd,v  
--  Log: aes_invsubbytes.vhd,v  
-- Revision 1.1  2003/09/01 16:35:16  Dr.A
-- Initial revision
--
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--
-- Log history:
--
-- Source: Good
-- Log: aes_invsubbytes.vhd,v
-- Revision 1.1  2003/07/03 14:01:22  Dr.A
-- Initial revision
--
--------------------------------------------------------------------------------

library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity aes_invsubbytes is
  port (
    word_in      : in  std_logic_vector (31 downto 0); -- Input word.
    word_out     : out std_logic_vector (31 downto 0)  -- Transformed word.
  );
end aes_invsubbytes;

--============================================================================--
--                                   ARCHITECTURE                             --
--============================================================================--

architecture RTL of aes_invsubbytes is

--------------------------------------------------------------- Type declaration
type inv_sbox_type   is array (255 downto 0) of std_logic_vector (7 downto 0);
-------------------------------------------------------- End of Type declaration

------------------------------------------------------ Inverse S-Box declaration
-- These are the values in the S-Box used to make the State transformation:
constant inv_sbox_ct : inv_sbox_type
          := ("01111101", "00001100", "00100001", "01010101", -- 7D, 0C, 21, 55.
              "01100011", "00010100", "01101001", "11100001", -- 63, 14, 69, E1.
              "00100110", "11010110", "01110111", "10111010", -- 26, D6, 77, BA.
              "01111110", "00000100", "00101011", "00010111", -- 7E, 04, 2B, 17.

              "01100001", "10011001", "01010011", "10000011", -- 61, 99, 53, 83.
              "00111100", "10111011", "11101011", "11001000", -- 3C, BB, EB, C8.
              "10110000", "11110101", "00101010", "10101110", -- B0, F5, 2A, AE.
              "01001101", "00111011", "11100000", "10100000", -- 4D, 3B, E0, A0.

              "11101111", "10011100", "11001001", "10010011", -- EF, 9C, C9, 93.
              "10011111", "01111010", "11100101", "00101101", -- 9F, 7A, E5, 2D.
              "00001101", "01001010", "10110101", "00011001", -- 0D, 4A, B5, 19.
              "10101001", "01111111", "01010001", "01100000", -- A9, 7F, 51, 60.

              "01011111", "11101100", "10000000", "00100111", -- 5F, EC, 80, 27.
              "01011001", "00010000", "00010010", "10110001", -- 59, 10, 12, B1.
              "00110001", "11000111", "00000111", "10001000", -- 31, C7, 07, 88.
              "00110011", "10101000", "11011101", "00011111", -- 33, A8, DD, 1F.

              "11110100", "01011010", "11001101", "01111000", -- F4, 5A, CD, 78.
              "11111110", "11000000", "11011011", "10011010", -- FE, C0, DB, 9A.
              "00100000", "01111001", "11010010", "11000110", -- 20, 79, D2, C6.
              "01001011", "00111110", "01010110", "11111100", -- 4B, 3E, 56, FC.

              "00011011", "10111110", "00011000", "10101010", -- 1B, BE, 18, AA.
              "00001110", "01100010", "10110111", "01101111", -- 0E, 62, B7, 6F.
              "10001001", "11000101", "00101001", "00011101", -- 89, C5, 29, 1D.
              "01110001", "00011010", "11110001", "01000111", -- 71, 1A, F1, 47.

              "01101110", "11011111", "01110101", "00011100", -- 6E, DF, 75, 1C.
              "11101000", "00110111", "11111001", "11100010", -- E8, 37, F9, E2.
              "10000101", "00110101", "10101101", "11100111", -- 85, 35, AD, E7.
              "00100010", "01110100", "10101100", "10010110", -- 22, 74, AC, 96.

              "01110011", "11100110", "10110100", "11110000", -- 73, E6, B4, F0.
              "11001110", "11001111", "11110010", "10010111", -- CE, CF, F2, 97.
              "11101010", "11011100", "01100111", "01001111", -- EA, DC, 67, 4F.
              "01000001", "00010001", "10010001", "00111010", -- 41, 11, 91, 3A.

              "01101011", "10001010", "00010011", "00000001", -- 6B, 8A, 13, 01.
              "00000011", "10111101", "10101111", "11000001", -- 03, BD, AF, C1.
              "00000010", "00001111", "00111111", "11001010", -- 02, 0F, 3F, CA.
              "10001111", "00011110", "00101100", "11010000", -- 8F, 1E, 2C, D0.

              "00000110", "01000101", "10110011", "10111000", -- 06, 45, B3, B8.
              "00000101", "01011000", "11100100", "11110111", -- 05, 58, E4, F7.
              "00001010", "11010011", "10111100", "10001100", -- 0A, D3, BC, 8C.
              "00000000", "10101011", "11011000", "10010000", -- 00, AB, D8, 90.

              "10000100", "10011101", "10001101", "10100111", -- 84, 9D, 8D, A7.
              "01010111", "01000110", "00010101", "01011110", -- 57, 46, 15, 5E.
              "11011010", "10111001", "11101101", "11111101", -- DA, B9, ED, FD.
              "01010000", "01001000", "01110000", "01101100", -- 50, 48, 70, 6C.

              "10010010", "10110110", "01100101", "01011101", -- 92, B6, 65, 5D.
              "11001100", "01011100", "10100100", "11010100", -- CC, 5C, A4, D4.
              "00010110", "10011000", "01101000", "10000110", -- 16, 98, 68, 86.
              "01100100", "11110110", "11111000", "01110010", -- 64, F6, F8, 72.

              "00100101", "11010001", "10001011", "01101101", -- 25, D1, 8B, 6D.
              "01001001", "10100010", "01011011", "01110110", -- 49, A2, 5B, 76.
              "10110010", "00100100", "11011001", "00101000", -- B2, 24, D9, 28.
              "01100110", "10100001", "00101110", "00001000", -- 66, A1, 2E, 08.

              "01001110", "11000011", "11111010", "01000010", -- 4E, C3, FA, 42.
              "00001011", "10010101", "01001100", "11101110", -- 0B, 95, 4C, EE.
              "00111101", "00100011", "11000010", "10100110", -- 3D, 23, C2, A6.
              "00110010", "10010100", "01111011", "01010100", -- 32, 94, 7B, 54.

              "11001011", "11101001", "11011110", "11000100", -- CB, E9, DE, C4.
              "01000100", "01000011", "10001110", "00110100", -- 44, 43, 8E, 34.
              "10000111", "11111111", "00101111", "10011011", -- 87, FF, 2F, 9B.
              "10000010", "00111001", "11100011", "01111100", -- 82, 39, E3, 7C.

              "11111011", "11010111", "11110011", "10000001", -- FB, D7, F3, 81.
              "10011110", "10100011", "01000000", "10111111", -- 9E, A3, 40, BF.
              "00111000", "10100101", "00110110", "00110000", -- 38, A5, 36, 30.
              "11010101", "01101010", "00001001", "01010010");-- D5, 6A, 09, 52.
----------------------------------------------- End of Inverse S-Box declaration

------------------------------------------------------------- Signal declaration
signal byte_in0  : std_logic_vector (7 downto 0);
signal byte_in1  : std_logic_vector (7 downto 0);
signal byte_in2  : std_logic_vector (7 downto 0);
signal byte_in3  : std_logic_vector (7 downto 0);
signal byte_out0 : std_logic_vector (7 downto 0);
signal byte_out1 : std_logic_vector (7 downto 0);
signal byte_out2 : std_logic_vector (7 downto 0);
signal byte_out3 : std_logic_vector (7 downto 0);
------------------------------------------------------ End of signal declaration

begin

  ---------------------------------------------------------- Byte transformation
  -- This block transforms the 32-bit input lines into 8-bits signals and the
  -- result into 32-bit output lines.
  byte_in0 <= word_in ( 7 downto  0);
  byte_in1 <= word_in (15 downto  8);
  byte_in2 <= word_in (23 downto 16);
  byte_in3 <= word_in (31 downto 24);
  word_out <= byte_out3 & byte_out2 & byte_out1 & byte_out0;
  --------------------------------------------------- End of Byte transformation

  -------------------------------------------------------- Column Transformation
  -- This process calculates the transformations that correspond to each byte
  -- in one of the matrix column. The calculation is done looking at the
  -- corresponding value in the S-Box.
  byte_out0 <= inv_sbox_ct (conv_integer (byte_in0));
  byte_out1 <= inv_sbox_ct (conv_integer (byte_in1));
  byte_out2 <= inv_sbox_ct (conv_integer (byte_in2));
  byte_out3 <= inv_sbox_ct (conv_integer (byte_in3));
  ------------------------------------------------- End of Column Transformation

end RTL;
