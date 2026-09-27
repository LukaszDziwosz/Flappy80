; Compiled with 1.32.273
--------------------------------------------------------------------
startup: ; startup
1c01 : 0b __ __ INV
1c02 : 1c __ __ INV
1c03 : 0a __ __ ASL
1c04 : 00 __ __ BRK
1c05 : 9e __ __ INV
1c06 : 37 __ __ INV
1c07 : 31 38 __ AND ($38),y 
1c09 : 31 00 __ AND ($00),y 
1c0b : 00 __ __ BRK
1c0c : 00 __ __ BRK
1c0d : a9 0e __ LDA #$0e
1c0f : 8d 00 ff STA $ff00 
1c12 : ba __ __ TSX
1c13 : 8e 5d 3a STX $3a5d ; (spentry + 0)
1c16 : a2 3c __ LDX #$3c
1c18 : a0 b4 __ LDY #$b4
1c1a : a9 00 __ LDA #$00
1c1c : 85 19 __ STA IP + 0 
1c1e : 86 1a __ STX IP + 1 
1c20 : e0 7a __ CPX #$7a
1c22 : f0 0b __ BEQ $1c2f ; (startup + 46)
1c24 : 91 19 __ STA (IP + 0),y 
1c26 : c8 __ __ INY
1c27 : d0 fb __ BNE $1c24 ; (startup + 35)
1c29 : e8 __ __ INX
1c2a : d0 f2 __ BNE $1c1e ; (startup + 29)
1c2c : 91 19 __ STA (IP + 0),y 
1c2e : c8 __ __ INY
1c2f : c0 d7 __ CPY #$d7
1c31 : d0 f9 __ BNE $1c2c ; (startup + 43)
1c33 : a9 00 __ LDA #$00
1c35 : a2 f7 __ LDX #$f7
1c37 : d0 03 __ BNE $1c3c ; (startup + 59)
1c39 : 95 00 __ STA $00,x 
1c3b : e8 __ __ INX
1c3c : e0 f7 __ CPX #$f7
1c3e : d0 f9 __ BNE $1c39 ; (startup + 56)
1c40 : a9 c7 __ LDA #$c7
1c42 : 85 23 __ STA SP + 0 
1c44 : a9 bf __ LDA #$bf
1c46 : 85 24 __ STA SP + 1 
1c48 : 20 80 1c JSR $1c80 ; (main.s1 + 0)
1c4b : a9 4c __ LDA #$4c
1c4d : 85 54 __ STA $54 
1c4f : a9 00 __ LDA #$00
1c51 : 85 13 __ STA P6 
1c53 : 85 1a __ STA IP + 1 
1c55 : a9 1b __ LDA #$1b
1c57 : 85 18 __ STA P11 
1c59 : a9 19 __ LDA #$19
1c5b : 85 16 __ STA P9 
1c5d : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
; 694, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
1c80 : a2 0a __ LDX #$0a
1c82 : b5 53 __ LDA T1 + 0,x 
1c84 : 9d c9 bf STA $bfc9,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1 + 2)
.s4:
1c8a : a9 01 __ LDA #$01
1c8c : 8d 5e 3a STA $3a5e ; (giocharmap + 0)
1c8f : 20 8e 20 JSR $208e ; (dispmode80col.s4 + 0)
1c92 : a9 01 __ LDA #$01
1c94 : 85 cc __ STA $cc 
1c96 : 20 96 20 JSR $2096 ; (sound_init.s4 + 0)
1c99 : a9 93 __ LDA #$93
1c9b : 20 d2 ff JSR $ffd2 
1c9e : 78 __ __ SEI
1c9f : ad 11 d0 LDA $d011 
1ca2 : 29 7f __ AND #$7f
1ca4 : 85 55 __ STA T3 + 0 
1ca6 : 29 6f __ AND #$6f
1ca8 : 8d 11 d0 STA $d011 
1cab : ad 30 d0 LDA $d030 
1cae : 85 59 __ STA T8 + 0 
1cb0 : ad 00 dc LDA $dc00 
1cb3 : 85 5a __ STA T9 + 0 
1cb5 : ad 02 dc LDA $dc02 
1cb8 : 85 5b __ STA T10 + 0 
1cba : ad 03 dc LDA $dc03 
1cbd : 85 5c __ STA T11 + 0 
1cbf : a9 01 __ LDA #$01
1cc1 : 8d 30 d0 STA $d030 
1cc4 : a9 ff __ LDA #$ff
1cc6 : 8d 02 dc STA $dc02 
1cc9 : a9 00 __ LDA #$00
1ccb : 8d 03 dc STA $dc03 
1cce : aa __ __ TAX
1ccf : 8d 00 d6 STA $d600 
.l5:
1cd2 : 2c 00 d6 BIT $d600 
1cd5 : 10 fb __ BPL $1cd2 ; (main.l5 + 0)
.s6:
1cd7 : ad 01 d6 LDA $d601 
1cda : 9d b4 3c STA $3cb4,x ; (saved_regs[0] + 0)
1cdd : e8 __ __ INX
1cde : e0 25 __ CPX #$25
1ce0 : b0 05 __ BCS $1ce7 ; (main.s7 + 0)
.s113:
1ce2 : 8e 00 d6 STX $d600 
1ce5 : 90 eb __ BCC $1cd2 ; (main.l5 + 0)
.s7:
1ce7 : a9 22 __ LDA #$22
1ce9 : 8d 00 d6 STA $d600 
.l8:
1cec : 2c 00 d6 BIT $d600 
1cef : 10 fb __ BPL $1cec ; (main.l8 + 0)
.s9:
1cf1 : a9 80 __ LDA #$80
1cf3 : 8d 01 d6 STA $d601 
1cf6 : a9 00 __ LDA #$00
1cf8 : a2 20 __ LDX #$20
1cfa : 20 de 20 JSR $20de ; (vdc_mem_addr.s4 + 0)
1cfd : a9 d9 __ LDA #$d9
1cff : 85 53 __ STA T1 + 0 
1d01 : a0 00 __ LDY #$00
1d03 : a2 00 __ LDX #$00
.l10:
1d05 : 2c 00 d6 BIT $d600 
1d08 : 10 fb __ BPL $1d05 ; (main.l10 + 0)
.s11:
1d0a : 8a __ __ TXA
1d0b : 18 __ __ CLC
1d0c : 69 3c __ ADC #$3c
1d0e : 85 54 __ STA T1 + 1 
1d10 : ad 01 d6 LDA $d601 
1d13 : 91 53 __ STA (T1 + 0),y 
1d15 : c8 __ __ INY
1d16 : d0 01 __ BNE $1d19 ; (main.s115 + 0)
.s114:
1d18 : e8 __ __ INX
.s115:
1d19 : e0 0f __ CPX #$0f
1d1b : d0 e8 __ BNE $1d05 ; (main.l10 + 0)
.s108:
1d1d : 98 __ __ TYA
1d1e : d0 e5 __ BNE $1d05 ; (main.l10 + 0)
.s12:
1d20 : a9 1c __ LDA #$1c
1d22 : 8d 00 d6 STA $d600 
1d25 : ad d0 3c LDA $3cd0 ; (saved_regs[0] + 28)
1d28 : 29 0f __ AND #$0f
1d2a : 09 30 __ ORA #$30
1d2c : 85 56 __ STA T4 + 0 
.l13:
1d2e : 2c 00 d6 BIT $d600 
1d31 : 10 fb __ BPL $1d2e ; (main.l13 + 0)
.s14:
1d33 : 8d 01 d6 STA $d601 
1d36 : 20 fe 20 JSR $20fe ; (make_shapes.s4 + 0)
1d39 : 20 67 22 JSR $2267 ; (make_poses.s4 + 0)
1d3c : a9 00 __ LDA #$00
1d3e : a2 20 __ LDX #$20
1d40 : 86 58 __ STX T5 + 1 
1d42 : 20 de 20 JSR $20de ; (vdc_mem_addr.s4 + 0)
1d45 : a9 00 __ LDA #$00
1d47 : 85 5d __ STA T12 + 0 
.l15:
1d49 : 20 e1 22 JSR $22e1 ; (pipe_shapes.s4 + 0)
1d4c : a9 00 __ LDA #$00
1d4e : a6 58 __ LDX T5 + 1 
1d50 : 20 de 20 JSR $20de ; (vdc_mem_addr.s4 + 0)
1d53 : a9 00 __ LDA #$00
1d55 : 85 43 __ STA T0 + 0 
.l16:
1d57 : 0a __ __ ASL
1d58 : 85 53 __ STA T1 + 0 
1d5a : a9 00 __ LDA #$00
1d5c : 2a __ __ ROL
1d5d : 06 53 __ ASL T1 + 0 
1d5f : 2a __ __ ROL
1d60 : 06 53 __ ASL T1 + 0 
1d62 : 2a __ __ ROL
1d63 : aa __ __ TAX
1d64 : a9 d9 __ LDA #$d9
1d66 : 65 53 __ ADC T1 + 0 
1d68 : 85 53 __ STA T1 + 0 
1d6a : 8a __ __ TXA
1d6b : 69 4b __ ADC #$4b
1d6d : 85 54 __ STA T1 + 1 
1d6f : a0 00 __ LDY #$00
.l111:
1d71 : b1 53 __ LDA (T1 + 0),y 
.l17:
1d73 : 2c 00 d6 BIT $d600 
1d76 : 10 fb __ BPL $1d73 ; (main.l17 + 0)
.s18:
1d78 : 8d 01 d6 STA $d601 
1d7b : c8 __ __ INY
1d7c : c0 08 __ CPY #$08
1d7e : 90 f1 __ BCC $1d71 ; (main.l111 + 0)
.s19:
1d80 : a2 08 __ LDX #$08
.l20:
1d82 : 2c 00 d6 BIT $d600 
1d85 : 10 fb __ BPL $1d82 ; (main.l20 + 0)
.s21:
1d87 : a9 00 __ LDA #$00
1d89 : 8d 01 d6 STA $d601 
1d8c : ca __ __ DEX
1d8d : d0 f3 __ BNE $1d82 ; (main.l20 + 0)
.s22:
1d8f : e6 43 __ INC T0 + 0 
1d91 : a5 43 __ LDA T0 + 0 
1d93 : c9 f0 __ CMP #$f0
1d95 : d0 c0 __ BNE $1d57 ; (main.l16 + 0)
.s23:
1d97 : a5 58 __ LDA T5 + 1 
1d99 : 69 1f __ ADC #$1f
1d9b : 85 58 __ STA T5 + 1 
1d9d : e6 5d __ INC T12 + 0 
1d9f : a5 5d __ LDA T12 + 0 
1da1 : c9 04 __ CMP #$04
1da3 : 90 a4 __ BCC $1d49 ; (main.l15 + 0)
.s24:
1da5 : 8e 00 d6 STX $d600 
.l25:
1da8 : 2c 00 d6 BIT $d600 
1dab : 10 fb __ BPL $1da8 ; (main.l25 + 0)
.s26:
1dad : a9 7e __ LDA #$7e
1daf : 8d 01 d6 STA $d601 
1db2 : a9 02 __ LDA #$02
1db4 : 8d 00 d6 STA $d600 
.l27:
1db7 : 2c 00 d6 BIT $d600 
1dba : 10 fb __ BPL $1db7 ; (main.l27 + 0)
.s28:
1dbc : a9 66 __ LDA #$66
1dbe : 8d 01 d6 STA $d601 
1dc1 : a9 03 __ LDA #$03
1dc3 : 8d 00 d6 STA $d600 
.l29:
1dc6 : 2c 00 d6 BIT $d600 
1dc9 : 10 fb __ BPL $1dc6 ; (main.l29 + 0)
.s30:
1dcb : a9 49 __ LDA #$49
1dcd : 8d 01 d6 STA $d601 
1dd0 : a9 04 __ LDA #$04
1dd2 : 8d 00 d6 STA $d600 
.l31:
1dd5 : 2c 00 d6 BIT $d600 
1dd8 : 10 fb __ BPL $1dd5 ; (main.l31 + 0)
.s32:
1dda : a9 20 __ LDA #$20
1ddc : 8d 01 d6 STA $d601 
1ddf : a9 05 __ LDA #$05
1de1 : 8d 00 d6 STA $d600 
.l33:
1de4 : 2c 00 d6 BIT $d600 
1de7 : 10 fb __ BPL $1de4 ; (main.l33 + 0)
.s34:
1de9 : 8e 01 d6 STX $d601 
1dec : a9 07 __ LDA #$07
1dee : 8d 00 d6 STA $d600 
.l35:
1df1 : 2c 00 d6 BIT $d600 
1df4 : 10 fb __ BPL $1df1 ; (main.l35 + 0)
.s36:
1df6 : a9 1d __ LDA #$1d
1df8 : 8d 01 d6 STA $d601 
1dfb : a9 08 __ LDA #$08
1dfd : 8d 00 d6 STA $d600 
.l37:
1e00 : 2c 00 d6 BIT $d600 
1e03 : 10 fb __ BPL $1e00 ; (main.l37 + 0)
.s38:
1e05 : 8e 01 d6 STX $d601 
1e08 : a9 0c __ LDA #$0c
1e0a : 8d 00 d6 STA $d600 
.l39:
1e0d : 2c 00 d6 BIT $d600 
1e10 : 10 fb __ BPL $1e0d ; (main.l39 + 0)
.s40:
1e12 : 8e 01 d6 STX $d601 
1e15 : a9 0d __ LDA #$0d
1e17 : 8d 00 d6 STA $d600 
.l41:
1e1a : 2c 00 d6 BIT $d600 
1e1d : 10 fb __ BPL $1e1a ; (main.l41 + 0)
.s42:
1e1f : 8e 01 d6 STX $d601 
1e22 : a9 14 __ LDA #$14
1e24 : 8d 00 d6 STA $d600 
.l43:
1e27 : 2c 00 d6 BIT $d600 
1e2a : 10 fb __ BPL $1e27 ; (main.l43 + 0)
.s44:
1e2c : a9 08 __ LDA #$08
1e2e : 8d 01 d6 STA $d601 
1e31 : a9 15 __ LDA #$15
1e33 : 8d 00 d6 STA $d600 
.l45:
1e36 : 2c 00 d6 BIT $d600 
1e39 : 10 fb __ BPL $1e36 ; (main.l45 + 0)
.s46:
1e3b : 8e 01 d6 STX $d601 
1e3e : a9 1c __ LDA #$1c
1e40 : 8d 00 d6 STA $d600 
.l47:
1e43 : 2c 00 d6 BIT $d600 
1e46 : 10 fb __ BPL $1e43 ; (main.l47 + 0)
.s48:
1e48 : a5 56 __ LDA T4 + 0 
1e4a : 8d 01 d6 STA $d601 
1e4d : a9 01 __ LDA #$01
1e4f : 8d 00 d6 STA $d600 
.l49:
1e52 : 2c 00 d6 BIT $d600 
1e55 : 10 fb __ BPL $1e52 ; (main.l49 + 0)
.s50:
1e57 : a9 50 __ LDA #$50
1e59 : 8d 01 d6 STA $d601 
1e5c : a9 06 __ LDA #$06
1e5e : 8d 00 d6 STA $d600 
.l51:
1e61 : 2c 00 d6 BIT $d600 
1e64 : 10 fb __ BPL $1e61 ; (main.l51 + 0)
.s52:
1e66 : a9 19 __ LDA #$19
1e68 : 8d 01 d6 STA $d601 
1e6b : a9 09 __ LDA #$09
1e6d : 8d 00 d6 STA $d600 
.l53:
1e70 : 2c 00 d6 BIT $d600 
1e73 : 10 fb __ BPL $1e70 ; (main.l53 + 0)
.s54:
1e75 : a9 07 __ LDA #$07
1e77 : 8d 01 d6 STA $d601 
1e7a : a9 17 __ LDA #$17
1e7c : 8d 00 d6 STA $d600 
.l55:
1e7f : 2c 00 d6 BIT $d600 
1e82 : 10 fb __ BPL $1e7f ; (main.l55 + 0)
.s56:
1e84 : a9 07 __ LDA #$07
1e86 : 8d 01 d6 STA $d601 
1e89 : a9 16 __ LDA #$16
1e8b : 8d 00 d6 STA $d600 
.l57:
1e8e : 2c 00 d6 BIT $d600 
1e91 : 10 fb __ BPL $1e8e ; (main.l57 + 0)
.s58:
1e93 : a9 78 __ LDA #$78
1e95 : 8d 01 d6 STA $d601 
1e98 : a9 0a __ LDA #$0a
1e9a : 8d 00 d6 STA $d600 
.l59:
1e9d : 2c 00 d6 BIT $d600 
1ea0 : 10 fb __ BPL $1e9d ; (main.l59 + 0)
.s60:
1ea2 : a9 20 __ LDA #$20
1ea4 : 8d 01 d6 STA $d601 
1ea7 : a9 18 __ LDA #$18
1ea9 : 8d 00 d6 STA $d600 
.l61:
1eac : 2c 00 d6 BIT $d600 
1eaf : 10 fb __ BPL $1eac ; (main.l61 + 0)
.s62:
1eb1 : a9 80 __ LDA #$80
1eb3 : 8d 01 d6 STA $d601 
1eb6 : a9 19 __ LDA #$19
1eb8 : 8d 00 d6 STA $d600 
.l63:
1ebb : 2c 00 d6 BIT $d600 
1ebe : 10 fb __ BPL $1ebb ; (main.l63 + 0)
.s64:
1ec0 : a9 47 __ LDA #$47
1ec2 : 8d 01 d6 STA $d601 
1ec5 : a9 1b __ LDA #$1b
1ec7 : 8d 00 d6 STA $d600 
.l65:
1eca : 2c 00 d6 BIT $d600 
1ecd : 10 fb __ BPL $1eca ; (main.l65 + 0)
.s66:
1ecf : 8e 01 d6 STX $d601 
1ed2 : a9 1a __ LDA #$1a
1ed4 : 8d 00 d6 STA $d600 
.l67:
1ed7 : 2c 00 d6 BIT $d600 
1eda : 10 fb __ BPL $1ed7 ; (main.l67 + 0)
.s68:
1edc : 86 54 __ STX T1 + 1 
1ede : a9 06 __ LDA #$06
1ee0 : 8d 01 d6 STA $d601 
1ee3 : a0 00 __ LDY #$00
.l110:
1ee5 : 98 __ __ TYA
1ee6 : 9d 59 53 STA $5359,x ; (row_addr[0] + 0)
1ee9 : 18 __ __ CLC
1eea : 69 50 __ ADC #$50
1eec : a8 __ __ TAY
1eed : a5 54 __ LDA T1 + 1 
1eef : 9d 5a 53 STA $535a,x ; (row_addr[0] + 1)
1ef2 : 69 00 __ ADC #$00
1ef4 : 85 54 __ STA T1 + 1 
1ef6 : e8 __ __ INX
1ef7 : e8 __ __ INX
1ef8 : e0 32 __ CPX #$32
1efa : d0 e9 __ BNE $1ee5 ; (main.l110 + 0)
.s69:
1efc : a9 00 __ LDA #$00
1efe : 85 56 __ STA T4 + 0 
1f00 : 8d ee 3a STA $3aee ; (state + 0)
1f03 : 20 ca 23 JSR $23ca ; (reset_game.s4 + 0)
1f06 : 20 a2 27 JSR $27a2 ; (banner.s4 + 0)
.l70:
1f09 : a5 56 __ LDA T4 + 0 
1f0b : 85 57 __ STA T5 + 0 
1f0d : f0 04 __ BEQ $1f13 ; (main.s107 + 0)
.s71:
1f0f : a2 10 __ LDX #$10
1f11 : d0 04 __ BNE $1f17 ; (main.s72 + 0)
.s107:
1f13 : a2 00 __ LDX #$00
1f15 : 86 56 __ STX T4 + 0 
.s72:
1f17 : a9 00 __ LDA #$00
1f19 : 85 43 __ STA T0 + 0 
1f1b : 20 de 20 JSR $20de ; (vdc_mem_addr.s4 + 0)
1f1e : a9 53 __ LDA #$53
1f20 : 85 44 __ STA T0 + 1 
1f22 : a0 9b __ LDY #$9b
.l73:
1f24 : b1 43 __ LDA (T0 + 0),y 
.l74:
1f26 : 2c 00 d6 BIT $d600 
1f29 : 10 fb __ BPL $1f26 ; (main.l74 + 0)
.s75:
1f2b : 8d 01 d6 STA $d601 
1f2e : c8 __ __ INY
1f2f : d0 02 __ BNE $1f33 ; (main.s117 + 0)
.s116:
1f31 : e6 44 __ INC T0 + 1 
.s117:
1f33 : c0 6b __ CPY #$6b
1f35 : d0 ed __ BNE $1f24 ; (main.l73 + 0)
.s106:
1f37 : a5 44 __ LDA T0 + 1 
1f39 : c9 5b __ CMP #$5b
1f3b : d0 e7 __ BNE $1f24 ; (main.l73 + 0)
.s76:
1f3d : a5 57 __ LDA T5 + 0 
1f3f : f0 04 __ BEQ $1f45 ; (main.s118 + 0)
.s119:
1f41 : a2 18 __ LDX #$18
1f43 : d0 02 __ BNE $1f47 ; (main.s120 + 0)
.s118:
1f45 : a2 08 __ LDX #$08
.s120:
1f47 : a9 00 __ LDA #$00
1f49 : 20 de 20 JSR $20de ; (vdc_mem_addr.s4 + 0)
1f4c : a9 5b __ LDA #$5b
1f4e : 85 44 __ STA T0 + 1 
1f50 : a0 6b __ LDY #$6b
.l77:
1f52 : b1 43 __ LDA (T0 + 0),y 
.l78:
1f54 : 2c 00 d6 BIT $d600 
1f57 : 10 fb __ BPL $1f54 ; (main.l78 + 0)
.s79:
1f59 : 8d 01 d6 STA $d601 
1f5c : c8 __ __ INY
1f5d : d0 02 __ BNE $1f61 ; (main.s122 + 0)
.s121:
1f5f : e6 44 __ INC T0 + 1 
.s122:
1f61 : c0 3b __ CPY #$3b
1f63 : d0 ed __ BNE $1f52 ; (main.l77 + 0)
.s105:
1f65 : a5 44 __ LDA T0 + 1 
1f67 : c9 63 __ CMP #$63
1f69 : d0 e7 __ BNE $1f52 ; (main.l77 + 0)
.s80:
1f6b : e6 56 __ INC T4 + 0 
1f6d : a5 56 __ LDA T4 + 0 
1f6f : c9 02 __ CMP #$02
1f71 : 90 96 __ BCC $1f09 ; (main.l70 + 0)
.s81:
1f73 : a9 00 __ LDA #$00
1f75 : 85 0f __ STA P2 
1f77 : a9 d0 __ LDA #$d0
1f79 : 85 11 __ STA P4 
1f7b : a9 63 __ LDA #$63
1f7d : 85 0e __ STA P1 
1f7f : a9 07 __ LDA #$07
1f81 : 85 12 __ STA P5 
1f83 : a9 3b __ LDA #$3b
1f85 : 85 0d __ STA P0 
1f87 : 20 bf 29 JSR $29bf ; (memset@proxy + 0)
1f8a : a9 00 __ LDA #$00
1f8c : 8d f6 3a STA $3af6 ; (dirty_count + 0)
1f8f : 8d f7 3a STA $3af7 ; (dirty_count + 1)
1f92 : 20 df 29 JSR $29df ; (wait_frame.l4 + 0)
1f95 : 20 ee 29 JSR $29ee ; (show_frame.s4 + 0)
1f98 : a9 22 __ LDA #$22
1f9a : 8d 00 d6 STA $d600 
1f9d : ad d6 3c LDA $3cd6 ; (saved_regs[0] + 34)
.l82:
1fa0 : 2c 00 d6 BIT $d600 
1fa3 : 10 fb __ BPL $1fa0 ; (main.l82 + 0)
.s83:
1fa5 : 8d 01 d6 STA $d601 
1fa8 : 4c ba 1f JMP $1fba ; (main.l84 + 0)
.s104:
1fab : 20 48 2d JSR $2d48 ; (prepare_frame.s1 + 0)
1fae : 20 08 37 JSR $3708 ; (sound_tick.s4 + 0)
1fb1 : 20 b9 37 JSR $37b9 ; (stage_frame.s1 + 0)
1fb4 : 20 df 29 JSR $29df ; (wait_frame.l4 + 0)
1fb7 : 20 ee 29 JSR $29ee ; (show_frame.s4 + 0)
.l84:
1fba : 20 0c 2d JSR $2d0c ; (keys.s4 + 0)
1fbd : 85 14 __ STA P7 
1fbf : 29 10 __ AND #$10
1fc1 : f0 e8 __ BEQ $1fab ; (main.s104 + 0)
.s85:
1fc3 : a9 22 __ LDA #$22
1fc5 : 8d 00 d6 STA $d600 
.l86:
1fc8 : 2c 00 d6 BIT $d600 
1fcb : 10 fb __ BPL $1fc8 ; (main.l86 + 0)
.s87:
1fcd : a9 80 __ LDA #$80
1fcf : 8d 01 d6 STA $d601 
1fd2 : a9 1c __ LDA #$1c
1fd4 : 8d 00 d6 STA $d600 
1fd7 : ad d0 3c LDA $3cd0 ; (saved_regs[0] + 28)
.l88:
1fda : 2c 00 d6 BIT $d600 
1fdd : 10 fb __ BPL $1fda ; (main.l88 + 0)
.s89:
1fdf : 8d 01 d6 STA $d601 
1fe2 : a9 00 __ LDA #$00
1fe4 : 85 43 __ STA T0 + 0 
1fe6 : a2 20 __ LDX #$20
1fe8 : 20 de 20 JSR $20de ; (vdc_mem_addr.s4 + 0)
1feb : a9 3c __ LDA #$3c
1fed : 85 44 __ STA T0 + 1 
1fef : a0 d9 __ LDY #$d9
.l90:
1ff1 : b1 43 __ LDA (T0 + 0),y 
.l91:
1ff3 : 2c 00 d6 BIT $d600 
1ff6 : 10 fb __ BPL $1ff3 ; (main.l91 + 0)
.s92:
1ff8 : 8d 01 d6 STA $d601 
1ffb : aa __ __ TAX
1ffc : c8 __ __ INY
1ffd : d0 02 __ BNE $2001 ; (main.s124 + 0)
.s123:
1fff : e6 44 __ INC T0 + 1 
.s124:
2001 : c0 d9 __ CPY #$d9
2003 : d0 ec __ BNE $1ff1 ; (main.l90 + 0)
.s103:
2005 : a5 44 __ LDA T0 + 1 
2007 : c9 4b __ CMP #$4b
2009 : d0 e6 __ BNE $1ff1 ; (main.l90 + 0)
.s93:
200b : a9 00 __ LDA #$00
200d : 8d 00 d6 STA $d600 
.l125:
2010 : bc b4 3c LDY $3cb4,x ; (saved_regs[0] + 0)
.l95:
2013 : 2c 00 d6 BIT $d600 
2016 : 10 fb __ BPL $2013 ; (main.l95 + 0)
.s96:
2018 : 8c 01 d6 STY $d601 
201b : a6 43 __ LDX T0 + 0 
.l97:
201d : e8 __ __ INX
201e : e0 1e __ CPX #$1e
2020 : b0 10 __ BCS $2032 ; (main.s99 + 0)
.s98:
2022 : e0 10 __ CPX #$10
2024 : f0 f7 __ BEQ $201d ; (main.l97 + 0)
.s94:
2026 : e0 11 __ CPX #$11
2028 : f0 f3 __ BEQ $201d ; (main.l97 + 0)
.s112:
202a : 86 43 __ STX T0 + 0 
202c : 8e 00 d6 STX $d600 
202f : 4c 10 20 JMP $2010 ; (main.l125 + 0)
.s99:
2032 : a9 22 __ LDA #$22
2034 : 8d 00 d6 STA $d600 
2037 : ad d6 3c LDA $3cd6 ; (saved_regs[0] + 34)
.l100:
203a : 2c 00 d6 BIT $d600 
203d : 10 fb __ BPL $203a ; (main.l100 + 0)
.s101:
203f : 8d 01 d6 STA $d601 
2042 : 20 18 39 JSR $3918 ; (sound_off.s4 + 0)
2045 : a5 5a __ LDA T9 + 0 
2047 : 8d 00 dc STA $dc00 
204a : a5 5b __ LDA T10 + 0 
204c : 8d 02 dc STA $dc02 
204f : a5 5c __ LDA T11 + 0 
2051 : 8d 03 dc STA $dc03 
2054 : a5 59 __ LDA T8 + 0 
2056 : 8d 30 d0 STA $d030 
2059 : a5 55 __ LDA T3 + 0 
205b : 8d 11 d0 STA $d011 
205e : 58 __ __ CLI
205f : a9 93 __ LDA #$93
2061 : 20 d2 ff JSR $ffd2 
2064 : a2 0a __ LDX #$0a
2066 : a0 23 __ LDY #$23
2068 : 18 __ __ CLC
2069 : 20 f0 ff JSR $fff0 
206c : a2 00 __ LDX #$00
.l109:
206e : 86 53 __ STX T1 + 0 
2070 : bd 73 39 LDA $3973,x 
2073 : 20 27 39 JSR $3927 ; (putch.s4 + 0)
2076 : a6 53 __ LDX T1 + 0 
2078 : e8 __ __ INX
2079 : e0 09 __ CPX #$09
207b : 90 f1 __ BCC $206e ; (main.l109 + 0)
.s102:
207d : a9 00 __ LDA #$00
207f : 85 1b __ STA ACCU + 0 
2081 : 85 1c __ STA ACCU + 1 
.s3:
2083 : a2 0a __ LDX #$0a
2085 : bd c9 bf LDA $bfc9,x ; (main@stack + 0)
2088 : 95 53 __ STA T1 + 0,x 
208a : ca __ __ DEX
208b : 10 f8 __ BPL $2085 ; (main.s3 + 2)
208d : 60 __ __ RTS
--------------------------------------------------------------------
dispmode80col: ; dispmode80col()->void
;  23, "/Users/lukaszdziwosz/Desktop/80Terminal/.tools/oscar64/include/conio.h"
.s4:
208e : 24 d7 __ BIT $d7 
2090 : 10 01 __ BPL $2093 ; (dispmode80col.s5 + 0)
.s3:
2092 : 60 __ __ RTS
.s5:
2093 : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
sound_init: ; sound_init()->void
;  11, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.h"
.s4:
2096 : a9 00 __ LDA #$00
2098 : 8d eb 3a STA $3aeb ; (timer[0] + 0)
209b : 8d ec 3a STA $3aec ; (timer[0] + 1)
209e : 8d ed 3a STA $3aed ; (timer[0] + 2)
20a1 : a2 0f __ LDX #$0f
20a3 : 8e 18 d4 STX $d418 
20a6 : 8d 04 d4 STA $d404 
20a9 : 8d 02 d4 STA $d402 
20ac : a2 08 __ LDX #$08
20ae : 8e 03 d4 STX $d403 
20b1 : 8d 0b d4 STA $d40b 
20b4 : 8d 09 d4 STA $d409 
20b7 : 8e 0a d4 STX $d40a 
20ba : 8d 12 d4 STA $d412 
20bd : 8d 10 d4 STA $d410 
20c0 : 8e 11 d4 STX $d411 
20c3 : 8e 05 d4 STX $d405 
20c6 : a9 88 __ LDA #$88
20c8 : 8d 06 d4 STA $d406 
20cb : a9 09 __ LDA #$09
20cd : 8d 0c d4 STA $d40c 
20d0 : a9 0a __ LDA #$0a
20d2 : 8d 0d d4 STA $d40d 
20d5 : 8e 13 d4 STX $d413 
20d8 : a9 89 __ LDA #$89
20da : 8d 14 d4 STA $d414 
.s3:
20dd : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
;  76, "/Users/lukaszdziwosz/Desktop/80Terminal/.tools/oscar64/include/c128/vdc.h"
.s4:
20de : a0 12 __ LDY #$12
20e0 : 8c 00 d6 STY $d600 
.l5:
20e3 : 2c 00 d6 BIT $d600 
20e6 : 10 fb __ BPL $20e3 ; (vdc_mem_addr.l5 + 0)
.s6:
20e8 : 8e 01 d6 STX $d601 
20eb : a2 13 __ LDX #$13
20ed : 8e 00 d6 STX $d600 
.l7:
20f0 : 2c 00 d6 BIT $d600 
20f3 : 10 fb __ BPL $20f0 ; (vdc_mem_addr.l7 + 0)
.s8:
20f5 : 8d 01 d6 STA $d601 
20f8 : a9 1f __ LDA #$1f
20fa : 8d 00 d6 STA $d600 
.s3:
20fd : 60 __ __ RTS
--------------------------------------------------------------------
make_shapes: ; make_shapes()->void
; 193, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
20fe : a9 00 __ LDA #$00
2100 : 85 43 __ STA T2 + 0 
.l5:
2102 : a9 ff __ LDA #$ff
2104 : a4 43 __ LDY T2 + 0 
2106 : 99 d9 4b STA $4bd9,y ; (shapes[0][0] + 0)
2109 : a9 7f __ LDA #$7f
210b : 99 e1 4b STA $4be1,y ; (shapes[0][0] + 8)
210e : a9 fe __ LDA #$fe
2110 : 99 11 4c STA $4c11,y ; (shapes[0][0] + 56)
2113 : c0 01 __ CPY #$01
2115 : d0 04 __ BNE $211b ; (make_shapes.s30 + 0)
.s6:
2117 : a9 00 __ LDA #$00
2119 : f0 02 __ BEQ $211d ; (make_shapes.s34 + 0)
.s30:
211b : a9 ff __ LDA #$ff
.s34:
211d : 99 e9 4b STA $4be9,y ; (shapes[0][0] + 16)
2120 : a9 00 __ LDA #$00
2122 : c5 43 __ CMP T2 + 0 
2124 : 6a __ __ ROR
2125 : aa __ __ TAX
2126 : d0 04 __ BNE $212c ; (make_shapes.s7 + 0)
.s28:
2128 : c0 07 __ CPY #$07
212a : d0 04 __ BNE $2130 ; (make_shapes.s29 + 0)
.s7:
212c : a9 7f __ LDA #$7f
212e : d0 02 __ BNE $2132 ; (make_shapes.s35 + 0)
.s29:
2130 : a9 60 __ LDA #$60
.s35:
2132 : 99 f1 4b STA $4bf1,y ; (shapes[0][0] + 24)
2135 : 8a __ __ TXA
2136 : 30 04 __ BMI $213c ; (make_shapes.s8 + 0)
.s26:
2138 : c0 07 __ CPY #$07
213a : d0 04 __ BNE $2140 ; (make_shapes.s27 + 0)
.s8:
213c : a9 fe __ LDA #$fe
213e : d0 02 __ BNE $2142 ; (make_shapes.s36 + 0)
.s27:
2140 : a9 06 __ LDA #$06
.s36:
2142 : 99 f9 4b STA $4bf9,y ; (shapes[0][0] + 32)
2145 : e6 43 __ INC T2 + 0 
2147 : a5 43 __ LDA T2 + 0 
2149 : c9 08 __ CMP #$08
214b : 90 b5 __ BCC $2102 ; (make_shapes.l5 + 0)
.s9:
214d : a9 00 __ LDA #$00
214f : 85 1c __ STA ACCU + 1 
2151 : 85 1b __ STA ACCU + 0 
2153 : a9 30 __ LDA #$30
2155 : 85 43 __ STA T2 + 0 
2157 : a2 37 __ LDX #$37
.l12:
2159 : 0a __ __ ASL
215a : 85 45 __ STA T3 + 0 
215c : 18 __ __ CLC
215d : a9 00 __ LDA #$00
215f : 65 1b __ ADC ACCU + 0 
2161 : 85 47 __ STA T4 + 0 
2163 : a9 3b __ LDA #$3b
2165 : 69 00 __ ADC #$00
2167 : 85 48 __ STA T4 + 1 
2169 : a9 00 __ LDA #$00
216b : 06 45 __ ASL T3 + 0 
216d : 2a __ __ ROL
216e : 06 45 __ ASL T3 + 0 
2170 : 2a __ __ ROL
2171 : a8 __ __ TAY
2172 : a9 d9 __ LDA #$d9
2174 : 65 45 __ ADC T3 + 0 
2176 : 85 45 __ STA T3 + 0 
2178 : 98 __ __ TYA
2179 : 69 4b __ ADC #$4b
217b : 85 46 __ STA T3 + 1 
217d : a0 00 __ LDY #$00
.l31:
217f : b1 47 __ LDA (T4 + 0),y 
2181 : 0a __ __ ASL
2182 : 91 45 __ STA (T3 + 0),y 
2184 : c8 __ __ INY
2185 : c0 07 __ CPY #$07
2187 : d0 f6 __ BNE $217f ; (make_shapes.l31 + 0)
.s32:
2189 : a5 1b __ LDA ACCU + 0 
218b : 69 06 __ ADC #$06
218d : 85 1b __ STA ACCU + 0 
218f : e6 1c __ INC ACCU + 1 
2191 : a5 1c __ LDA ACCU + 1 
2193 : c9 24 __ CMP #$24
2195 : b0 03 __ BCS $219a ; (make_shapes.s13 + 0)
2197 : 4c 57 22 JMP $2257 ; (make_shapes.s10 + 0)
.s13:
219a : a2 00 __ LDX #$00
219c : 86 1b __ STX ACCU + 0 
219e : a9 f8 __ LDA #$f8
21a0 : 85 1c __ STA ACCU + 1 
.l14:
21a2 : a9 61 __ LDA #$61
21a4 : 85 43 __ STA T2 + 0 
21a6 : a9 4c __ LDA #$4c
21a8 : 85 44 __ STA T2 + 1 
.l15:
21aa : a4 1c __ LDY ACCU + 1 
21ac : b1 43 __ LDA (T2 + 0),y 
21ae : 49 ff __ EOR #$ff
21b0 : a4 1b __ LDY ACCU + 0 
21b2 : 91 43 __ STA (T2 + 0),y 
21b4 : 18 __ __ CLC
21b5 : a5 43 __ LDA T2 + 0 
21b7 : 69 08 __ ADC #$08
21b9 : 85 43 __ STA T2 + 0 
21bb : 90 02 __ BCC $21bf ; (make_shapes.s38 + 0)
.s37:
21bd : e6 44 __ INC T2 + 1 
.s38:
21bf : c9 b1 __ CMP #$b1
21c1 : d0 e7 __ BNE $21aa ; (make_shapes.l15 + 0)
.s16:
21c3 : b9 71 4e LDA $4e71,y ; (shapes[0][0] + 664)
21c6 : 49 ff __ EOR #$ff
21c8 : 99 b1 4c STA $4cb1,y ; (shapes[0][0] + 216)
21cb : b9 e9 4d LDA $4de9,y ; (shapes[0][0] + 528)
21ce : 49 ff __ EOR #$ff
21d0 : 99 b9 4c STA $4cb9,y ; (shapes[0][0] + 224)
21d3 : a9 e1 __ LDA #$e1
21d5 : 85 43 __ STA T2 + 0 
21d7 : a9 4d __ LDA #$4d
21d9 : 85 44 __ STA T2 + 1 
21db : a9 d9 __ LDA #$d9
21dd : 85 45 __ STA T3 + 0 
21df : a9 4f __ LDA #$4f
21e1 : 85 46 __ STA T3 + 1 
.l33:
21e3 : b1 43 __ LDA (T2 + 0),y 
21e5 : 49 ff __ EOR #$ff
21e7 : 91 45 __ STA (T3 + 0),y 
21e9 : 18 __ __ CLC
21ea : a5 43 __ LDA T2 + 0 
21ec : 69 08 __ ADC #$08
21ee : 85 43 __ STA T2 + 0 
21f0 : 90 03 __ BCC $21f5 ; (make_shapes.s40 + 0)
.s39:
21f2 : e6 44 __ INC T2 + 1 
21f4 : 18 __ __ CLC
.s40:
21f5 : a5 45 __ LDA T3 + 0 
21f7 : 69 08 __ ADC #$08
21f9 : 85 45 __ STA T3 + 0 
21fb : 90 02 __ BCC $21ff ; (make_shapes.s42 + 0)
.s41:
21fd : e6 46 __ INC T3 + 1 
.s42:
21ff : c9 a9 __ CMP #$a9
2201 : d0 e0 __ BNE $21e3 ; (make_shapes.l33 + 0)
.s17:
2203 : a5 1c __ LDA ACCU + 1 
2205 : 69 00 __ ADC #$00
2207 : 85 1c __ STA ACCU + 1 
2209 : 90 01 __ BCC $220c ; (make_shapes.s44 + 0)
.s43:
220b : e8 __ __ INX
.s44:
220c : e6 1b __ INC ACCU + 0 
220e : e0 01 __ CPX #$01
2210 : d0 90 __ BNE $21a2 ; (make_shapes.l14 + 0)
.s24:
2212 : a8 __ __ TAY
2213 : d0 8d __ BNE $21a2 ; (make_shapes.l14 + 0)
.s18:
2215 : 85 1d __ STA ACCU + 2 
2217 : aa __ __ TAX
.l19:
2218 : 86 1b __ STX ACCU + 0 
221a : bc 5f 3a LDY $3a5f,x ; (round[0] + 0)
221d : 84 1c __ STY ACCU + 1 
221f : a2 00 __ LDX #$00
2221 : 86 45 __ STX T3 + 0 
.l20:
2223 : bd bb 3a LDA $3abb,x ; (bitshift[0] + 8)
2226 : 25 1c __ AND ACCU + 1 
2228 : f0 07 __ BEQ $2231 ; (make_shapes.s22 + 0)
.s21:
222a : bd d3 3a LDA $3ad3,x ; (bitshift[0] + 32)
222d : 05 45 __ ORA T3 + 0 
222f : 85 45 __ STA T3 + 0 
.s22:
2231 : e8 __ __ INX
2232 : e0 08 __ CPX #$08
2234 : d0 ed __ BNE $2223 ; (make_shapes.l20 + 0)
.s23:
2236 : 98 __ __ TYA
2237 : a6 1b __ LDX ACCU + 0 
2239 : 9d a9 50 STA $50a9,x ; (shapes[0][0] + 1232)
223c : a5 45 __ LDA T3 + 0 
223e : 9d b1 50 STA $50b1,x ; (shapes[0][0] + 1240)
2241 : 8a __ __ TXA
2242 : 49 07 __ EOR #$07
2244 : aa __ __ TAX
2245 : 98 __ __ TYA
2246 : 9d b9 50 STA $50b9,x ; (shapes[0][0] + 1248)
2249 : a5 45 __ LDA T3 + 0 
224b : 9d c1 50 STA $50c1,x ; (shapes[0][0] + 1256)
224e : e6 1d __ INC ACCU + 2 
2250 : a6 1d __ LDX ACCU + 2 
2252 : e0 08 __ CPX #$08
2254 : 90 c2 __ BCC $2218 ; (make_shapes.l19 + 0)
.s3:
2256 : 60 __ __ RTS
.s10:
2257 : c9 0a __ CMP #$0a
2259 : e6 43 __ INC T2 + 0 
225b : e8 __ __ INX
225c : b0 05 __ BCS $2263 ; (make_shapes.s25 + 0)
.s11:
225e : a5 43 __ LDA T2 + 0 
2260 : 4c 59 21 JMP $2159 ; (make_shapes.l12 + 0)
.s25:
2263 : 8a __ __ TXA
2264 : 4c 59 21 JMP $2159 ; (make_shapes.l12 + 0)
--------------------------------------------------------------------
make_poses: ; make_poses()->void
; 224, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2267 : a9 00 __ LDA #$00
2269 : a2 90 __ LDX #$90
226b : 20 de 20 JSR $20de ; (vdc_mem_addr.s4 + 0)
226e : a9 00 __ LDA #$00
2270 : 85 1b __ STA ACCU + 0 
.l5:
2272 : 4a __ __ LSR
2273 : 4a __ __ LSR
2274 : 4a __ __ LSR
2275 : aa __ __ TAX
2276 : bd 40 3a LDA $3a40,x ; (__multab60L + 0)
2279 : 85 1c __ STA ACCU + 1 
227b : a5 1b __ LDA ACCU + 0 
227d : 29 07 __ AND #$07
227f : 85 1d __ STA ACCU + 2 
2281 : a9 00 __ LDA #$00
2283 : 85 1e __ STA ACCU + 3 
.l6:
2285 : 0a __ __ ASL
2286 : 0a __ __ ASL
2287 : 0a __ __ ASL
2288 : 85 43 __ STA T4 + 0 
228a : a2 00 __ LDX #$00
.l19:
228c : 38 __ __ SEC
228d : e5 1d __ SBC ACCU + 2 
228f : 85 44 __ STA T5 + 0 
2291 : a9 08 __ LDA #$08
2293 : 85 45 __ STA T9 + 0 
.l8:
2295 : a4 44 __ LDY T5 + 0 
2297 : c0 0c __ CPY #$0c
2299 : 90 04 __ BCC $229f ; (make_poses.s9 + 0)
.s18:
229b : a9 00 __ LDA #$00
229d : b0 0b __ BCS $22aa ; (make_poses.l10 + 0)
.s9:
229f : 8a __ __ TXA
22a0 : 79 43 3a ADC $3a43,y ; (__multab5L + 0)
22a3 : 18 __ __ CLC
22a4 : 65 1c __ ADC ACCU + 1 
22a6 : a8 __ __ TAY
22a7 : b9 00 3c LDA $3c00,y ; (bird_art[0][0][0] + 0)
.l10:
22aa : 2c 00 d6 BIT $d600 
22ad : 10 fb __ BPL $22aa ; (make_poses.l10 + 0)
.s11:
22af : 8d 01 d6 STA $d601 
22b2 : e6 44 __ INC T5 + 0 
22b4 : c6 45 __ DEC T9 + 0 
22b6 : d0 dd __ BNE $2295 ; (make_poses.l8 + 0)
.s12:
22b8 : a0 08 __ LDY #$08
.l13:
22ba : 2c 00 d6 BIT $d600 
22bd : 10 fb __ BPL $22ba ; (make_poses.l13 + 0)
.s14:
22bf : a9 00 __ LDA #$00
22c1 : 8d 01 d6 STA $d601 
22c4 : 88 __ __ DEY
22c5 : d0 f3 __ BNE $22ba ; (make_poses.l13 + 0)
.s15:
22c7 : e8 __ __ INX
22c8 : e0 05 __ CPX #$05
22ca : b0 04 __ BCS $22d0 ; (make_poses.s16 + 0)
.s7:
22cc : a5 43 __ LDA T4 + 0 
22ce : 90 bc __ BCC $228c ; (make_poses.l19 + 0)
.s16:
22d0 : e6 1e __ INC ACCU + 3 
22d2 : a5 1e __ LDA ACCU + 3 
22d4 : c9 03 __ CMP #$03
22d6 : d0 ad __ BNE $2285 ; (make_poses.l6 + 0)
.s17:
22d8 : e6 1b __ INC ACCU + 0 
22da : a5 1b __ LDA ACCU + 0 
22dc : c9 18 __ CMP #$18
22de : d0 92 __ BNE $2272 ; (make_poses.l5 + 0)
.s3:
22e0 : 60 __ __ RTS
--------------------------------------------------------------------
pipe_shapes: ; pipe_shapes(u8)->void
; 241, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
22e1 : 0a __ __ ASL
22e2 : 85 1b __ STA ACCU + 0 
22e4 : a9 00 __ LDA #$00
22e6 : 2a __ __ ROL
22e7 : 85 1c __ STA ACCU + 1 
22e9 : a9 0a __ LDA #$0a
22eb : 85 43 __ STA T5 + 0 
22ed : 85 1d __ STA ACCU + 2 
.l5:
22ef : a5 43 __ LDA T5 + 0 
22f1 : c9 0d __ CMP #$0d
22f3 : d0 04 __ BNE $22f9 ; (pipe_shapes.s7 + 0)
.s6:
22f5 : a9 01 __ LDA #$01
22f7 : d0 02 __ BNE $22fb ; (pipe_shapes.s8 + 0)
.s7:
22f9 : a9 00 __ LDA #$00
.s8:
22fb : 85 44 __ STA T6 + 0 
22fd : a9 00 __ LDA #$00
22ff : 85 45 __ STA T7 + 0 
.l9:
2301 : a9 00 __ LDA #$00
2303 : 85 1e __ STA ACCU + 3 
2305 : 85 46 __ STA T8 + 0 
.l42:
2307 : a5 44 __ LDA T6 + 0 
2309 : f0 06 __ BEQ $2311 ; (pipe_shapes.s16 + 0)
.s10:
230b : a2 ff __ LDX #$ff
230d : a0 f8 __ LDY #$f8
230f : d0 24 __ BNE $2335 ; (pipe_shapes.s11 + 0)
.s16:
2311 : a5 43 __ LDA T5 + 0 
2313 : c9 0c __ CMP #$0c
2315 : d0 06 __ BNE $231d ; (pipe_shapes.s18 + 0)
.s17:
2317 : a0 30 __ LDY #$30
.s41:
2319 : a2 00 __ LDX #$00
231b : f0 18 __ BEQ $2335 ; (pipe_shapes.s11 + 0)
.s18:
231d : c9 10 __ CMP #$10
231f : d0 04 __ BNE $2325 ; (pipe_shapes.s20 + 0)
.s19:
2321 : a0 38 __ LDY #$38
2323 : d0 f4 __ BNE $2319 ; (pipe_shapes.s41 + 0)
.s20:
2325 : c9 0a __ CMP #$0a
2327 : f0 04 __ BEQ $232d ; (pipe_shapes.s21 + 0)
.s22:
2329 : c9 0e __ CMP #$0e
232b : d0 04 __ BNE $2331 ; (pipe_shapes.s23 + 0)
.s21:
232d : a0 00 __ LDY #$00
232f : f0 e8 __ BEQ $2319 ; (pipe_shapes.s41 + 0)
.s23:
2331 : a0 18 __ LDY #$18
2333 : a2 00 __ LDX #$00
.s11:
2335 : 98 __ __ TYA
2336 : 18 __ __ CLC
2337 : 65 46 __ ADC T8 + 0 
2339 : 90 02 __ BCC $233d ; (pipe_shapes.s40 + 0)
.s39:
233b : e8 __ __ INX
233c : 18 __ __ CLC
.s40:
233d : 65 1b __ ADC ACCU + 0 
233f : a8 __ __ TAY
2340 : 8a __ __ TXA
2341 : 65 1c __ ADC ACCU + 1 
2343 : aa __ __ TAX
2344 : a5 43 __ LDA T5 + 0 
2346 : c9 0d __ CMP #$0d
2348 : 8a __ __ TXA
2349 : b0 6b __ BCS $23b6 ; (pipe_shapes.s33 + 0)
.s12:
234b : 30 16 __ BMI $2363 ; (pipe_shapes.s15 + 0)
.s32:
234d : d0 04 __ BNE $2353 ; (pipe_shapes.s13 + 0)
.s31:
234f : c0 08 __ CPY #$08
2351 : 90 10 __ BCC $2363 ; (pipe_shapes.s15 + 0)
.s13:
2353 : 8a __ __ TXA
2354 : d0 0d __ BNE $2363 ; (pipe_shapes.s15 + 0)
.s30:
2356 : c0 38 __ CPY #$38
2358 : b0 09 __ BCS $2363 ; (pipe_shapes.s15 + 0)
.s14:
235a : a6 46 __ LDX T8 + 0 
235c : bd d3 3a LDA $3ad3,x ; (bitshift[0] + 32)
235f : 05 1e __ ORA ACCU + 3 
2361 : 85 1e __ STA ACCU + 3 
.s15:
2363 : e6 46 __ INC T8 + 0 
2365 : a5 46 __ LDA T8 + 0 
2367 : c9 08 __ CMP #$08
2369 : 90 9c __ BCC $2307 ; (pipe_shapes.l42 + 0)
.s24:
236b : a5 1d __ LDA ACCU + 2 
236d : 0a __ __ ASL
236e : 0a __ __ ASL
236f : 0a __ __ ASL
2370 : 18 __ __ CLC
2371 : 65 45 __ ADC T7 + 0 
2373 : aa __ __ TAX
2374 : a5 1e __ LDA ACCU + 3 
2376 : 9d d9 4b STA $4bd9,x ; (shapes[0][0] + 0)
2379 : e6 45 __ INC T7 + 0 
237b : a5 45 __ LDA T7 + 0 
237d : c9 08 __ CMP #$08
237f : 90 80 __ BCC $2301 ; (pipe_shapes.l9 + 0)
.s25:
2381 : a5 43 __ LDA T5 + 0 
2383 : c9 10 __ CMP #$10
2385 : e6 1d __ INC ACCU + 2 
2387 : e6 43 __ INC T5 + 0 
2389 : b0 03 __ BCS $238e ; (pipe_shapes.s26 + 0)
238b : 4c ef 22 JMP $22ef ; (pipe_shapes.l5 + 0)
.s26:
238e : a2 00 __ LDX #$00
2390 : 86 1d __ STX ACCU + 2 
.l27:
2392 : a9 ff __ LDA #$ff
2394 : b0 0d __ BCS $23a3 ; (pipe_shapes.l38 + 0)
.s29:
2396 : a5 1d __ LDA ACCU + 2 
2398 : 69 08 __ ADC #$08
239a : 38 __ __ SEC
239b : e5 1b __ SBC ACCU + 0 
239d : 29 07 __ AND #$07
239f : a8 __ __ TAY
23a0 : b9 67 3a LDA $3a67,y ; (stripe[0] + 0)
.l38:
23a3 : a4 1d __ LDY ACCU + 2 
23a5 : 99 01 4c STA $4c01,y ; (shapes[0][0] + 40)
23a8 : e8 __ __ INX
23a9 : e0 08 __ CPX #$08
23ab : b0 08 __ BCS $23b5 ; (pipe_shapes.s3 + 0)
.s28:
23ad : e0 06 __ CPX #$06
23af : e6 1d __ INC ACCU + 2 
23b1 : 90 e3 __ BCC $2396 ; (pipe_shapes.s29 + 0)
23b3 : b0 dd __ BCS $2392 ; (pipe_shapes.l27 + 0)
.s3:
23b5 : 60 __ __ RTS
.s33:
23b6 : d0 ab __ BNE $2363 ; (pipe_shapes.s15 + 0)
.s37:
23b8 : c0 40 __ CPY #$40
23ba : b0 a7 __ BCS $2363 ; (pipe_shapes.s15 + 0)
.s34:
23bc : a6 45 __ LDX T7 + 0 
23be : ca __ __ DEX
23bf : d0 99 __ BNE $235a ; (pipe_shapes.s14 + 0)
.s35:
23c1 : 98 __ __ TYA
23c2 : f0 96 __ BEQ $235a ; (pipe_shapes.s14 + 0)
.s36:
23c4 : c9 3f __ CMP #$3f
23c6 : d0 9b __ BNE $2363 ; (pipe_shapes.s15 + 0)
23c8 : f0 90 __ BEQ $235a ; (pipe_shapes.s14 + 0)
--------------------------------------------------------------------
reset_game: ; reset_game()->void
; 449, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
23ca : a9 00 __ LDA #$00
23cc : 8d 8c 53 STA $538c ; (pipes[0].x + 1)
23cf : 8d ef 3a STA $3aef ; (score + 0)
23d2 : 8d f0 3a STA $3af0 ; (score + 1)
23d5 : 8d f1 3a STA $3af1 ; (velocity + 0)
23d8 : 8d f2 3a STA $3af2 ; (velocity + 1)
23db : 8d f5 3a STA $3af5 ; (phase + 0)
23de : a9 54 __ LDA #$54
23e0 : 8d 8b 53 STA $538b ; (pipes[0].x + 0)
23e3 : a9 80 __ LDA #$80
23e5 : 8d f3 3a STA $3af3 ; (bird_y + 0)
23e8 : a9 05 __ LDA #$05
23ea : 8d f4 3a STA $3af4 ; (bird_y + 1)
23ed : 20 20 25 JSR $2520 ; (gap_next.s4 + 0)
23f0 : 8d 8d 53 STA $538d ; (pipes[0].gap + 0)
23f3 : a9 00 __ LDA #$00
23f5 : 8d 8e 53 STA $538e ; (pipes[0].passed + 0)
23f8 : 8d 90 53 STA $5390 ; (pipes[0] + 5)
23fb : a9 71 __ LDA #$71
23fd : 8d 8f 53 STA $538f ; (pipes[0] + 4)
2400 : 20 20 25 JSR $2520 ; (gap_next.s4 + 0)
2403 : 8d 91 53 STA $5391 ; (pipes[0] + 6)
2406 : a9 00 __ LDA #$00
2408 : 8d 92 53 STA $5392 ; (pipes[0] + 7)
240b : 8d 94 53 STA $5394 ; (pipes[0] + 9)
240e : a9 8e __ LDA #$8e
2410 : 8d 93 53 STA $5393 ; (pipes[0] + 8)
2413 : 20 20 25 JSR $2520 ; (gap_next.s4 + 0)
2416 : 8d 95 53 STA $5395 ; (pipes[0] + 10)
2419 : a9 00 __ LDA #$00
241b : 8d 96 53 STA $5396 ; (pipes[0] + 11)
241e : 8d 98 53 STA $5398 ; (pipes[0] + 13)
2421 : a9 ab __ LDA #$ab
2423 : 8d 97 53 STA $5397 ; (pipes[0] + 12)
2426 : 20 20 25 JSR $2520 ; (gap_next.s4 + 0)
2429 : 8d 99 53 STA $5399 ; (pipes[0] + 14)
242c : a9 00 __ LDA #$00
242e : 8d 9a 53 STA $539a ; (pipes[0] + 15)
2431 : 20 4d 25 JSR $254d ; (field.s4 + 0)
--------------------------------------------------------------------
bird_draw: ; bird_draw()->void
; 270, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2434 : ad 75 3a LDA $3a75 ; (bird_row + 0)
2437 : 85 4b __ STA T4 + 0 
2439 : ad f3 3a LDA $3af3 ; (bird_y + 0)
243c : 85 49 __ STA T2 + 0 
243e : ad f4 3a LDA $3af4 ; (bird_y + 1)
2441 : 4a __ __ LSR
2442 : 66 49 __ ROR T2 + 0 
2444 : 4a __ __ LSR
2445 : 66 49 __ ROR T2 + 0 
2447 : 4a __ __ LSR
2448 : 66 49 __ ROR T2 + 0 
244a : 4a __ __ LSR
244b : 66 49 __ ROR T2 + 0 
244d : a6 49 __ LDX T2 + 0 
244f : 86 4a __ STX T3 + 0 
2451 : 4a __ __ LSR
2452 : 66 4a __ ROR T3 + 0 
2454 : 4a __ __ LSR
2455 : 66 4a __ ROR T3 + 0 
2457 : 4a __ __ LSR
2458 : 66 4a __ ROR T3 + 0 
245a : a5 4a __ LDA T3 + 0 
245c : 8d 75 3a STA $3a75 ; (bird_row + 0)
245f : a5 4b __ LDA T4 + 0 
2461 : c9 ff __ CMP #$ff
2463 : f0 18 __ BEQ $247d ; (bird_draw.s13 + 0)
.s5:
2465 : 85 4c __ STA T5 + 0 
2467 : 4c 6e 24 JMP $246e ; (bird_draw.l6 + 0)
.s10:
246a : a5 4b __ LDA T4 + 0 
246c : e6 4c __ INC T5 + 0 
.l6:
246e : 18 __ __ CLC
246f : 69 02 __ ADC #$02
2471 : b0 04 __ BCS $2477 ; (bird_draw.s7 + 0)
.s20:
2473 : c5 4c __ CMP T5 + 0 
2475 : 90 06 __ BCC $247d ; (bird_draw.s13 + 0)
.s7:
2477 : a5 4c __ LDA T5 + 0 
2479 : c9 15 __ CMP #$15
247b : 90 7c __ BCC $24f9 ; (bird_draw.s8 + 0)
.s13:
247d : a9 01 __ LDA #$01
247f : cd ee 3a CMP $3aee ; (state + 0)
2482 : d0 0b __ BNE $248f ; (bird_draw.s22 + 0)
.s14:
2484 : ad fc 3a LDA $3afc ; (frame_count + 0)
2487 : 29 0c __ AND #$0c
2489 : 4a __ __ LSR
248a : 4a __ __ LSR
248b : aa __ __ TAX
248c : bd 71 3a LDA $3a71,x ; (flap[0] + 0)
.s22:
248f : 0a __ __ ASL
2490 : 0a __ __ ASL
2491 : 0a __ __ ASL
2492 : 45 49 __ EOR T2 + 0 
2494 : 29 f8 __ AND #$f8
2496 : 45 49 __ EOR T2 + 0 
2498 : 8d fe 3a STA $3afe ; (bird_pose + 0)
249b : ad ff 3a LDA $3aff ; (shown_set + 0)
249e : a6 4a __ LDX T3 + 0 
24a0 : ec 76 3a CPX $3a76 ; (shown_row + 0)
24a3 : f0 02 __ BEQ $24a7 ; (bird_draw.s23 + 0)
.s19:
24a5 : 49 01 __ EOR #$01
.s23:
24a7 : 8d fc 3b STA $3bfc ; (bird_set + 0)
24aa : 85 1b __ STA ACCU + 0 
24ac : a9 00 __ LDA #$00
24ae : 85 1c __ STA ACCU + 1 
24b0 : a9 0f __ LDA #$0f
24b2 : 20 7d 39 JSR $397d ; (mul16by8 + 0)
24b5 : 18 __ __ CLC
24b6 : a5 1b __ LDA ACCU + 0 
24b8 : 69 60 __ ADC #$60
24ba : 85 49 __ STA T2 + 0 
24bc : a9 00 __ LDA #$00
24be : 85 4b __ STA T4 + 0 
24c0 : 18 __ __ CLC
.l15:
24c1 : 65 4a __ ADC T3 + 0 
24c3 : b0 33 __ BCS $24f8 ; (bird_draw.s3 + 0)
.s18:
24c5 : c9 15 __ CMP #$15
24c7 : b0 2f __ BCS $24f8 ; (bird_draw.s3 + 0)
.s16:
24c9 : 85 0e __ STA P1 
24cb : a9 1e __ LDA #$1e
24cd : 85 4d __ STA T6 + 0 
24cf : a2 00 __ LDX #$00
24d1 : 90 04 __ BCC $24d7 ; (bird_draw.l25 + 0)
.s24:
24d3 : e6 4d __ INC T6 + 0 
24d5 : a5 4d __ LDA T6 + 0 
.l25:
24d7 : 86 4c __ STX T5 + 0 
24d9 : 85 0d __ STA P0 
24db : a5 49 __ LDA T2 + 0 
24dd : 85 0f __ STA P2 
24df : bd 77 3a LDA $3a77,x ; (bird_colours[0] + 0)
24e2 : 85 10 __ STA P3 
24e4 : 20 84 26 JSR $2684 ; (cell.s4 + 0)
24e7 : a6 4c __ LDX T5 + 0 
24e9 : e8 __ __ INX
24ea : e0 05 __ CPX #$05
24ec : e6 49 __ INC T2 + 0 
24ee : 90 e3 __ BCC $24d3 ; (bird_draw.s24 + 0)
.s17:
24f0 : e6 4b __ INC T4 + 0 
24f2 : a5 4b __ LDA T4 + 0 
24f4 : c9 03 __ CMP #$03
24f6 : 90 c9 __ BCC $24c1 ; (bird_draw.l15 + 0)
.s3:
24f8 : 60 __ __ RTS
.s8:
24f9 : c5 4a __ CMP T3 + 0 
24fb : 90 0f __ BCC $250c ; (bird_draw.s9 + 0)
.s11:
24fd : a5 4a __ LDA T3 + 0 
24ff : 69 01 __ ADC #$01
2501 : 90 03 __ BCC $2506 ; (bird_draw.s12 + 0)
2503 : 4c 6a 24 JMP $246a ; (bird_draw.s10 + 0)
.s12:
2506 : c5 4c __ CMP T5 + 0 
2508 : b0 f9 __ BCS $2503 ; (bird_draw.s11 + 6)
.s26:
250a : a5 4c __ LDA T5 + 0 
.s9:
250c : 85 0e __ STA P1 
250e : a9 1e __ LDA #$1e
2510 : 85 0d __ STA P0 
.l21:
2512 : 20 9e 25 JSR $259e ; (background.s4 + 0)
2515 : e6 0d __ INC P0 
2517 : a5 0d __ LDA P0 
2519 : c9 23 __ CMP #$23
251b : 90 f5 __ BCC $2512 ; (bird_draw.l21 + 0)
251d : 4c 6a 24 JMP $246a ; (bird_draw.s10 + 0)
--------------------------------------------------------------------
gap_next: ; gap_next()->u8
; 160, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2520 : ad 70 3a LDA $3a70 ; (random_state + 1)
2523 : 85 1c __ STA ACCU + 1 
2525 : ad 6f 3a LDA $3a6f ; (random_state + 0)
2528 : 29 01 __ AND #$01
252a : f0 02 __ BEQ $252e ; (gap_next.s6 + 0)
.s5:
252c : a9 b4 __ LDA #$b4
.s6:
252e : aa __ __ TAX
252f : ad 6f 3a LDA $3a6f ; (random_state + 0)
2532 : 46 1c __ LSR ACCU + 1 
2534 : 6a __ __ ROR
2535 : 85 1b __ STA ACCU + 0 
2537 : 8d 6f 3a STA $3a6f ; (random_state + 0)
253a : 8a __ __ TXA
253b : 45 1c __ EOR ACCU + 1 
253d : 85 1c __ STA ACCU + 1 
253f : 8d 70 3a STA $3a70 ; (random_state + 1)
2542 : a9 0c __ LDA #$0c
2544 : 20 ea 39 JSR $39ea ; (divmod + 53)
2547 : 18 __ __ CLC
2548 : a5 05 __ LDA WORK + 2 
254a : 69 02 __ ADC #$02
.s3:
254c : 60 __ __ RTS
--------------------------------------------------------------------
field: ; field()->void
; 439, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
254d : a9 00 __ LDA #$00
254f : 85 4a __ STA T1 + 0 
.l5:
2551 : 85 0e __ STA P1 
2553 : a9 00 __ LDA #$00
2555 : 85 0d __ STA P0 
.l8:
2557 : 20 9e 25 JSR $259e ; (background.s4 + 0)
255a : e6 0d __ INC P0 
255c : a5 0d __ LDA P0 
255e : c9 50 __ CMP #$50
2560 : 90 f5 __ BCC $2557 ; (field.l8 + 0)
.s6:
2562 : e6 4a __ INC T1 + 0 
2564 : a5 4a __ LDA T1 + 0 
2566 : c9 19 __ CMP #$19
2568 : 90 e7 __ BCC $2551 ; (field.l5 + 0)
.s7:
256a : a9 02 __ LDA #$02
256c : 85 0d __ STA P0 
256e : a9 0d __ LDA #$0d
2570 : 85 10 __ STA P3 
2572 : a9 17 __ LDA #$17
2574 : 85 0e __ STA P1 
2576 : a9 1b __ LDA #$1b
2578 : 85 0f __ STA P2 
257a : 20 84 26 JSR $2684 ; (cell.s4 + 0)
257d : e6 0f __ INC P2 
257f : a9 48 __ LDA #$48
2581 : 85 0d __ STA P0 
2583 : 20 84 26 JSR $2684 ; (cell.s4 + 0)
2586 : a9 04 __ LDA #$04
2588 : 85 11 __ STA P4 
258a : 20 27 27 JSR $2727 ; (number@proxy + 0)
258d : a9 4a __ LDA #$4a
258f : 85 11 __ STA P4 
--------------------------------------------------------------------
number@proxy: ; number@proxy
2591 : ad fa 3a LDA $3afa ; (best + 0)
2594 : 85 12 __ STA P5 
2596 : ad fb 3a LDA $3afb ; (best + 1)
2599 : 85 13 __ STA P6 
259b : 4c 31 27 JMP $2731 ; (number.s4 + 0)
--------------------------------------------------------------------
background: ; background(u8,u8)->void
; 166, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
259e : a9 20 __ LDA #$20
25a0 : 85 43 __ STA T0 + 0 
25a2 : 85 0f __ STA P2 
25a4 : a9 04 __ LDA #$04
25a6 : 85 1d __ STA ACCU + 2 
25a8 : 85 10 __ STA P3 
25aa : a5 0d __ LDA P0 ; (x + 0)
25ac : c9 50 __ CMP #$50
25ae : b0 0c __ BCS $25bc ; (background.s5 + 0)
.s6:
25b0 : a5 0e __ LDA P1 ; (y + 0)
25b2 : c9 15 __ CMP #$15
25b4 : d0 09 __ BNE $25bf ; (background.s8 + 0)
.s7:
25b6 : a9 05 __ LDA #$05
25b8 : 85 0f __ STA P2 
.s42:
25ba : 85 10 __ STA P3 
.s5:
25bc : 4c 84 26 JMP $2684 ; (cell.s4 + 0)
.s8:
25bf : c9 16 __ CMP #$16
25c1 : a9 00 __ LDA #$00
25c3 : 90 06 __ BCC $25cb ; (background.s10 + 0)
.s9:
25c5 : 85 0f __ STA P2 
25c7 : a9 0d __ LDA #$0d
25c9 : b0 ef __ BCS $25ba ; (background.s42 + 0)
.s10:
25cb : 85 1b __ STA ACCU + 0 
.l11:
25cd : 0a __ __ ASL
25ce : 0a __ __ ASL
25cf : aa __ __ TAX
25d0 : 38 __ __ SEC
25d1 : a5 0d __ LDA P0 ; (x + 0)
25d3 : fd 8b 53 SBC $538b,x ; (pipes[0].x + 0)
25d6 : a8 __ __ TAY
25d7 : a9 00 __ LDA #$00
25d9 : fd 8c 53 SBC $538c,x ; (pipes[0].x + 1)
25dc : 85 1c __ STA ACCU + 1 
25de : 49 80 __ EOR #$80
25e0 : c9 7f __ CMP #$7f
25e2 : d0 02 __ BNE $25e6 ; (background.s38 + 0)
.s37:
25e4 : c0 ff __ CPY #$ff
.s38:
25e6 : 90 69 __ BCC $2651 ; (background.s17 + 0)
.s12:
25e8 : a5 1c __ LDA ACCU + 1 
25ea : 30 06 __ BMI $25f2 ; (background.s13 + 0)
.s36:
25ec : d0 63 __ BNE $2651 ; (background.s17 + 0)
.s35:
25ee : c0 08 __ CPY #$08
25f0 : b0 5f __ BCS $2651 ; (background.s17 + 0)
.s13:
25f2 : a5 0e __ LDA P1 ; (y + 0)
25f4 : dd 8d 53 CMP $538d,x ; (pipes[0].gap + 0)
25f7 : 90 0d __ BCC $2606 ; (background.s14 + 0)
.s33:
25f9 : bd 8d 53 LDA $538d,x ; (pipes[0].gap + 0)
25fc : 69 06 __ ADC #$06
25fe : b0 51 __ BCS $2651 ; (background.s17 + 0)
.s34:
2600 : c5 0e __ CMP P1 ; (y + 0)
2602 : 90 02 __ BCC $2606 ; (background.s14 + 0)
.s41:
2604 : d0 4b __ BNE $2651 ; (background.s17 + 0)
.s14:
2606 : bd 8d 53 LDA $538d,x ; (pipes[0].gap + 0)
2609 : 38 __ __ SEC
260a : e9 01 __ SBC #$01
260c : 85 47 __ STA T3 + 0 
260e : a9 00 __ LDA #$00
2610 : e9 00 __ SBC #$00
2612 : 85 48 __ STA T3 + 1 
2614 : d0 06 __ BNE $261c ; (background.s23 + 0)
.s32:
2616 : a5 0e __ LDA P1 ; (y + 0)
2618 : c5 47 __ CMP T3 + 0 
261a : f0 49 __ BEQ $2665 ; (background.s15 + 0)
.s23:
261c : 18 __ __ CLC
261d : a5 47 __ LDA T3 + 0 
261f : 69 08 __ ADC #$08
2621 : 85 47 __ STA T3 + 0 
2623 : a5 48 __ LDA T3 + 1 
2625 : 69 00 __ ADC #$00
2627 : d0 06 __ BNE $262f ; (background.s24 + 0)
.s31:
2629 : a5 0e __ LDA P1 ; (y + 0)
262b : c5 47 __ CMP T3 + 0 
262d : f0 36 __ BEQ $2665 ; (background.s15 + 0)
.s24:
262f : a5 1c __ LDA ACCU + 1 
2631 : d0 1e __ BNE $2651 ; (background.s17 + 0)
.s30:
2633 : c0 07 __ CPY #$07
2635 : b0 1a __ BCS $2651 ; (background.s17 + 0)
.s25:
2637 : a9 04 __ LDA #$04
2639 : 85 1d __ STA ACCU + 2 
263b : 98 __ __ TYA
263c : d0 07 __ BNE $2645 ; (background.s27 + 0)
.s26:
263e : a9 0a __ LDA #$0a
.s39:
2640 : 85 43 __ STA T0 + 0 
2642 : 4c 51 26 JMP $2651 ; (background.s17 + 0)
.s27:
2645 : c9 06 __ CMP #$06
2647 : d0 04 __ BNE $264d ; (background.s29 + 0)
.s28:
2649 : a9 0c __ LDA #$0c
264b : d0 f3 __ BNE $2640 ; (background.s39 + 0)
.s29:
264d : a9 0b __ LDA #$0b
264f : 85 43 __ STA T0 + 0 
.s17:
2651 : e6 1b __ INC ACCU + 0 
2653 : a5 1b __ LDA ACCU + 0 
2655 : c9 04 __ CMP #$04
2657 : f0 03 __ BEQ $265c ; (background.s40 + 0)
2659 : 4c cd 25 JMP $25cd ; (background.l11 + 0)
.s40:
265c : a5 43 __ LDA T0 + 0 
265e : 85 0f __ STA P2 
2660 : a5 1d __ LDA ACCU + 2 
2662 : 4c ba 25 JMP $25ba ; (background.s42 + 0)
.s15:
2665 : a9 05 __ LDA #$05
2667 : 85 1d __ STA ACCU + 2 
2669 : c0 ff __ CPY #$ff
266b : d0 04 __ BNE $2671 ; (background.s18 + 0)
.s16:
266d : a9 0d __ LDA #$0d
266f : d0 cf __ BNE $2640 ; (background.s39 + 0)
.s18:
2671 : 98 __ __ TYA
2672 : d0 04 __ BNE $2678 ; (background.s20 + 0)
.s19:
2674 : a9 0e __ LDA #$0e
2676 : d0 c8 __ BNE $2640 ; (background.s39 + 0)
.s20:
2678 : c9 07 __ CMP #$07
267a : d0 04 __ BNE $2680 ; (background.s22 + 0)
.s21:
267c : a9 10 __ LDA #$10
267e : d0 c0 __ BNE $2640 ; (background.s39 + 0)
.s22:
2680 : a9 0f __ LDA #$0f
2682 : d0 bc __ BNE $2640 ; (background.s39 + 0)
--------------------------------------------------------------------
cell: ; cell(u8,u8,u8,u8)->void
; 147, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2684 : a5 0e __ LDA P1 ; (y + 0)
2686 : 0a __ __ ASL
2687 : aa __ __ TAX
2688 : bd 59 53 LDA $5359,x ; (row_addr[0] + 0)
268b : 65 0d __ ADC P0 ; (x + 0)
268d : a8 __ __ TAY
268e : bd 5a 53 LDA $535a,x ; (row_addr[0] + 1)
2691 : 69 00 __ ADC #$00
2693 : 85 1c __ STA ACCU + 1 
2695 : 18 __ __ CLC
2696 : 69 53 __ ADC #$53
2698 : 85 44 __ STA T1 + 1 
269a : a9 9b __ LDA #$9b
269c : 85 43 __ STA T1 + 0 
269e : a5 0f __ LDA P2 ; (g + 0)
26a0 : d1 43 __ CMP (T1 + 0),y 
26a2 : d0 04 __ BNE $26a8 ; (cell.s5 + 0)
.s13:
26a4 : a9 00 __ LDA #$00
26a6 : f0 04 __ BEQ $26ac ; (cell.s6 + 0)
.s5:
26a8 : 91 43 __ STA (T1 + 0),y 
26aa : a9 01 __ LDA #$01
.s6:
26ac : 85 45 __ STA T2 + 0 
26ae : a9 6b __ LDA #$6b
26b0 : 85 43 __ STA T1 + 0 
26b2 : 18 __ __ CLC
26b3 : a9 5b __ LDA #$5b
26b5 : 65 1c __ ADC ACCU + 1 
26b7 : 85 44 __ STA T1 + 1 
26b9 : a5 10 __ LDA P3 ; (col + 0)
26bb : d1 43 __ CMP (T1 + 0),y 
26bd : f0 0b __ BEQ $26ca ; (cell.s12 + 0)
.s7:
26bf : 91 43 __ STA (T1 + 0),y 
26c1 : a5 45 __ LDA T2 + 0 
26c3 : 09 02 __ ORA #$02
26c5 : 85 45 __ STA T2 + 0 
26c7 : 4c ce 26 JMP $26ce ; (cell.s8 + 0)
.s12:
26ca : a5 45 __ LDA T2 + 0 
26cc : f0 58 __ BEQ $2726 ; (cell.s3 + 0)
.s8:
26ce : 0a __ __ ASL
26cf : 0a __ __ ASL
26d0 : 05 45 __ ORA T2 + 0 
26d2 : 85 43 __ STA T1 + 0 
26d4 : a9 3b __ LDA #$3b
26d6 : 85 45 __ STA T2 + 0 
26d8 : 18 __ __ CLC
26d9 : a9 63 __ LDA #$63
26db : 65 1c __ ADC ACCU + 1 
26dd : 85 46 __ STA T2 + 1 
26df : b1 45 __ LDA (T2 + 0),y 
26e1 : aa __ __ TAX
26e2 : 05 43 __ ORA T1 + 0 
26e4 : 91 45 __ STA (T2 + 0),y 
26e6 : 8a __ __ TXA
26e7 : d0 31 __ BNE $271a ; (cell.s9 + 0)
.s11:
26e9 : ad f6 3a LDA $3af6 ; (dirty_count + 0)
26ec : 85 43 __ STA T1 + 0 
26ee : 18 __ __ CLC
26ef : 69 01 __ ADC #$01
26f1 : 8d f6 3a STA $3af6 ; (dirty_count + 0)
26f4 : ad f7 3a LDA $3af7 ; (dirty_count + 1)
26f7 : 85 44 __ STA T1 + 1 
26f9 : 69 00 __ ADC #$00
26fb : 8d f7 3a STA $3af7 ; (dirty_count + 1)
26fe : 06 43 __ ASL T1 + 0 
2700 : 26 44 __ ROL T1 + 1 
2702 : 18 __ __ CLC
2703 : a9 0c __ LDA #$0c
2705 : 65 43 __ ADC T1 + 0 
2707 : 85 43 __ STA T1 + 0 
2709 : a9 6b __ LDA #$6b
270b : 65 44 __ ADC T1 + 1 
270d : 85 44 __ STA T1 + 1 
270f : 98 __ __ TYA
2710 : a0 00 __ LDY #$00
2712 : 91 43 __ STA (T1 + 0),y 
2714 : a5 1c __ LDA ACCU + 1 
2716 : c8 __ __ INY
2717 : 91 43 __ STA (T1 + 0),y 
2719 : 8a __ __ TXA
.s9:
271a : 29 03 __ AND #$03
271c : d0 08 __ BNE $2726 ; (cell.s3 + 0)
.s10:
271e : ee f8 3a INC $3af8 ; (front_count + 0)
2721 : d0 03 __ BNE $2726 ; (cell.s3 + 0)
.s14:
2723 : ee f9 3a INC $3af9 ; (front_count + 1)
.s3:
2726 : 60 __ __ RTS
--------------------------------------------------------------------
number@proxy: ; number@proxy
2727 : ad ef 3a LDA $3aef ; (score + 0)
272a : 85 12 __ STA P5 
272c : ad f0 3a LDA $3af0 ; (score + 1)
272f : 85 13 __ STA P6 
--------------------------------------------------------------------
number: ; number(u8,u16)->void
; 152, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2731 : a5 12 __ LDA P5 ; (n + 0)
2733 : 85 1b __ STA ACCU + 0 
2735 : a9 04 __ LDA #$04
2737 : 85 49 __ STA T3 + 0 
2739 : a5 13 __ LDA P6 ; (n + 1)
273b : 85 1c __ STA ACCU + 1 
273d : 18 __ __ CLC
273e : a9 17 __ LDA #$17
2740 : 85 0e __ STA P1 
2742 : a9 0d __ LDA #$0d
2744 : 85 10 __ STA P3 
2746 : a5 11 __ LDA P4 ; (x + 0)
2748 : 69 03 __ ADC #$03
.l5:
274a : 85 0d __ STA P0 
274c : a9 0a __ LDA #$0a
274e : 20 ea 39 JSR $39ea ; (divmod + 53)
2751 : a5 1b __ LDA ACCU + 0 
2753 : 85 47 __ STA T0 + 0 
2755 : a5 1c __ LDA ACCU + 1 
2757 : 85 48 __ STA T0 + 1 
2759 : 18 __ __ CLC
275a : a5 05 __ LDA WORK + 2 
275c : 69 11 __ ADC #$11
275e : 85 0f __ STA P2 
2760 : 20 84 26 JSR $2684 ; (cell.s4 + 0)
2763 : a5 47 __ LDA T0 + 0 
2765 : 85 1b __ STA ACCU + 0 
2767 : a5 48 __ LDA T0 + 1 
2769 : 85 1c __ STA ACCU + 1 
276b : 38 __ __ SEC
276c : a5 0d __ LDA P0 
276e : e9 01 __ SBC #$01
2770 : c6 49 __ DEC T3 + 0 
2772 : d0 d6 __ BNE $274a ; (number.l5 + 0)
.s3:
2774 : 60 __ __ RTS
--------------------------------------------------------------------
game_over: ; game_over()->void
; 470, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2775 : a9 1e __ LDA #$1e
2777 : 8d bb 7a STA $7abb ; (death_delay + 0)
277a : a9 02 __ LDA #$02
277c : 8d ee 3a STA $3aee ; (state + 0)
277f : a9 4a __ LDA #$4a
2781 : 85 11 __ STA P4 
2783 : ad fb 3a LDA $3afb ; (best + 1)
2786 : cd f0 3a CMP $3af0 ; (score + 1)
2789 : d0 06 __ BNE $2791 ; (game_over.s8 + 0)
.s7:
278b : ad fa 3a LDA $3afa ; (best + 0)
278e : cd ef 3a CMP $3aef ; (score + 0)
.s8:
2791 : b0 0c __ BCS $279f ; (game_over.s6 + 0)
.s5:
2793 : ad ef 3a LDA $3aef ; (score + 0)
2796 : 8d fa 3a STA $3afa ; (best + 0)
2799 : ad f0 3a LDA $3af0 ; (score + 1)
279c : 8d fb 3a STA $3afb ; (best + 1)
.s6:
279f : 20 91 25 JSR $2591 ; (number@proxy + 0)
--------------------------------------------------------------------
banner: ; banner()->void
; 414, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
27a2 : a2 00 __ LDX #$00
27a4 : ad ee 3a LDA $3aee ; (state + 0)
27a7 : 85 4a __ STA T4 + 0 
27a9 : d0 08 __ BNE $27b3 ; (banner.s6 + 0)
.s5:
27ab : a9 01 __ LDA #$01
27ad : 85 4b __ STA T5 + 0 
27af : a9 02 __ LDA #$02
27b1 : d0 04 __ BNE $27b7 ; (banner.s7 + 0)
.s6:
27b3 : 86 4b __ STX T5 + 0 
27b5 : a9 06 __ LDA #$06
.s7:
27b7 : 86 4c __ STX T6 + 0 
27b9 : 8d fd 3b STA $3bfd ; (panel_y + 0)
27bc : 85 49 __ STA T3 + 0 
27be : a9 0d __ LDA #$0d
27c0 : 85 10 __ STA P3 
.l8:
27c2 : a0 00 __ LDY #$00
27c4 : 84 4d __ STY T7 + 0 
27c6 : 84 43 __ STY T1 + 0 
.l24:
27c8 : a5 4c __ LDA T6 + 0 
27ca : f0 08 __ BEQ $27d4 ; (banner.s11 + 0)
.s9:
27cc : c9 07 __ CMP #$07
27ce : d0 10 __ BNE $27e0 ; (banner.s23 + 0)
.s10:
27d0 : a9 02 __ LDA #$02
27d2 : 85 43 __ STA T1 + 0 
.s11:
27d4 : a5 4d __ LDA T7 + 0 
27d6 : c9 01 __ CMP #$01
27d8 : a9 00 __ LDA #$00
27da : 69 9a __ ADC #$9a
27dc : 65 43 __ ADC T1 + 0 
27de : 85 43 __ STA T1 + 0 
.s23:
27e0 : a5 49 __ LDA T3 + 0 
27e2 : 85 0e __ STA P1 
.l12:
27e4 : a5 43 __ LDA T1 + 0 
27e6 : 85 0f __ STA P2 
27e8 : 98 __ __ TYA
27e9 : 18 __ __ CLC
27ea : 69 1c __ ADC #$1c
27ec : 85 0d __ STA P0 
27ee : 20 84 26 JSR $2684 ; (cell.s4 + 0)
27f1 : e6 4d __ INC T7 + 0 
27f3 : a5 4d __ LDA T7 + 0 
27f5 : c9 18 __ CMP #$18
27f7 : b0 11 __ BCS $280a ; (banner.s14 + 0)
.s13:
27f9 : a5 0d __ LDA P0 
27fb : 69 e5 __ ADC #$e5
27fd : a8 __ __ TAY
27fe : a9 00 __ LDA #$00
2800 : 85 43 __ STA T1 + 0 
2802 : a5 4d __ LDA T7 + 0 
2804 : c9 17 __ CMP #$17
2806 : d0 dc __ BNE $27e4 ; (banner.l12 + 0)
2808 : f0 be __ BEQ $27c8 ; (banner.l24 + 0)
.s14:
280a : e6 49 __ INC T3 + 0 
280c : e6 4c __ INC T6 + 0 
280e : a5 4c __ LDA T6 + 0 
2810 : c9 08 __ CMP #$08
2812 : 90 ae __ BCC $27c2 ; (banner.l8 + 0)
.s15:
2814 : a5 4b __ LDA T5 + 0 
2816 : f0 1a __ BEQ $2832 ; (banner.s18 + 0)
.s16:
2818 : a9 29 __ LDA #$29
281a : 85 13 __ STA P6 
281c : a9 24 __ LDA #$24
281e : 85 12 __ STA P5 
2820 : 20 9c 28 JSR $289c ; (panel_text@proxy + 0)
2823 : a9 05 __ LDA #$05
.s22:
2825 : 85 11 __ STA P4 
2827 : a9 29 __ LDA #$29
2829 : a0 2e __ LDY #$2e
.s17:
282b : 84 12 __ STY P5 
282d : 85 13 __ STA P6 
282f : 4c a0 28 JMP $28a0 ; (panel_text.s4 + 0)
.s18:
2832 : a5 4a __ LDA T4 + 0 
2834 : c9 02 __ CMP #$02
2836 : d0 49 __ BNE $2881 ; (banner.s20 + 0)
.s19:
2838 : a9 01 __ LDA #$01
283a : 85 11 __ STA P4 
283c : a9 29 __ LDA #$29
283e : 85 13 __ STA P6 
2840 : a9 3c __ LDA #$3c
2842 : 85 12 __ STA P5 
2844 : 20 a0 28 JSR $28a0 ; (panel_text.s4 + 0)
2847 : ad ef 3a LDA $3aef ; (score + 0)
284a : 85 0f __ STA P2 
284c : a9 9c __ LDA #$9c
284e : 85 0d __ STA P0 
2850 : a9 29 __ LDA #$29
2852 : 85 0e __ STA P1 
2854 : ad f0 3a LDA $3af0 ; (score + 1)
2857 : 85 10 __ STA P3 
2859 : 20 46 29 JSR $2946 ; (score_line.s4 + 0)
285c : a9 03 __ LDA #$03
285e : 85 11 __ STA P4 
2860 : 20 52 3a JSR $3a52 ; (panel_text@proxy + 0)
2863 : ad fa 3a LDA $3afa ; (best + 0)
2866 : 85 0f __ STA P2 
2868 : a9 a3 __ LDA #$a3
286a : 85 0d __ STA P0 
286c : a9 29 __ LDA #$29
286e : 85 0e __ STA P1 
2870 : ad fb 3a LDA $3afb ; (best + 1)
2873 : 85 10 __ STA P3 
2875 : 20 46 29 JSR $2946 ; (score_line.s4 + 0)
2878 : e6 11 __ INC P4 
287a : 20 52 3a JSR $3a52 ; (panel_text@proxy + 0)
287d : a9 06 __ LDA #$06
287f : d0 a4 __ BNE $2825 ; (banner.s22 + 0)
.s20:
2881 : c9 03 __ CMP #$03
2883 : d0 16 __ BNE $289b ; (banner.s3 + 0)
.s21:
2885 : a9 29 __ LDA #$29
2887 : 85 13 __ STA P6 
2889 : a9 aa __ LDA #$aa
288b : 85 12 __ STA P5 
288d : 20 9c 28 JSR $289c ; (panel_text@proxy + 0)
2890 : a9 05 __ LDA #$05
2892 : 85 11 __ STA P4 
2894 : a9 29 __ LDA #$29
2896 : a0 b1 __ LDY #$b1
2898 : 4c 2b 28 JMP $282b ; (banner.s17 + 0)
.s3:
289b : 60 __ __ RTS
--------------------------------------------------------------------
panel_text@proxy: ; panel_text@proxy
289c : a9 02 __ LDA #$02
289e : 85 11 __ STA P4 
--------------------------------------------------------------------
panel_text: ; panel_text(u8,const u8*)->void
; 392, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
28a0 : a0 00 __ LDY #$00
28a2 : b1 12 __ LDA (P5),y ; (s + 0)
28a4 : f0 7d __ BEQ $2923 ; (panel_text.s3 + 0)
.s5:
28a6 : 85 48 __ STA T4 + 0 
28a8 : a5 12 __ LDA P5 ; (s + 0)
28aa : 85 43 __ STA T0 + 0 
28ac : a5 13 __ LDA P6 ; (s + 1)
28ae : 85 44 __ STA T0 + 1 
28b0 : ad fd 3b LDA $3bfd ; (panel_y + 0)
28b3 : 18 __ __ CLC
28b4 : 65 11 __ ADC P4 ; (y + 0)
28b6 : 85 47 __ STA T2 + 0 
28b8 : a2 00 __ LDX #$00
.l15:
28ba : c8 __ __ INY
28bb : d0 02 __ BNE $28bf ; (panel_text.s18 + 0)
.s17:
28bd : e6 44 __ INC T0 + 1 
.s18:
28bf : e8 __ __ INX
28c0 : b1 43 __ LDA (T0 + 0),y 
28c2 : d0 f6 __ BNE $28ba ; (panel_text.l15 + 0)
.s6:
28c4 : a5 48 __ LDA T4 + 0 
28c6 : f0 5b __ BEQ $2923 ; (panel_text.s3 + 0)
.s7:
28c8 : 86 45 __ STX T1 + 0 
28ca : 38 __ __ SEC
28cb : a9 18 __ LDA #$18
28cd : e5 45 __ SBC T1 + 0 
28cf : a8 __ __ TAY
28d0 : a9 00 __ LDA #$00
28d2 : e9 00 __ SBC #$00
28d4 : aa __ __ TAX
28d5 : 0a __ __ ASL
28d6 : 98 __ __ TYA
28d7 : 69 00 __ ADC #$00
28d9 : a8 __ __ TAY
28da : 8a __ __ TXA
28db : 69 00 __ ADC #$00
28dd : 4a __ __ LSR
28de : 98 __ __ TYA
28df : 6a __ __ ROR
28e0 : 18 __ __ CLC
28e1 : 69 1c __ ADC #$1c
28e3 : 85 48 __ STA T4 + 0 
28e5 : a9 0d __ LDA #$0d
28e7 : 85 10 __ STA P3 
.l8:
28e9 : a0 00 __ LDY #$00
28eb : 84 0f __ STY P2 
28ed : b1 12 __ LDA (P5),y ; (s + 0)
28ef : c9 30 __ CMP #$30
28f1 : 90 17 __ BCC $290a ; (panel_text.s11 + 0)
.s9:
28f3 : c9 3a __ CMP #$3a
28f5 : b0 07 __ BCS $28fe ; (panel_text.s12 + 0)
.s10:
28f7 : e9 1e __ SBC #$1e
.s16:
28f9 : 85 0f __ STA P2 
28fb : 4c 0a 29 JMP $290a ; (panel_text.s11 + 0)
.s12:
28fe : c9 41 __ CMP #$41
2900 : 90 08 __ BCC $290a ; (panel_text.s11 + 0)
.s13:
2902 : c9 5b __ CMP #$5b
2904 : b0 04 __ BCS $290a ; (panel_text.s11 + 0)
.s14:
2906 : e9 c0 __ SBC #$c0
2908 : 85 0f __ STA P2 
.s11:
290a : a5 48 __ LDA T4 + 0 
290c : 85 0d __ STA P0 
290e : a5 47 __ LDA T2 + 0 
2910 : 85 0e __ STA P1 
2912 : 20 84 26 JSR $2684 ; (cell.s4 + 0)
2915 : e6 12 __ INC P5 ; (s + 0)
2917 : d0 02 __ BNE $291b ; (panel_text.s20 + 0)
.s19:
2919 : e6 13 __ INC P6 ; (s + 1)
.s20:
291b : e6 48 __ INC T4 + 0 
291d : a0 00 __ LDY #$00
291f : b1 12 __ LDA (P5),y ; (s + 0)
2921 : d0 c6 __ BNE $28e9 ; (panel_text.l8 + 0)
.s3:
2923 : 60 __ __ RTS
--------------------------------------------------------------------
2924 : __ __ __ BYT 46 4c 41 50 50 59 20 38 30 00                   : FLAPPY 80.
--------------------------------------------------------------------
292e : __ __ __ BYT 53 50 41 43 45 20 4f 52 20 46 49 52 45 00       : SPACE OR FIRE.
--------------------------------------------------------------------
293c : __ __ __ BYT 47 41 4d 45 20 4f 56 45 52 00                   : GAME OVER.
--------------------------------------------------------------------
score_line: ; score_line(const u8*,u16)->const u8*
; 404, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2946 : a0 00 __ LDY #$00
.l5:
2948 : b1 0d __ LDA (P0),y ; (label + 0)
294a : 99 ac 7a STA $7aac,y ; (line[0] + 0)
294d : c8 __ __ INY
294e : c0 06 __ CPY #$06
2950 : d0 f6 __ BNE $2948 ; (score_line.l5 + 0)
.s6:
2952 : a9 00 __ LDA #$00
2954 : 8d b6 7a STA $7ab6 ; (line[0] + 10)
2957 : a5 0f __ LDA P2 ; (n + 0)
2959 : 85 1b __ STA ACCU + 0 
295b : a5 10 __ LDA P3 ; (n + 1)
295d : 85 1c __ STA ACCU + 1 
295f : a9 0a __ LDA #$0a
2961 : 20 ea 39 JSR $39ea ; (divmod + 53)
2964 : 18 __ __ CLC
2965 : a5 05 __ LDA WORK + 2 
2967 : 69 30 __ ADC #$30
2969 : 8d b5 7a STA $7ab5 ; (line[0] + 9)
296c : a9 0a __ LDA #$0a
296e : 20 ea 39 JSR $39ea ; (divmod + 53)
2971 : 18 __ __ CLC
2972 : a5 05 __ LDA WORK + 2 
2974 : 69 30 __ ADC #$30
2976 : 8d b4 7a STA $7ab4 ; (line[0] + 8)
2979 : a9 0a __ LDA #$0a
297b : 20 ea 39 JSR $39ea ; (divmod + 53)
297e : 18 __ __ CLC
297f : a5 05 __ LDA WORK + 2 
2981 : 69 30 __ ADC #$30
2983 : 8d b3 7a STA $7ab3 ; (line[0] + 7)
2986 : a9 0a __ LDA #$0a
2988 : 20 ea 39 JSR $39ea ; (divmod + 53)
298b : 18 __ __ CLC
298c : a5 05 __ LDA WORK + 2 
298e : 69 30 __ ADC #$30
2990 : 8d b2 7a STA $7ab2 ; (line[0] + 6)
2993 : a9 ac __ LDA #$ac
2995 : 85 1b __ STA ACCU + 0 
2997 : a9 7a __ LDA #$7a
2999 : 85 1c __ STA ACCU + 1 
.s3:
299b : 60 __ __ RTS
--------------------------------------------------------------------
299c : __ __ __ BYT 53 43 4f 52 45 20 00                            : SCORE .
--------------------------------------------------------------------
29a3 : __ __ __ BYT 42 45 53 54 20 20 00                            : BEST  .
--------------------------------------------------------------------
29aa : __ __ __ BYT 50 41 55 53 45 44 00                            : PAUSED.
--------------------------------------------------------------------
29b1 : __ __ __ BYT 50 20 54 4f 20 43 4f 4e 54 49 4e 55 45 00       : P TO CONTINUE.
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
29bf : a9 00 __ LDA #$00
29c1 : 85 10 __ STA P3 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "/Users/lukaszdziwosz/Desktop/80Terminal/.tools/oscar64/include/string.h"
.s4:
29c3 : a5 0f __ LDA P2 
29c5 : a6 12 __ LDX P5 
29c7 : f0 0c __ BEQ $29d5 ; (memset.s4 + 18)
29c9 : a0 00 __ LDY #$00
29cb : 91 0d __ STA (P0),y 
29cd : c8 __ __ INY
29ce : d0 fb __ BNE $29cb ; (memset.s4 + 8)
29d0 : e6 0e __ INC P1 
29d2 : ca __ __ DEX
29d3 : d0 f6 __ BNE $29cb ; (memset.s4 + 8)
29d5 : a4 11 __ LDY P4 
29d7 : f0 05 __ BEQ $29de ; (memset.s3 + 0)
29d9 : 88 __ __ DEY
29da : 91 0d __ STA (P0),y 
29dc : d0 fb __ BNE $29d9 ; (memset.s4 + 22)
.s3:
29de : 60 __ __ RTS
--------------------------------------------------------------------
wait_frame: ; wait_frame()->void
; 128, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.l4:
29df : ad 00 d6 LDA $d600 
29e2 : 29 20 __ AND #$20
29e4 : d0 f9 __ BNE $29df ; (wait_frame.l4 + 0)
.l5:
29e6 : ad 00 d6 LDA $d600 
29e9 : 29 20 __ AND #$20
29eb : f0 f9 __ BEQ $29e6 ; (wait_frame.l5 + 0)
.s3:
29ed : 60 __ __ RTS
--------------------------------------------------------------------
show_frame: ; show_frame()->void
; 681, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
29ee : ad d0 3c LDA $3cd0 ; (saved_regs[0] + 28)
29f1 : 29 0f __ AND #$0f
29f3 : 09 10 __ ORA #$10
29f5 : 85 43 __ STA T0 + 0 
29f7 : a9 1c __ LDA #$1c
29f9 : 8d 00 d6 STA $d600 
29fc : ad f5 3a LDA $3af5 ; (phase + 0)
29ff : 18 __ __ CLC
2a00 : 69 01 __ ADC #$01
2a02 : 0a __ __ ASL
2a03 : 0a __ __ ASL
2a04 : 0a __ __ ASL
2a05 : 0a __ __ ASL
2a06 : 0a __ __ ASL
2a07 : 05 43 __ ORA T0 + 0 
.l5:
2a09 : 2c 00 d6 BIT $d600 
2a0c : 10 fb __ BPL $2a09 ; (show_frame.l5 + 0)
.s6:
2a0e : 8d 01 d6 STA $d601 
2a11 : ad fe 3b LDA $3bfe ; (flash + 0)
2a14 : f0 18 __ BEQ $2a2e ; (show_frame.s11 + 0)
.s7:
2a16 : a9 1a __ LDA #$1a
2a18 : 8d 00 d6 STA $d600 
2a1b : ce fe 3b DEC $3bfe ; (flash + 0)
2a1e : f0 04 __ BEQ $2a24 ; (show_frame.s19 + 0)
.s8:
2a20 : a9 0f __ LDA #$0f
2a22 : d0 02 __ BNE $2a26 ; (show_frame.l9 + 0)
.s19:
2a24 : a9 06 __ LDA #$06
.l9:
2a26 : 2c 00 d6 BIT $d600 
2a29 : 10 fb __ BPL $2a26 ; (show_frame.l9 + 0)
.s10:
2a2b : 8d 01 d6 STA $d601 
.s11:
2a2e : 20 8e 2c JSR $2c8e ; (load_pose.s4 + 0)
2a31 : ad fc 3b LDA $3bfc ; (bird_set + 0)
2a34 : 8d ff 3a STA $3aff ; (shown_set + 0)
2a37 : ad 75 3a LDA $3a75 ; (bird_row + 0)
2a3a : 8d 76 3a STA $3a76 ; (shown_row + 0)
2a3d : ad 00 d6 LDA $d600 
2a40 : 29 20 __ AND #$20
2a42 : d0 08 __ BNE $2a4c ; (show_frame.s12 + 0)
.s18:
2a44 : ee b7 7a INC $7ab7 ; (blank_overruns + 0)
2a47 : d0 03 __ BNE $2a4c ; (show_frame.s12 + 0)
.s22:
2a49 : ee b8 7a INC $7ab8 ; (blank_overruns + 1)
.s12:
2a4c : ee fc 3a INC $3afc ; (frame_count + 0)
2a4f : d0 03 __ BNE $2a54 ; (show_frame.s21 + 0)
.s20:
2a51 : ee fd 3a INC $3afd ; (frame_count + 1)
.s21:
2a54 : ad ff 3b LDA $3bff ; (flip + 0)
2a57 : d0 08 __ BNE $2a61 ; (show_frame.s3 + 0)
.s13:
2a59 : ad f9 3a LDA $3af9 ; (front_count + 1)
2a5c : 0d f8 3a ORA $3af8 ; (front_count + 0)
2a5f : d0 01 __ BNE $2a62 ; (show_frame.s14 + 0)
.s3:
2a61 : 60 __ __ RTS
.s14:
2a62 : a9 03 __ LDA #$03
2a64 : 85 11 __ STA P4 
2a66 : ad 0b 6b LDA $6b0b ; (page + 0)
2a69 : f0 08 __ BEQ $2a73 ; (show_frame.s17 + 0)
.s15:
2a6b : a9 00 __ LDA #$00
2a6d : 85 0f __ STA P2 
2a6f : a9 10 __ LDA #$10
2a71 : d0 02 __ BNE $2a75 ; (show_frame.s16 + 0)
.s17:
2a73 : 85 0f __ STA P2 
.s16:
2a75 : 85 10 __ STA P3 
--------------------------------------------------------------------
write_cells: ; write_cells(u16,u8)->void
; 602, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2a77 : ad f6 3a LDA $3af6 ; (dirty_count + 0)
2a7a : 0a __ __ ASL
2a7b : aa __ __ TAX
2a7c : ad f7 3a LDA $3af7 ; (dirty_count + 1)
2a7f : 2a __ __ ROL
2a80 : 85 1c __ STA ACCU + 1 
2a82 : 8a __ __ TXA
2a83 : 18 __ __ CLC
2a84 : 69 0c __ ADC #$0c
2a86 : 85 45 __ STA T2 + 0 
2a88 : a9 6b __ LDA #$6b
2a8a : 65 1c __ ADC ACCU + 1 
2a8c : 85 46 __ STA T2 + 1 
2a8e : a5 11 __ LDA P4 ; (bits + 0)
2a90 : 85 47 __ STA T3 + 0 
2a92 : a9 0c __ LDA #$0c
2a94 : 85 48 __ STA T4 + 0 
2a96 : a9 6b __ LDA #$6b
2a98 : 85 49 __ STA T4 + 1 
2a9a : 8a __ __ TXA
2a9b : 05 1c __ ORA ACCU + 1 
2a9d : f0 48 __ BEQ $2ae7 ; (write_cells.s17 + 0)
.s5:
2a9f : a5 11 __ LDA P4 ; (bits + 0)
2aa1 : 29 05 __ AND #$05
2aa3 : 85 4a __ STA T5 + 0 
2aa5 : a9 ff __ LDA #$ff
2aa7 : 85 1b __ STA ACCU + 0 
2aa9 : 85 1c __ STA ACCU + 1 
2aab : a9 0c __ LDA #$0c
2aad : 85 4b __ STA T6 + 0 
2aaf : a9 6b __ LDA #$6b
2ab1 : 85 4c __ STA T6 + 1 
.l6:
2ab3 : a0 00 __ LDY #$00
2ab5 : b1 4b __ LDA (T6 + 0),y 
2ab7 : 85 4d __ STA T7 + 0 
2ab9 : a9 3b __ LDA #$3b
2abb : 85 43 __ STA T1 + 0 
2abd : 18 __ __ CLC
2abe : c8 __ __ INY
2abf : b1 4b __ LDA (T6 + 0),y 
2ac1 : 85 4e __ STA T7 + 1 
2ac3 : 69 63 __ ADC #$63
2ac5 : 85 44 __ STA T1 + 1 
2ac7 : a4 4d __ LDY T7 + 0 
2ac9 : b1 43 __ LDA (T1 + 0),y 
2acb : 25 4a __ AND T5 + 0 
2acd : f0 03 __ BEQ $2ad2 ; (write_cells.s16 + 0)
2acf : 4c 0b 2c JMP $2c0b ; (write_cells.s7 + 0)
.s16:
2ad2 : 18 __ __ CLC
2ad3 : a5 4b __ LDA T6 + 0 
2ad5 : 69 02 __ ADC #$02
2ad7 : 85 4b __ STA T6 + 0 
2ad9 : 90 02 __ BCC $2add ; (write_cells.s58 + 0)
.s57:
2adb : e6 4c __ INC T6 + 1 
.s58:
2add : c5 45 __ CMP T2 + 0 
2adf : d0 d2 __ BNE $2ab3 ; (write_cells.l6 + 0)
.s46:
2ae1 : a5 4c __ LDA T6 + 1 
2ae3 : c5 46 __ CMP T2 + 1 
2ae5 : d0 cc __ BNE $2ab3 ; (write_cells.l6 + 0)
.s17:
2ae7 : a5 45 __ LDA T2 + 0 
2ae9 : c9 0c __ CMP #$0c
2aeb : d0 06 __ BNE $2af3 ; (write_cells.s18 + 0)
.s45:
2aed : a5 46 __ LDA T2 + 1 
2aef : c9 6b __ CMP #$6b
2af1 : f0 78 __ BEQ $2b6b ; (write_cells.s34 + 0)
.s18:
2af3 : a5 47 __ LDA T3 + 0 
2af5 : 29 0a __ AND #$0a
2af7 : 85 47 __ STA T3 + 0 
2af9 : 18 __ __ CLC
2afa : a5 10 __ LDA P3 ; (base + 1)
2afc : 69 08 __ ADC #$08
2afe : 85 10 __ STA P3 ; (base + 1)
2b00 : a9 ff __ LDA #$ff
2b02 : 85 1b __ STA ACCU + 0 
2b04 : 85 1c __ STA ACCU + 1 
2b06 : a9 0c __ LDA #$0c
2b08 : 85 4b __ STA T6 + 0 
2b0a : a9 6b __ LDA #$6b
2b0c : 85 4c __ STA T6 + 1 
2b0e : a9 3b __ LDA #$3b
2b10 : 85 4f __ STA T8 + 0 
.l19:
2b12 : a0 00 __ LDY #$00
2b14 : b1 4b __ LDA (T6 + 0),y 
2b16 : 85 4d __ STA T7 + 0 
2b18 : 18 __ __ CLC
2b19 : c8 __ __ INY
2b1a : b1 4b __ LDA (T6 + 0),y 
2b1c : 85 4e __ STA T7 + 1 
2b1e : 69 63 __ ADC #$63
2b20 : 85 50 __ STA T8 + 1 
2b22 : a4 4d __ LDY T7 + 0 
2b24 : b1 4f __ LDA (T8 + 0),y 
2b26 : 85 51 __ STA T11 + 0 
2b28 : 25 47 __ AND T3 + 0 
2b2a : d0 5c __ BNE $2b88 ; (write_cells.s20 + 0)
.s29:
2b2c : a5 51 __ LDA T11 + 0 
2b2e : a6 11 __ LDX P4 ; (bits + 0)
2b30 : e0 0c __ CPX #$0c
2b32 : f0 05 __ BEQ $2b39 ; (write_cells.s30 + 0)
.s36:
2b34 : 29 0c __ AND #$0c
2b36 : 4c 3d 2b JMP $2b3d ; (write_cells.s31 + 0)
.s30:
2b39 : 29 03 __ AND #$03
2b3b : 0a __ __ ASL
2b3c : 0a __ __ ASL
.s31:
2b3d : 91 4f __ STA (T8 + 0),y 
2b3f : f0 15 __ BEQ $2b56 ; (write_cells.s33 + 0)
.s32:
2b41 : 98 __ __ TYA
2b42 : a0 00 __ LDY #$00
2b44 : 91 48 __ STA (T4 + 0),y 
2b46 : a5 4e __ LDA T7 + 1 
2b48 : c8 __ __ INY
2b49 : 91 48 __ STA (T4 + 0),y 
2b4b : 18 __ __ CLC
2b4c : a5 48 __ LDA T4 + 0 
2b4e : 69 02 __ ADC #$02
2b50 : 85 48 __ STA T4 + 0 
2b52 : 90 02 __ BCC $2b56 ; (write_cells.s33 + 0)
.s59:
2b54 : e6 49 __ INC T4 + 1 
.s33:
2b56 : 18 __ __ CLC
2b57 : a5 4b __ LDA T6 + 0 
2b59 : 69 02 __ ADC #$02
2b5b : 85 4b __ STA T6 + 0 
2b5d : 90 02 __ BCC $2b61 ; (write_cells.s61 + 0)
.s60:
2b5f : e6 4c __ INC T6 + 1 
.s61:
2b61 : c5 45 __ CMP T2 + 0 
2b63 : d0 ad __ BNE $2b12 ; (write_cells.l19 + 0)
.s35:
2b65 : a5 4c __ LDA T6 + 1 
2b67 : c5 46 __ CMP T2 + 1 
2b69 : d0 a7 __ BNE $2b12 ; (write_cells.l19 + 0)
.s34:
2b6b : a9 00 __ LDA #$00
2b6d : 8d f8 3a STA $3af8 ; (front_count + 0)
2b70 : 8d f9 3a STA $3af9 ; (front_count + 1)
2b73 : a5 48 __ LDA T4 + 0 
2b75 : e9 0c __ SBC #$0c
2b77 : aa __ __ TAX
2b78 : a5 49 __ LDA T4 + 1 
2b7a : e9 6b __ SBC #$6b
2b7c : c9 80 __ CMP #$80
2b7e : 6a __ __ ROR
2b7f : 8d f7 3a STA $3af7 ; (dirty_count + 1)
2b82 : 8a __ __ TXA
2b83 : 6a __ __ ROR
2b84 : 8d f6 3a STA $3af6 ; (dirty_count + 0)
.s3:
2b87 : 60 __ __ RTS
.s20:
2b88 : a5 1c __ LDA ACCU + 1 
2b8a : c5 4e __ CMP T7 + 1 
2b8c : d0 04 __ BNE $2b92 ; (write_cells.s44 + 0)
.s43:
2b8e : a5 1b __ LDA ACCU + 0 
2b90 : c5 4d __ CMP T7 + 0 
.s44:
2b92 : b0 5c __ BCS $2bf0 ; (write_cells.s39 + 0)
.s21:
2b94 : 98 __ __ TYA
2b95 : 38 __ __ SEC
2b96 : e5 1b __ SBC ACCU + 0 
2b98 : aa __ __ TAX
2b99 : a5 4e __ LDA T7 + 1 
2b9b : e5 1c __ SBC ACCU + 1 
2b9d : d0 51 __ BNE $2bf0 ; (write_cells.s39 + 0)
.s42:
2b9f : e0 03 __ CPX #$03
2ba1 : b0 4d __ BCS $2bf0 ; (write_cells.s39 + 0)
.s55:
2ba3 : a9 6b __ LDA #$6b
2ba5 : 85 43 __ STA T1 + 0 
2ba7 : a4 1b __ LDY ACCU + 0 
2ba9 : 90 03 __ BCC $2bae ; (write_cells.l22 + 0)
.s25:
2bab : 8d 01 d6 STA $d601 
.l22:
2bae : a5 1c __ LDA ACCU + 1 
2bb0 : c5 4e __ CMP T7 + 1 
2bb2 : d0 02 __ BNE $2bb6 ; (write_cells.s38 + 0)
.s37:
2bb4 : c4 4d __ CPY T7 + 0 
.s38:
2bb6 : 90 26 __ BCC $2bde ; (write_cells.s23 + 0)
.s65:
2bb8 : a4 4d __ LDY T7 + 0 
.s26:
2bba : a9 6b __ LDA #$6b
2bbc : 85 1b __ STA ACCU + 0 
2bbe : 18 __ __ CLC
2bbf : a9 5b __ LDA #$5b
2bc1 : 65 4e __ ADC T7 + 1 
2bc3 : 85 1c __ STA ACCU + 1 
2bc5 : b1 1b __ LDA (ACCU + 0),y 
.l27:
2bc7 : 2c 00 d6 BIT $d600 
2bca : 10 fb __ BPL $2bc7 ; (write_cells.l27 + 0)
.s28:
2bcc : 8d 01 d6 STA $d601 
2bcf : 98 __ __ TYA
2bd0 : 18 __ __ CLC
2bd1 : 69 01 __ ADC #$01
2bd3 : 85 1b __ STA ACCU + 0 
2bd5 : a5 4e __ LDA T7 + 1 
2bd7 : 69 00 __ ADC #$00
2bd9 : 85 1c __ STA ACCU + 1 
2bdb : 4c 2c 2b JMP $2b2c ; (write_cells.s29 + 0)
.s23:
2bde : 69 5b __ ADC #$5b
2be0 : 85 44 __ STA T1 + 1 
2be2 : b1 43 __ LDA (T1 + 0),y 
2be4 : c8 __ __ INY
2be5 : d0 02 __ BNE $2be9 ; (write_cells.l24 + 0)
.s62:
2be7 : e6 1c __ INC ACCU + 1 
.l24:
2be9 : 2c 00 d6 BIT $d600 
2bec : 10 fb __ BPL $2be9 ; (write_cells.l24 + 0)
2bee : 30 bb __ BMI $2bab ; (write_cells.s25 + 0)
.s39:
2bf0 : a5 4e __ LDA T7 + 1 
2bf2 : c5 1c __ CMP ACCU + 1 
2bf4 : d0 04 __ BNE $2bfa ; (write_cells.s40 + 0)
.s41:
2bf6 : c4 1b __ CPY ACCU + 0 
2bf8 : f0 c0 __ BEQ $2bba ; (write_cells.s26 + 0)
.s40:
2bfa : 98 __ __ TYA
2bfb : 18 __ __ CLC
2bfc : 65 0f __ ADC P2 ; (base + 0)
2bfe : a8 __ __ TAY
2bff : a5 10 __ LDA P3 ; (base + 1)
2c01 : 65 4e __ ADC T7 + 1 
2c03 : aa __ __ TAX
2c04 : 98 __ __ TYA
2c05 : 20 de 20 JSR $20de ; (vdc_mem_addr.s4 + 0)
2c08 : 4c b8 2b JMP $2bb8 ; (write_cells.s65 + 0)
.s7:
2c0b : a5 1c __ LDA ACCU + 1 
2c0d : c5 4e __ CMP T7 + 1 
2c0f : d0 04 __ BNE $2c15 ; (write_cells.s54 + 0)
.s53:
2c11 : a5 1b __ LDA ACCU + 0 
2c13 : c5 4d __ CMP T7 + 0 
.s54:
2c15 : b0 5c __ BCS $2c73 ; (write_cells.s49 + 0)
.s8:
2c17 : 98 __ __ TYA
2c18 : 38 __ __ SEC
2c19 : e5 1b __ SBC ACCU + 0 
2c1b : aa __ __ TAX
2c1c : a5 4e __ LDA T7 + 1 
2c1e : e5 1c __ SBC ACCU + 1 
2c20 : d0 51 __ BNE $2c73 ; (write_cells.s49 + 0)
.s52:
2c22 : e0 03 __ CPX #$03
2c24 : b0 4d __ BCS $2c73 ; (write_cells.s49 + 0)
.s56:
2c26 : a9 9b __ LDA #$9b
2c28 : 85 43 __ STA T1 + 0 
2c2a : a4 1b __ LDY ACCU + 0 
2c2c : 90 03 __ BCC $2c31 ; (write_cells.l9 + 0)
.s12:
2c2e : 8d 01 d6 STA $d601 
.l9:
2c31 : a5 1c __ LDA ACCU + 1 
2c33 : c5 4e __ CMP T7 + 1 
2c35 : d0 02 __ BNE $2c39 ; (write_cells.s48 + 0)
.s47:
2c37 : c4 4d __ CPY T7 + 0 
.s48:
2c39 : 90 26 __ BCC $2c61 ; (write_cells.s10 + 0)
.s64:
2c3b : a4 4d __ LDY T7 + 0 
.s13:
2c3d : a9 9b __ LDA #$9b
2c3f : 85 1b __ STA ACCU + 0 
2c41 : 18 __ __ CLC
2c42 : a9 53 __ LDA #$53
2c44 : 65 4e __ ADC T7 + 1 
2c46 : 85 1c __ STA ACCU + 1 
2c48 : b1 1b __ LDA (ACCU + 0),y 
.l14:
2c4a : 2c 00 d6 BIT $d600 
2c4d : 10 fb __ BPL $2c4a ; (write_cells.l14 + 0)
.s15:
2c4f : 8d 01 d6 STA $d601 
2c52 : 98 __ __ TYA
2c53 : 18 __ __ CLC
2c54 : 69 01 __ ADC #$01
2c56 : 85 1b __ STA ACCU + 0 
2c58 : a5 4e __ LDA T7 + 1 
2c5a : 69 00 __ ADC #$00
2c5c : 85 1c __ STA ACCU + 1 
2c5e : 4c d2 2a JMP $2ad2 ; (write_cells.s16 + 0)
.s10:
2c61 : 69 53 __ ADC #$53
2c63 : 85 44 __ STA T1 + 1 
2c65 : b1 43 __ LDA (T1 + 0),y 
2c67 : c8 __ __ INY
2c68 : d0 02 __ BNE $2c6c ; (write_cells.l11 + 0)
.s63:
2c6a : e6 1c __ INC ACCU + 1 
.l11:
2c6c : 2c 00 d6 BIT $d600 
2c6f : 10 fb __ BPL $2c6c ; (write_cells.l11 + 0)
2c71 : 30 bb __ BMI $2c2e ; (write_cells.s12 + 0)
.s49:
2c73 : a5 4e __ LDA T7 + 1 
2c75 : c5 1c __ CMP ACCU + 1 
2c77 : d0 04 __ BNE $2c7d ; (write_cells.s50 + 0)
.s51:
2c79 : c4 1b __ CPY ACCU + 0 
2c7b : f0 c0 __ BEQ $2c3d ; (write_cells.s13 + 0)
.s50:
2c7d : 98 __ __ TYA
2c7e : 18 __ __ CLC
2c7f : 65 0f __ ADC P2 ; (base + 0)
2c81 : a8 __ __ TAY
2c82 : a5 10 __ LDA P3 ; (base + 1)
2c84 : 65 4e __ ADC T7 + 1 
2c86 : aa __ __ TAX
2c87 : 98 __ __ TYA
2c88 : 20 de 20 JSR $20de ; (vdc_mem_addr.s4 + 0)
2c8b : 4c 3b 2c JMP $2c3b ; (write_cells.s64 + 0)
--------------------------------------------------------------------
load_pose: ; load_pose()->void
; 314, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2c8e : ad fe 3a LDA $3afe ; (bird_pose + 0)
2c91 : ac fc 3b LDY $3bfc ; (bird_set + 0)
2c94 : d9 7c 3a CMP $3a7c,y ; (set_pose[0] + 0)
2c97 : f0 72 __ BEQ $2d0b ; (load_pose.s3 + 0)
.s5:
2c99 : 99 7c 3a STA $3a7c,y ; (set_pose[0] + 0)
2c9c : 85 1b __ STA ACCU + 0 
2c9e : a9 00 __ LDA #$00
2ca0 : 85 1c __ STA ACCU + 1 
2ca2 : 38 __ __ SEC
2ca3 : ed fc 3b SBC $3bfc ; (bird_set + 0)
2ca6 : 29 f0 __ AND #$f0
2ca8 : 85 43 __ STA T0 + 0 
2caa : a9 f0 __ LDA #$f0
2cac : 20 7d 39 JSR $397d ; (mul16by8 + 0)
2caf : 18 __ __ CLC
2cb0 : a5 1c __ LDA ACCU + 1 
2cb2 : 69 90 __ ADC #$90
2cb4 : 85 1c __ STA ACCU + 1 
2cb6 : a0 26 __ LDY #$26
2cb8 : a2 04 __ LDX #$04
.l6:
2cba : a9 12 __ LDA #$12
2cbc : 8d 00 d6 STA $d600 
.l7:
2cbf : 2c 00 d6 BIT $d600 
2cc2 : 10 fb __ BPL $2cbf ; (load_pose.l7 + 0)
.s8:
2cc4 : 8c 01 d6 STY $d601 
2cc7 : a9 13 __ LDA #$13
2cc9 : 8d 00 d6 STA $d600 
.l9:
2ccc : 2c 00 d6 BIT $d600 
2ccf : 10 fb __ BPL $2ccc ; (load_pose.l9 + 0)
.s10:
2cd1 : a5 43 __ LDA T0 + 0 
2cd3 : 8d 01 d6 STA $d601 
2cd6 : a9 20 __ LDA #$20
2cd8 : 8d 00 d6 STA $d600 
.l11:
2cdb : 2c 00 d6 BIT $d600 
2cde : 10 fb __ BPL $2cdb ; (load_pose.l11 + 0)
.s12:
2ce0 : a5 1c __ LDA ACCU + 1 
2ce2 : 8d 01 d6 STA $d601 
2ce5 : a9 21 __ LDA #$21
2ce7 : 8d 00 d6 STA $d600 
.l13:
2cea : 2c 00 d6 BIT $d600 
2ced : 10 fb __ BPL $2cea ; (load_pose.l13 + 0)
.s14:
2cef : a5 1b __ LDA ACCU + 0 
2cf1 : 8d 01 d6 STA $d601 
2cf4 : a9 1e __ LDA #$1e
2cf6 : 8d 00 d6 STA $d600 
.l15:
2cf9 : 2c 00 d6 BIT $d600 
2cfc : 10 fb __ BPL $2cf9 ; (load_pose.l15 + 0)
.s16:
2cfe : a9 f0 __ LDA #$f0
2d00 : 8d 01 d6 STA $d601 
2d03 : 98 __ __ TYA
2d04 : 18 __ __ CLC
2d05 : 69 20 __ ADC #$20
2d07 : a8 __ __ TAY
2d08 : ca __ __ DEX
2d09 : d0 af __ BNE $2cba ; (load_pose.l6 + 0)
.s3:
2d0b : 60 __ __ RTS
--------------------------------------------------------------------
keys: ; keys()->u8
; 112, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2d0c : a9 7f __ LDA #$7f
2d0e : 8d 00 dc STA $dc00 
2d11 : ad 01 dc LDA $dc01 
2d14 : aa __ __ TAX
2d15 : 29 10 __ AND #$10
2d17 : f0 04 __ BEQ $2d1d ; (keys.s11 + 0)
.s12:
2d19 : a0 00 __ LDY #$00
2d1b : f0 02 __ BEQ $2d1f ; (keys.s13 + 0)
.s11:
2d1d : a0 01 __ LDY #$01
.s13:
2d1f : a9 df __ LDA #$df
2d21 : 8d 00 dc STA $dc00 
2d24 : 8a __ __ TXA
2d25 : 0a __ __ ASL
2d26 : 30 04 __ BMI $2d2c ; (keys.s5 + 0)
.s10:
2d28 : 98 __ __ TYA
2d29 : 09 10 __ ORA #$10
2d2b : a8 __ __ TAY
.s5:
2d2c : ad 01 dc LDA $dc01 
2d2f : 29 02 __ AND #$02
2d31 : a2 ff __ LDX #$ff
2d33 : 8e 00 dc STX $dc00 
2d36 : aa __ __ TAX
2d37 : d0 02 __ BNE $2d3b ; (keys.s6 + 0)
.s9:
2d39 : c8 __ __ INY
2d3a : c8 __ __ INY
.s6:
2d3b : ad 00 dc LDA $dc00 
2d3e : 29 10 __ AND #$10
2d40 : d0 04 __ BNE $2d46 ; (keys.s7 + 0)
.s8:
2d42 : 98 __ __ TYA
2d43 : 09 01 __ ORA #$01
2d45 : 60 __ __ RTS
.s7:
2d46 : 98 __ __ TYA
.s3:
2d47 : 60 __ __ RTS
--------------------------------------------------------------------
prepare_frame: ; prepare_frame(u8)->void
; 477, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
2d48 : a2 10 __ LDX #$10
2d4a : b5 53 __ LDA T0 + 0,x 
2d4c : 9d d6 bf STA $bfd6,x ; (prepare_frame@stack + 0)
2d4f : ca __ __ DEX
2d50 : 10 f8 __ BPL $2d4a ; (prepare_frame.s1 + 2)
.s4:
2d52 : ad b9 7a LDA $7ab9 ; (previous_keys + 0)
2d55 : 49 ff __ EOR #$ff
2d57 : 25 14 __ AND P7 ; (held + 0)
2d59 : 85 53 __ STA T0 + 0 
2d5b : a9 00 __ LDA #$00
2d5d : 8d ba 7a STA $7aba ; (stepped + 0)
2d60 : a5 14 __ LDA P7 ; (held + 0)
2d62 : 8d b9 7a STA $7ab9 ; (previous_keys + 0)
2d65 : ad ee 3a LDA $3aee ; (state + 0)
2d68 : c9 02 __ CMP #$02
2d6a : d0 03 __ BNE $2d6f ; (prepare_frame.s10 + 0)
2d6c : 4c 45 32 JMP $3245 ; (prepare_frame.s5 + 0)
.s10:
2d6f : c9 04 __ CMP #$04
2d71 : d0 03 __ BNE $2d76 ; (prepare_frame.s19 + 0)
2d73 : 4c f0 31 JMP $31f0 ; (prepare_frame.s11 + 0)
.s19:
2d76 : aa __ __ TAX
2d77 : d0 2f __ BNE $2da8 ; (prepare_frame.s20 + 0)
.s109:
2d79 : ee 6f 3a INC $3a6f ; (random_state + 0)
2d7c : d0 03 __ BNE $2d81 ; (prepare_frame.s117 + 0)
.s116:
2d7e : ee 70 3a INC $3a70 ; (random_state + 1)
.s117:
2d81 : a5 53 __ LDA T0 + 0 
2d83 : 29 01 __ AND #$01
2d85 : f0 16 __ BEQ $2d9d ; (prepare_frame.s3 + 0)
.s110:
2d87 : 8d ee 3a STA $3aee ; (state + 0)
2d8a : 20 4d 25 JSR $254d ; (field.s4 + 0)
2d8d : a9 de __ LDA #$de
2d8f : 8d f1 3a STA $3af1 ; (velocity + 0)
2d92 : a9 ff __ LDA #$ff
2d94 : 8d f2 3a STA $3af2 ; (velocity + 1)
2d97 : 20 34 24 JSR $2434 ; (bird_draw.s4 + 0)
.s9:
2d9a : 20 69 32 JSR $3269 ; (sound_flap.s4 + 0)
.s3:
2d9d : a2 10 __ LDX #$10
2d9f : bd d6 bf LDA $bfd6,x ; (prepare_frame@stack + 0)
2da2 : 95 53 __ STA T0 + 0,x 
2da4 : ca __ __ DEX
2da5 : 10 f8 __ BPL $2d9f ; (prepare_frame.s3 + 2)
2da7 : 60 __ __ RTS
.s20:
2da8 : a5 53 __ LDA T0 + 0 
2daa : 29 02 __ AND #$02
2dac : f0 03 __ BEQ $2db1 ; (prepare_frame.s24 + 0)
2dae : 4c d2 31 JMP $31d2 ; (prepare_frame.s21 + 0)
.s24:
2db1 : ad ee 3a LDA $3aee ; (state + 0)
2db4 : c9 03 __ CMP #$03
2db6 : f0 e5 __ BEQ $2d9d ; (prepare_frame.s3 + 0)
.s25:
2db8 : 46 53 __ LSR T0 + 0 
2dba : 90 0d __ BCC $2dc9 ; (prepare_frame.s27 + 0)
.s26:
2dbc : a9 de __ LDA #$de
2dbe : 8d f1 3a STA $3af1 ; (velocity + 0)
2dc1 : a9 ff __ LDA #$ff
2dc3 : 8d f2 3a STA $3af2 ; (velocity + 1)
2dc6 : 20 69 32 JSR $3269 ; (sound_flap.s4 + 0)
.s27:
2dc9 : ad f1 3a LDA $3af1 ; (velocity + 0)
2dcc : a8 __ __ TAY
2dcd : 18 __ __ CLC
2dce : 69 02 __ ADC #$02
2dd0 : 8d f1 3a STA $3af1 ; (velocity + 0)
2dd3 : ad f2 3a LDA $3af2 ; (velocity + 1)
2dd6 : aa __ __ TAX
2dd7 : 69 00 __ ADC #$00
2dd9 : 8d f2 3a STA $3af2 ; (velocity + 1)
2ddc : 8a __ __ TXA
2ddd : 30 10 __ BMI $2def ; (prepare_frame.s29 + 0)
.s108:
2ddf : d0 04 __ BNE $2de5 ; (prepare_frame.s28 + 0)
.s107:
2de1 : c0 2f __ CPY #$2f
2de3 : 90 0a __ BCC $2def ; (prepare_frame.s29 + 0)
.s28:
2de5 : a9 30 __ LDA #$30
2de7 : 8d f1 3a STA $3af1 ; (velocity + 0)
2dea : a9 00 __ LDA #$00
2dec : 8d f2 3a STA $3af2 ; (velocity + 1)
.s29:
2def : ad f3 3a LDA $3af3 ; (bird_y + 0)
2df2 : 18 __ __ CLC
2df3 : 6d f1 3a ADC $3af1 ; (velocity + 0)
2df6 : 8d f3 3a STA $3af3 ; (bird_y + 0)
2df9 : ad f4 3a LDA $3af4 ; (bird_y + 1)
2dfc : 6d f2 3a ADC $3af2 ; (velocity + 1)
2dff : 8d f4 3a STA $3af4 ; (bird_y + 1)
2e02 : 10 10 __ BPL $2e14 ; (prepare_frame.s103 + 0)
.s30:
2e04 : a9 00 __ LDA #$00
2e06 : 8d f1 3a STA $3af1 ; (velocity + 0)
2e09 : 8d f2 3a STA $3af2 ; (velocity + 1)
2e0c : 8d f3 3a STA $3af3 ; (bird_y + 0)
2e0f : 8d f4 3a STA $3af4 ; (bird_y + 1)
2e12 : f0 25 __ BEQ $2e39 ; (prepare_frame.l31 + 0)
.s103:
2e14 : a9 09 __ LDA #$09
2e16 : cd f4 3a CMP $3af4 ; (bird_y + 1)
2e19 : f0 04 __ BEQ $2e1f ; (prepare_frame.s105 + 0)
.s106:
2e1b : 90 09 __ BCC $2e26 ; (prepare_frame.s104 + 0)
2e1d : b0 1a __ BCS $2e39 ; (prepare_frame.l31 + 0)
.s105:
2e1f : ad f3 3a LDA $3af3 ; (bird_y + 0)
2e22 : c9 c1 __ CMP #$c1
2e24 : 90 13 __ BCC $2e39 ; (prepare_frame.l31 + 0)
.s104:
2e26 : a9 c0 __ LDA #$c0
2e28 : 8d f3 3a STA $3af3 ; (bird_y + 0)
2e2b : a9 09 __ LDA #$09
2e2d : 8d f4 3a STA $3af4 ; (bird_y + 1)
2e30 : 20 34 24 JSR $2434 ; (bird_draw.s4 + 0)
2e33 : 20 88 32 JSR $3288 ; (crash.s4 + 0)
2e36 : 4c cc 31 JMP $31cc ; (prepare_frame.s112 + 0)
.l31:
2e39 : ad ce 7a LDA $7ace ; (prerendered + 0)
2e3c : c9 04 __ CMP #$04
2e3e : b0 0e __ BCS $2e4e ; (prepare_frame.s33 + 0)
.s32:
2e40 : 85 10 __ STA P3 
2e42 : aa __ __ TAX
2e43 : e8 __ __ INX
2e44 : 8e ce 7a STX $7ace ; (prerendered + 0)
2e47 : 20 20 34 JSR $3420 ; (prerender.s1 + 0)
2e4a : a5 1b __ LDA ACCU + 0 
2e4c : f0 eb __ BEQ $2e39 ; (prepare_frame.l31 + 0)
.s33:
2e4e : ad f5 3a LDA $3af5 ; (phase + 0)
2e51 : c9 03 __ CMP #$03
2e53 : d0 1e __ BNE $2e73 ; (prepare_frame.s118 + 0)
.s34:
2e55 : cd ce 7a CMP $7ace ; (prerendered + 0)
2e58 : 90 17 __ BCC $2e71 ; (prepare_frame.s36 + 0)
.l35:
2e5a : ad ce 7a LDA $7ace ; (prerendered + 0)
2e5d : 85 53 __ STA T0 + 0 
2e5f : 85 10 __ STA P3 
2e61 : e6 53 __ INC T0 + 0 
2e63 : a5 53 __ LDA T0 + 0 
2e65 : 8d ce 7a STA $7ace ; (prerendered + 0)
2e68 : 20 20 34 JSR $3420 ; (prerender.s1 + 0)
2e6b : a5 53 __ LDA T0 + 0 
2e6d : c9 04 __ CMP #$04
2e6f : 90 e9 __ BCC $2e5a ; (prepare_frame.l35 + 0)
.s36:
2e71 : a9 03 __ LDA #$03
.s118:
2e73 : 18 __ __ CLC
2e74 : 69 01 __ ADC #$01
2e76 : 8d f5 3a STA $3af5 ; (phase + 0)
2e79 : c9 04 __ CMP #$04
2e7b : d0 6f __ BNE $2eec ; (prepare_frame.s41 + 0)
.s37:
2e7d : a9 00 __ LDA #$00
2e7f : 8d ce 7a STA $7ace ; (prerendered + 0)
2e82 : 8d f5 3a STA $3af5 ; (phase + 0)
2e85 : 85 5f __ STA T6 + 0 
2e87 : a2 01 __ LDX #$01
2e89 : 8e ba 7a STX $7aba ; (stepped + 0)
.l38:
2e8c : 0a __ __ ASL
2e8d : 0a __ __ ASL
2e8e : 85 57 __ STA T2 + 0 
2e90 : a8 __ __ TAY
2e91 : b9 8b 53 LDA $538b,y ; (pipes[0].x + 0)
2e94 : aa __ __ TAX
2e95 : 18 __ __ CLC
2e96 : 69 ff __ ADC #$ff
2e98 : 99 8b 53 STA $538b,y ; (pipes[0].x + 0)
2e9b : b9 8c 53 LDA $538c,y ; (pipes[0].x + 1)
2e9e : 85 54 __ STA T0 + 1 
2ea0 : 69 ff __ ADC #$ff
2ea2 : 99 8c 53 STA $538c,y ; (pipes[0].x + 1)
2ea5 : a5 54 __ LDA T0 + 1 
2ea7 : 49 80 __ EOR #$80
2ea9 : c9 7f __ CMP #$7f
2eab : d0 02 __ BNE $2eaf ; (prepare_frame.s102 + 0)
.s101:
2ead : e0 f9 __ CPX #$f9
.s102:
2eaf : 8a __ __ TXA
2eb0 : b0 1b __ BCS $2ecd ; (prepare_frame.s67 + 0)
.s39:
2eb2 : 69 73 __ ADC #$73
2eb4 : 99 8b 53 STA $538b,y ; (pipes[0].x + 0)
2eb7 : a5 54 __ LDA T0 + 1 
2eb9 : 69 00 __ ADC #$00
2ebb : 99 8c 53 STA $538c,y ; (pipes[0].x + 1)
2ebe : 20 20 25 JSR $2520 ; (gap_next.s4 + 0)
2ec1 : a6 57 __ LDX T2 + 0 
2ec3 : 9d 8d 53 STA $538d,x ; (pipes[0].gap + 0)
2ec6 : a9 00 __ LDA #$00
2ec8 : 9d 8e 53 STA $538e,x ; (pipes[0].passed + 0)
2ecb : f0 17 __ BEQ $2ee4 ; (prepare_frame.s40 + 0)
.s67:
2ecd : e9 02 __ SBC #$02
2ecf : 85 55 __ STA T1 + 0 
2ed1 : a5 54 __ LDA T0 + 1 
2ed3 : e9 00 __ SBC #$00
2ed5 : 85 56 __ STA T1 + 1 
2ed7 : 10 03 __ BPL $2edc ; (prepare_frame.s100 + 0)
2ed9 : 4c f6 2f JMP $2ff6 ; (prepare_frame.s68 + 0)
.s100:
2edc : d0 06 __ BNE $2ee4 ; (prepare_frame.s40 + 0)
.s99:
2ede : a5 55 __ LDA T1 + 0 
2ee0 : c9 50 __ CMP #$50
2ee2 : 90 f5 __ BCC $2ed9 ; (prepare_frame.s67 + 12)
.s40:
2ee4 : e6 5f __ INC T6 + 0 
2ee6 : a5 5f __ LDA T6 + 0 
2ee8 : c9 04 __ CMP #$04
2eea : d0 a0 __ BNE $2e8c ; (prepare_frame.l38 + 0)
.s41:
2eec : a9 00 __ LDA #$00
2eee : 85 5b __ STA T4 + 0 
.l42:
2ef0 : 0a __ __ ASL
2ef1 : 0a __ __ ASL
2ef2 : 85 57 __ STA T2 + 0 
2ef4 : a8 __ __ TAY
2ef5 : b9 8b 53 LDA $538b,y ; (pipes[0].x + 0)
2ef8 : 0a __ __ ASL
2ef9 : 85 53 __ STA T0 + 0 
2efb : b9 8c 53 LDA $538c,y ; (pipes[0].x + 1)
2efe : 2a __ __ ROL
2eff : 06 53 __ ASL T0 + 0 
2f01 : 2a __ __ ROL
2f02 : 06 53 __ ASL T0 + 0 
2f04 : 2a __ __ ROL
2f05 : aa __ __ TAX
2f06 : ad f5 3a LDA $3af5 ; (phase + 0)
2f09 : 0a __ __ ASL
2f0a : 85 55 __ STA T1 + 0 
2f0c : a9 00 __ LDA #$00
2f0e : 2a __ __ ROL
2f0f : 85 56 __ STA T1 + 1 
2f11 : 38 __ __ SEC
2f12 : a5 53 __ LDA T0 + 0 
2f14 : e5 55 __ SBC T1 + 0 
2f16 : 85 55 __ STA T1 + 0 
2f18 : 8a __ __ TXA
2f19 : e5 56 __ SBC T1 + 1 
2f1b : 85 56 __ STA T1 + 1 
2f1d : b9 8e 53 LDA $538e,y ; (pipes[0].passed + 0)
2f20 : d0 0f __ BNE $2f31 ; (prepare_frame.s119 + 0)
.s59:
2f22 : a5 56 __ LDA T1 + 1 
2f24 : 30 10 __ BMI $2f36 ; (prepare_frame.s60 + 0)
.s66:
2f26 : f0 03 __ BEQ $2f2b ; (prepare_frame.s65 + 0)
2f28 : 4c e8 2f JMP $2fe8 ; (prepare_frame.s43 + 0)
.s65:
2f2b : a5 55 __ LDA T1 + 0 
2f2d : c9 b1 __ CMP #$b1
2f2f : 90 05 __ BCC $2f36 ; (prepare_frame.s60 + 0)
.s119:
2f31 : a5 56 __ LDA T1 + 1 
2f33 : 4c e8 2f JMP $2fe8 ; (prepare_frame.s43 + 0)
.s60:
2f36 : a9 01 __ LDA #$01
2f38 : 99 8e 53 STA $538e,y ; (pipes[0].passed + 0)
2f3b : a9 04 __ LDA #$04
2f3d : 85 11 __ STA P4 
2f3f : ad f0 3a LDA $3af0 ; (score + 1)
2f42 : c9 27 __ CMP #$27
2f44 : d0 05 __ BNE $2f4b ; (prepare_frame.s64 + 0)
.s63:
2f46 : ad ef 3a LDA $3aef ; (score + 0)
2f49 : c9 0f __ CMP #$0f
.s64:
2f4b : b0 08 __ BCS $2f55 ; (prepare_frame.s62 + 0)
.s61:
2f4d : ee ef 3a INC $3aef ; (score + 0)
2f50 : d0 03 __ BNE $2f55 ; (prepare_frame.s62 + 0)
.s113:
2f52 : ee f0 3a INC $3af0 ; (score + 1)
.s62:
2f55 : 20 27 27 JSR $2727 ; (number@proxy + 0)
2f58 : a9 00 __ LDA #$00
2f5a : 85 0e __ STA P1 
2f5c : 85 10 __ STA P3 
2f5e : 85 11 __ STA P4 
2f60 : a9 01 __ LDA #$01
2f62 : 85 0d __ STA P0 
2f64 : a9 38 __ LDA #$38
2f66 : 85 0f __ STA P2 
2f68 : a9 10 __ LDA #$10
2f6a : 85 13 __ STA P6 
2f6c : a9 07 __ LDA #$07
2f6e : 85 12 __ STA P5 
2f70 : 20 be 32 JSR $32be ; (start.s4 + 0)
2f73 : a9 00 __ LDA #$00
2f75 : 8d d1 7a STA $7ad1 ; (jump_freq[0] + 2)
2f78 : a9 4b __ LDA #$4b
2f7a : 8d d2 7a STA $7ad2 ; (jump_freq[0] + 3)
2f7d : a9 04 __ LDA #$04
2f7f : 8d cc 7a STA $7acc ; (jump_at[0] + 1)
.s44:
2f82 : a5 56 __ LDA T1 + 1 
2f84 : 30 51 __ BMI $2fd7 ; (prepare_frame.s48 + 0)
.s56:
2f86 : d0 06 __ BNE $2f8e ; (prepare_frame.s45 + 0)
.s55:
2f88 : a5 55 __ LDA T1 + 0 
2f8a : c9 b1 __ CMP #$b1
2f8c : 90 49 __ BCC $2fd7 ; (prepare_frame.s48 + 0)
.s45:
2f8e : a6 57 __ LDX T2 + 0 
2f90 : bd 8d 53 LDA $538d,x ; (pipes[0].gap + 0)
2f93 : 4a __ __ LSR
2f94 : 85 54 __ STA T0 + 1 
2f96 : a9 00 __ LDA #$00
2f98 : 6a __ __ ROR
2f99 : 85 53 __ STA T0 + 0 
2f9b : ad f4 3a LDA $3af4 ; (bird_y + 1)
2f9e : 30 2e __ BMI $2fce ; (prepare_frame.s46 + 0)
.s54:
2fa0 : c5 54 __ CMP T0 + 1 
2fa2 : d0 05 __ BNE $2fa9 ; (prepare_frame.s53 + 0)
.s52:
2fa4 : ad f3 3a LDA $3af3 ; (bird_y + 0)
2fa7 : c5 53 __ CMP T0 + 0 
.s53:
2fa9 : 90 23 __ BCC $2fce ; (prepare_frame.s46 + 0)
.s47:
2fab : a5 53 __ LDA T0 + 0 
2fad : 69 7f __ ADC #$7f
2faf : aa __ __ TAX
2fb0 : a5 54 __ LDA T0 + 1 
2fb2 : 69 03 __ ADC #$03
2fb4 : a8 __ __ TAY
2fb5 : ad f3 3a LDA $3af3 ; (bird_y + 0)
2fb8 : 18 __ __ CLC
2fb9 : 69 c0 __ ADC #$c0
2fbb : 85 55 __ STA T1 + 0 
2fbd : ad f4 3a LDA $3af4 ; (bird_y + 1)
2fc0 : 69 00 __ ADC #$00
2fc2 : 30 13 __ BMI $2fd7 ; (prepare_frame.s48 + 0)
.s51:
2fc4 : 85 56 __ STA T1 + 1 
2fc6 : c4 56 __ CPY T1 + 1 
2fc8 : d0 02 __ BNE $2fcc ; (prepare_frame.s50 + 0)
.s49:
2fca : e4 55 __ CPX T1 + 0 
.s50:
2fcc : b0 09 __ BCS $2fd7 ; (prepare_frame.s48 + 0)
.s46:
2fce : 20 34 24 JSR $2434 ; (bird_draw.s4 + 0)
2fd1 : 20 88 32 JSR $3288 ; (crash.s4 + 0)
2fd4 : 4c 9d 2d JMP $2d9d ; (prepare_frame.s3 + 0)
.s48:
2fd7 : e6 5b __ INC T4 + 0 
2fd9 : a5 5b __ LDA T4 + 0 
2fdb : c9 04 __ CMP #$04
2fdd : b0 03 __ BCS $2fe2 ; (prepare_frame.s111 + 0)
2fdf : 4c f0 2e JMP $2ef0 ; (prepare_frame.l42 + 0)
.s111:
2fe2 : 20 34 24 JSR $2434 ; (bird_draw.s4 + 0)
2fe5 : 4c 9d 2d JMP $2d9d ; (prepare_frame.s3 + 0)
.s43:
2fe8 : 49 80 __ EOR #$80
2fea : c9 81 __ CMP #$81
2fec : d0 04 __ BNE $2ff2 ; (prepare_frame.s58 + 0)
.s57:
2fee : a5 55 __ LDA T1 + 0 
2ff0 : c9 18 __ CMP #$18
.s58:
2ff2 : b0 e3 __ BCS $2fd7 ; (prepare_frame.s48 + 0)
2ff4 : 90 8c __ BCC $2f82 ; (prepare_frame.s44 + 0)
.s68:
2ff6 : b9 8d 53 LDA $538d,y ; (pipes[0].gap + 0)
2ff9 : 85 63 __ STA T11 + 0 
2ffb : 8a __ __ TXA
2ffc : 18 __ __ CLC
2ffd : 69 08 __ ADC #$08
2fff : a8 __ __ TAY
3000 : a5 54 __ LDA T0 + 1 
3002 : 69 00 __ ADC #$00
3004 : 24 55 __ BIT T1 + 0 
3006 : 30 03 __ BMI $300b ; (prepare_frame.s97 + 0)
3008 : 4c 00 31 JMP $3100 ; (prepare_frame.s69 + 0)
.s97:
300b : aa __ __ TAX
300c : a9 00 __ LDA #$00
300e : 85 59 __ STA T3 + 0 
3010 : 85 5a __ STA T3 + 1 
3012 : 38 __ __ SEC
3013 : e5 55 __ SBC T1 + 0 
3015 : 85 5b __ STA T4 + 0 
3017 : 8a __ __ TXA
3018 : d0 05 __ BNE $301f ; (prepare_frame.s82 + 0)
.s98:
301a : 98 __ __ TYA
301b : c0 51 __ CPY #$51
301d : 90 02 __ BCC $3021 ; (prepare_frame.s83 + 0)
.s82:
301f : a9 50 __ LDA #$50
.s83:
3021 : 38 __ __ SEC
3022 : e5 59 __ SBC T3 + 0 
3024 : 85 55 __ STA T1 + 0 
3026 : 18 __ __ CLC
3027 : a5 63 __ LDA T11 + 0 
3029 : 69 07 __ ADC #$07
302b : 85 57 __ STA T2 + 0 
302d : a9 00 __ LDA #$00
302f : 2a __ __ ROL
3030 : 85 58 __ STA T2 + 1 
3032 : 38 __ __ SEC
3033 : a5 57 __ LDA T2 + 0 
3035 : e9 08 __ SBC #$08
3037 : 85 5d __ STA T5 + 0 
3039 : a5 58 __ LDA T2 + 1 
303b : e9 00 __ SBC #$00
303d : 85 5e __ STA T5 + 1 
303f : a9 00 __ LDA #$00
3041 : 85 60 __ STA T7 + 0 
.l84:
3043 : 0a __ __ ASL
3044 : aa __ __ TAX
3045 : bd 59 53 LDA $5359,x ; (row_addr[0] + 0)
3048 : 18 __ __ CLC
3049 : 65 59 __ ADC T3 + 0 
304b : 85 61 __ STA T8 + 0 
304d : bd 5a 53 LDA $535a,x ; (row_addr[0] + 1)
3050 : 65 5a __ ADC T3 + 1 
3052 : 85 62 __ STA T8 + 1 
3054 : a5 60 __ LDA T7 + 0 
3056 : c5 63 __ CMP T11 + 0 
3058 : 90 0d __ BCC $3067 ; (prepare_frame.s87 + 0)
.s85:
305a : a5 58 __ LDA T2 + 1 
305c : f0 03 __ BEQ $3061 ; (prepare_frame.s95 + 0)
305e : 4c f2 30 JMP $30f2 ; (prepare_frame.s86 + 0)
.s95:
3061 : a5 60 __ LDA T7 + 0 
3063 : c5 57 __ CMP T2 + 0 
3065 : 90 f7 __ BCC $305e ; (prepare_frame.s85 + 4)
.s87:
3067 : a5 5e __ LDA T5 + 1 
3069 : d0 06 __ BNE $3071 ; (prepare_frame.s91 + 0)
.s94:
306b : a5 60 __ LDA T7 + 0 
306d : c5 5d __ CMP T5 + 0 
306f : f0 2a __ BEQ $309b ; (prepare_frame.s88 + 0)
.s91:
3071 : a5 58 __ LDA T2 + 1 
3073 : d0 06 __ BNE $307b ; (prepare_frame.s92 + 0)
.s93:
3075 : a5 60 __ LDA T7 + 0 
3077 : c5 57 __ CMP T2 + 0 
3079 : f0 20 __ BEQ $309b ; (prepare_frame.s88 + 0)
.s92:
307b : 18 __ __ CLC
307c : a9 9b __ LDA #$9b
307e : 65 61 __ ADC T8 + 0 
3080 : 85 0d __ STA P0 
3082 : a9 53 __ LDA #$53
3084 : 65 62 __ ADC T8 + 1 
3086 : 85 0e __ STA P1 
3088 : 18 __ __ CLC
3089 : a9 9f __ LDA #$9f
308b : 65 5b __ ADC T4 + 0 
308d : 85 0f __ STA P2 
308f : a9 3a __ LDA #$3a
3091 : 69 00 __ ADC #$00
3093 : 85 10 __ STA P3 
3095 : 20 d9 36 JSR $36d9 ; (memcpy@proxy + 0)
3098 : 4c f2 30 JMP $30f2 ; (prepare_frame.s86 + 0)
.s88:
309b : 18 __ __ CLC
309c : a9 9b __ LDA #$9b
309e : 65 61 __ ADC T8 + 0 
30a0 : 85 0d __ STA P0 
30a2 : a9 53 __ LDA #$53
30a4 : 65 62 __ ADC T8 + 1 
30a6 : 85 0e __ STA P1 
30a8 : 18 __ __ CLC
30a9 : a9 a9 __ LDA #$a9
30ab : 65 5b __ ADC T4 + 0 
30ad : 85 0f __ STA P2 
30af : a9 3a __ LDA #$3a
30b1 : 69 00 __ ADC #$00
30b3 : 85 10 __ STA P3 
30b5 : 20 d9 36 JSR $36d9 ; (memcpy@proxy + 0)
30b8 : a9 00 __ LDA #$00
30ba : 85 12 __ STA P5 
30bc : 18 __ __ CLC
30bd : a9 05 __ LDA #$05
30bf : 85 0f __ STA P2 
30c1 : a5 55 __ LDA T1 + 0 
30c3 : 85 11 __ STA P4 
30c5 : a9 6b __ LDA #$6b
30c7 : 65 61 __ ADC T8 + 0 
30c9 : 85 0d __ STA P0 
30cb : a9 5b __ LDA #$5b
30cd : 65 62 __ ADC T8 + 1 
30cf : 85 0e __ STA P1 
30d1 : 20 bf 29 JSR $29bf ; (memset@proxy + 0)
30d4 : 18 __ __ CLC
30d5 : a5 5b __ LDA T4 + 0 
30d7 : 65 55 __ ADC T1 + 0 
30d9 : b0 17 __ BCS $30f2 ; (prepare_frame.s86 + 0)
.s90:
30db : c9 0a __ CMP #$0a
30dd : d0 13 __ BNE $30f2 ; (prepare_frame.s86 + 0)
.s89:
30df : 18 __ __ CLC
30e0 : a9 6a __ LDA #$6a
30e2 : 65 61 __ ADC T8 + 0 
30e4 : 85 53 __ STA T0 + 0 
30e6 : a9 5b __ LDA #$5b
30e8 : 65 62 __ ADC T8 + 1 
30ea : 85 54 __ STA T0 + 1 
30ec : a9 04 __ LDA #$04
30ee : a4 55 __ LDY T1 + 0 
30f0 : 91 53 __ STA (T0 + 0),y 
.s86:
30f2 : e6 60 __ INC T7 + 0 
30f4 : a5 60 __ LDA T7 + 0 
30f6 : c9 15 __ CMP #$15
30f8 : b0 03 __ BCS $30fd ; (prepare_frame.s86 + 11)
30fa : 4c 43 30 JMP $3043 ; (prepare_frame.l84 + 0)
30fd : 4c e4 2e JMP $2ee4 ; (prepare_frame.s40 + 0)
.s69:
3100 : 09 00 __ ORA #$00
3102 : d0 04 __ BNE $3108 ; (prepare_frame.s81 + 0)
.s96:
3104 : c0 51 __ CPY #$51
3106 : 90 0f __ BCC $3117 ; (prepare_frame.s70 + 0)
.s81:
3108 : a5 55 __ LDA T1 + 0 
310a : 85 59 __ STA T3 + 0 
310c : a9 00 __ LDA #$00
310e : 85 5b __ STA T4 + 0 
3110 : a5 56 __ LDA T1 + 1 
3112 : 85 5a __ STA T3 + 1 
3114 : 4c 1f 30 JMP $301f ; (prepare_frame.s82 + 0)
.s70:
3117 : a5 63 __ LDA T11 + 0 
3119 : 69 07 __ ADC #$07
311b : 85 55 __ STA T1 + 0 
311d : a9 00 __ LDA #$00
311f : 2a __ __ ROL
3120 : 85 56 __ STA T1 + 1 
3122 : 38 __ __ SEC
3123 : a5 55 __ LDA T1 + 0 
3125 : e9 08 __ SBC #$08
3127 : 85 57 __ STA T2 + 0 
3129 : a5 56 __ LDA T1 + 1 
312b : e9 00 __ SBC #$00
312d : 85 58 __ STA T2 + 1 
312f : 8a __ __ TXA
3130 : 18 __ __ CLC
3131 : 69 99 __ ADC #$99
3133 : 85 53 __ STA T0 + 0 
3135 : a9 53 __ LDA #$53
3137 : 65 54 __ ADC T0 + 1 
3139 : 85 54 __ STA T0 + 1 
313b : a9 00 __ LDA #$00
313d : 85 60 __ STA T7 + 0 
313f : c5 63 __ CMP T11 + 0 
3141 : aa __ __ TAX
3142 : 90 20 __ BCC $3164 ; (prepare_frame.l74 + 0)
.s72:
3144 : a5 56 __ LDA T1 + 1 
3146 : d0 04 __ BNE $314c ; (prepare_frame.l73 + 0)
.s80:
3148 : e4 55 __ CPX T1 + 0 
314a : b0 18 __ BCS $3164 ; (prepare_frame.l74 + 0)
.l73:
314c : 18 __ __ CLC
314d : a5 53 __ LDA T0 + 0 
314f : 69 50 __ ADC #$50
3151 : 85 53 __ STA T0 + 0 
3153 : 90 02 __ BCC $3157 ; (prepare_frame.s115 + 0)
.s114:
3155 : e6 54 __ INC T0 + 1 
.s115:
3157 : e6 60 __ INC T7 + 0 
3159 : a5 60 __ LDA T7 + 0 
315b : c9 15 __ CMP #$15
315d : b0 9e __ BCS $30fd ; (prepare_frame.s86 + 11)
.s71:
315f : c5 63 __ CMP T11 + 0 
3161 : e8 __ __ INX
3162 : b0 e0 __ BCS $3144 ; (prepare_frame.s72 + 0)
.l74:
3164 : a5 58 __ LDA T2 + 1 
3166 : d0 04 __ BNE $316c ; (prepare_frame.s76 + 0)
.s79:
3168 : e4 57 __ CPX T2 + 0 
316a : f0 08 __ BEQ $3174 ; (prepare_frame.s75 + 0)
.s76:
316c : a5 56 __ LDA T1 + 1 
316e : d0 44 __ BNE $31b4 ; (prepare_frame.s77 + 0)
.s78:
3170 : e4 55 __ CPX T1 + 0 
3172 : d0 40 __ BNE $31b4 ; (prepare_frame.s77 + 0)
.s75:
3174 : a9 0d __ LDA #$0d
3176 : a0 00 __ LDY #$00
3178 : 91 53 __ STA (T0 + 0),y 
317a : a9 0e __ LDA #$0e
317c : c8 __ __ INY
317d : 91 53 __ STA (T0 + 0),y 
317f : a9 0f __ LDA #$0f
3181 : c8 __ __ INY
3182 : 91 53 __ STA (T0 + 0),y 
3184 : a9 10 __ LDA #$10
3186 : a0 08 __ LDY #$08
3188 : 91 53 __ STA (T0 + 0),y 
318a : a9 20 __ LDA #$20
318c : c8 __ __ INY
318d : 91 53 __ STA (T0 + 0),y 
318f : a5 53 __ LDA T0 + 0 
3191 : e9 9b __ SBC #$9b
3193 : a8 __ __ TAY
3194 : a5 54 __ LDA T0 + 1 
3196 : e9 53 __ SBC #$53
3198 : 85 5c __ STA T4 + 1 
319a : 98 __ __ TYA
319b : 18 __ __ CLC
319c : 69 6b __ ADC #$6b
319e : 85 5b __ STA T4 + 0 
31a0 : a9 5b __ LDA #$5b
31a2 : 65 5c __ ADC T4 + 1 
31a4 : 85 5c __ STA T4 + 1 
31a6 : a9 05 __ LDA #$05
31a8 : a0 00 __ LDY #$00
31aa : 91 5b __ STA (T4 + 0),y 
31ac : a9 04 __ LDA #$04
31ae : a0 09 __ LDY #$09
31b0 : 91 5b __ STA (T4 + 0),y 
31b2 : d0 98 __ BNE $314c ; (prepare_frame.l73 + 0)
.s77:
31b4 : a9 0a __ LDA #$0a
31b6 : a0 01 __ LDY #$01
31b8 : 91 53 __ STA (T0 + 0),y 
31ba : a9 0b __ LDA #$0b
31bc : c8 __ __ INY
31bd : 91 53 __ STA (T0 + 0),y 
31bf : a9 0c __ LDA #$0c
31c1 : a0 07 __ LDY #$07
31c3 : 91 53 __ STA (T0 + 0),y 
31c5 : a9 20 __ LDA #$20
31c7 : c8 __ __ INY
31c8 : 91 53 __ STA (T0 + 0),y 
31ca : d0 80 __ BNE $314c ; (prepare_frame.l73 + 0)
.s112:
31cc : 20 75 27 JSR $2775 ; (game_over.s4 + 0)
31cf : 4c 9d 2d JMP $2d9d ; (prepare_frame.s3 + 0)
.s21:
31d2 : a9 03 __ LDA #$03
31d4 : cd ee 3a CMP $3aee ; (state + 0)
31d7 : d0 0b __ BNE $31e4 ; (prepare_frame.s23 + 0)
.s22:
31d9 : a9 01 __ LDA #$01
31db : 8d ee 3a STA $3aee ; (state + 0)
31de : 20 4d 25 JSR $254d ; (field.s4 + 0)
31e1 : 4c e2 2f JMP $2fe2 ; (prepare_frame.s111 + 0)
.s23:
31e4 : 8d ee 3a STA $3aee ; (state + 0)
31e7 : 20 0f 33 JSR $330f ; (unsync_pipes.s4 + 0)
31ea : 20 a2 27 JSR $27a2 ; (banner.s4 + 0)
31ed : 4c 9d 2d JMP $2d9d ; (prepare_frame.s3 + 0)
.s11:
31f0 : ad f1 3a LDA $3af1 ; (velocity + 0)
31f3 : a8 __ __ TAY
31f4 : 69 01 __ ADC #$01
31f6 : 8d f1 3a STA $3af1 ; (velocity + 0)
31f9 : ad f2 3a LDA $3af2 ; (velocity + 1)
31fc : aa __ __ TAX
31fd : 69 00 __ ADC #$00
31ff : 8d f2 3a STA $3af2 ; (velocity + 1)
3202 : 8a __ __ TXA
3203 : 30 10 __ BMI $3215 ; (prepare_frame.s13 + 0)
.s18:
3205 : d0 04 __ BNE $320b ; (prepare_frame.s12 + 0)
.s17:
3207 : c0 2f __ CPY #$2f
3209 : 90 0a __ BCC $3215 ; (prepare_frame.s13 + 0)
.s12:
320b : a9 30 __ LDA #$30
320d : 8d f1 3a STA $3af1 ; (velocity + 0)
3210 : a9 00 __ LDA #$00
3212 : 8d f2 3a STA $3af2 ; (velocity + 1)
.s13:
3215 : ad f3 3a LDA $3af3 ; (bird_y + 0)
3218 : 18 __ __ CLC
3219 : 6d f1 3a ADC $3af1 ; (velocity + 0)
321c : 8d f3 3a STA $3af3 ; (bird_y + 0)
321f : ad f4 3a LDA $3af4 ; (bird_y + 1)
3222 : 6d f2 3a ADC $3af2 ; (velocity + 1)
3225 : 8d f4 3a STA $3af4 ; (bird_y + 1)
3228 : 49 80 __ EOR #$80
322a : c9 89 __ CMP #$89
322c : d0 05 __ BNE $3233 ; (prepare_frame.s16 + 0)
.s15:
322e : ad f3 3a LDA $3af3 ; (bird_y + 0)
3231 : c9 c0 __ CMP #$c0
.s16:
3233 : 90 ac __ BCC $31e1 ; (prepare_frame.s22 + 8)
.s14:
3235 : a9 c0 __ LDA #$c0
3237 : 8d f3 3a STA $3af3 ; (bird_y + 0)
323a : a9 09 __ LDA #$09
323c : 8d f4 3a STA $3af4 ; (bird_y + 1)
323f : 20 34 24 JSR $2434 ; (bird_draw.s4 + 0)
3242 : 4c cc 31 JMP $31cc ; (prepare_frame.s112 + 0)
.s5:
3245 : ad bb 7a LDA $7abb ; (death_delay + 0)
3248 : f0 06 __ BEQ $3250 ; (prepare_frame.s7 + 0)
.s6:
324a : ce bb 7a DEC $7abb ; (death_delay + 0)
324d : 4c 9d 2d JMP $2d9d ; (prepare_frame.s3 + 0)
.s7:
3250 : a5 53 __ LDA T0 + 0 
3252 : 29 01 __ AND #$01
3254 : f0 f7 __ BEQ $324d ; (prepare_frame.s6 + 3)
.s8:
3256 : 8d ee 3a STA $3aee ; (state + 0)
3259 : 20 ca 23 JSR $23ca ; (reset_game.s4 + 0)
325c : a9 de __ LDA #$de
325e : 8d f1 3a STA $3af1 ; (velocity + 0)
3261 : a9 ff __ LDA #$ff
3263 : 8d f2 3a STA $3af2 ; (velocity + 1)
3266 : 4c 9a 2d JMP $2d9a ; (prepare_frame.s9 + 0)
--------------------------------------------------------------------
sound_flap: ; sound_flap()->void
;  16, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.h"
.s4:
3269 : a9 70 __ LDA #$70
326b : 85 0f __ STA P2 
326d : a9 fa __ LDA #$fa
326f : 85 11 __ STA P4 
3271 : a9 04 __ LDA #$04
3273 : 85 12 __ STA P5 
--------------------------------------------------------------------
start@proxy: ; start@proxy
3275 : a9 00 __ LDA #$00
3277 : 85 0d __ STA P0 
3279 : a9 00 __ LDA #$00
327b : 85 0e __ STA P1 
327d : a9 00 __ LDA #$00
327f : 85 10 __ STA P3 
3281 : a9 80 __ LDA #$80
3283 : 85 13 __ STA P6 
3285 : 4c be 32 JMP $32be ; (start.s4 + 0)
--------------------------------------------------------------------
crash: ; crash()->void
; 465, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
3288 : a9 00 __ LDA #$00
328a : 8d f1 3a STA $3af1 ; (velocity + 0)
328d : 8d f2 3a STA $3af2 ; (velocity + 1)
3290 : a9 04 __ LDA #$04
3292 : 8d ee 3a STA $3aee ; (state + 0)
3295 : a9 03 __ LDA #$03
3297 : 8d fe 3b STA $3bfe ; (flash + 0)
329a : 20 0f 33 JSR $330f ; (unsync_pipes.s4 + 0)
329d : a9 0c __ LDA #$0c
329f : 85 0f __ STA P2 
32a1 : a9 ff __ LDA #$ff
32a3 : 85 11 __ STA P4 
32a5 : a9 05 __ LDA #$05
32a7 : 85 12 __ STA P5 
32a9 : 20 75 32 JSR $3275 ; (start@proxy + 0)
32ac : a9 40 __ LDA #$40
32ae : 85 0f __ STA P2 
32b0 : 85 13 __ STA P6 
32b2 : a9 02 __ LDA #$02
32b4 : 85 0d __ STA P0 
32b6 : a9 fd __ LDA #$fd
32b8 : 85 11 __ STA P4 
32ba : a9 1a __ LDA #$1a
32bc : 85 12 __ STA P5 
--------------------------------------------------------------------
start: ; start(u8,u16,i16,u8,u8)->void
;  61, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.c"
.s4:
32be : a6 0d __ LDX P0 ; (v + 0)
32c0 : bc 4f 3a LDY $3a4f,x ; (__multab7L + 0)
32c3 : 84 43 __ STY T4 + 0 
32c5 : a9 00 __ LDA #$00
32c7 : 9d cb 7a STA $7acb,x ; (jump_at[0] + 0)
32ca : 99 04 d4 STA $d404,y 
32cd : 8a __ __ TXA
32ce : 0a __ __ ASL
32cf : a8 __ __ TAY
32d0 : a5 0e __ LDA P1 ; (f + 0)
32d2 : 99 bc 7a STA $7abc,y ; (freq[0] + 0)
32d5 : a5 0f __ LDA P2 ; (f + 1)
32d7 : 99 bd 7a STA $7abd,y ; (freq[0] + 1)
32da : a5 10 __ LDA P3 ; (s + 0)
32dc : 99 c2 7a STA $7ac2,y ; (step[0] + 0)
32df : a5 11 __ LDA P4 ; (s + 1)
32e1 : 99 c3 7a STA $7ac3,y ; (step[0] + 1)
32e4 : a5 12 __ LDA P5 ; (n + 0)
32e6 : 9d eb 3a STA $3aeb,x ; (timer[0] + 0)
32e9 : a5 13 __ LDA P6 ; (w + 0)
32eb : 9d c8 7a STA $7ac8,x ; (wave[0] + 0)
32ee : 8a __ __ TXA
32ef : 20 fc 32 JSR $32fc ; (apply.s4 + 0)
32f2 : a5 13 __ LDA P6 ; (w + 0)
32f4 : 09 01 __ ORA #$01
32f6 : a6 43 __ LDX T4 + 0 
32f8 : 9d 04 d4 STA $d404,x 
.s3:
32fb : 60 __ __ RTS
--------------------------------------------------------------------
apply: ; apply(u8)->void
;  53, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.c"
.s4:
32fc : aa __ __ TAX
32fd : 0a __ __ ASL
32fe : bc 4f 3a LDY $3a4f,x ; (__multab7L + 0)
3301 : aa __ __ TAX
3302 : bd bc 7a LDA $7abc,x ; (freq[0] + 0)
3305 : 99 00 d4 STA $d400,y 
3308 : bd bd 7a LDA $7abd,x ; (freq[0] + 1)
330b : 99 01 d4 STA $d401,y 
.s3:
330e : 60 __ __ RTS
--------------------------------------------------------------------
unsync_pipes: ; unsync_pipes()->void
; 371, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
330f : a9 00 __ LDA #$00
3311 : 85 45 __ STA T2 + 0 
.l5:
3313 : 0a __ __ ASL
3314 : 0a __ __ ASL
3315 : aa __ __ TAX
3316 : bd 8d 53 LDA $538d,x ; (pipes[0].gap + 0)
3319 : 85 4d __ STA T8 + 0 
331b : bd 8b 53 LDA $538b,x ; (pipes[0].x + 0)
331e : 38 __ __ SEC
331f : e9 02 __ SBC #$02
3321 : 85 43 __ STA T1 + 0 
3323 : bd 8c 53 LDA $538c,x ; (pipes[0].x + 1)
3326 : e9 00 __ SBC #$00
3328 : 85 44 __ STA T1 + 1 
332a : 18 __ __ CLC
332b : a5 43 __ LDA T1 + 0 
332d : 69 0b __ ADC #$0b
332f : 85 46 __ STA T3 + 0 
3331 : a5 44 __ LDA T1 + 1 
3333 : 69 00 __ ADC #$00
3335 : 85 47 __ STA T3 + 1 
3337 : 4c 3c 33 JMP $333c ; (unsync_pipes.l29 + 0)
.s28:
333a : a5 47 __ LDA T3 + 1 
.l29:
333c : c5 44 __ CMP T1 + 1 
333e : d0 08 __ BNE $3348 ; (unsync_pipes.s26 + 0)
.s23:
3340 : a5 46 __ LDA T3 + 0 
3342 : c5 43 __ CMP T1 + 0 
.s24:
3344 : 90 08 __ BCC $334e ; (unsync_pipes.s21 + 0)
3346 : b0 14 __ BCS $335c ; (unsync_pipes.s6 + 0)
.s26:
3348 : 45 44 __ EOR T1 + 1 
334a : 10 f8 __ BPL $3344 ; (unsync_pipes.s24 + 0)
.s25:
334c : 90 0e __ BCC $335c ; (unsync_pipes.s6 + 0)
.s21:
334e : e6 45 __ INC T2 + 0 
3350 : a5 45 __ LDA T2 + 0 
3352 : c9 04 __ CMP #$04
3354 : d0 bd __ BNE $3313 ; (unsync_pipes.l5 + 0)
.s22:
3356 : a9 00 __ LDA #$00
3358 : 8d ce 7a STA $7ace ; (prerendered + 0)
.s3:
335b : 60 __ __ RTS
.s6:
335c : a5 44 __ LDA T1 + 1 
335e : 30 6c __ BMI $33cc ; (unsync_pipes.s7 + 0)
.s8:
3360 : d0 6a __ BNE $33cc ; (unsync_pipes.s7 + 0)
.s20:
3362 : a5 43 __ LDA T1 + 0 
3364 : c9 50 __ CMP #$50
3366 : b0 64 __ BCS $33cc ; (unsync_pipes.s7 + 0)
.s9:
3368 : 38 __ __ SEC
3369 : a5 4d __ LDA T8 + 0 
336b : e9 01 __ SBC #$01
336d : 85 48 __ STA T4 + 0 
336f : a9 00 __ LDA #$00
3371 : e9 00 __ SBC #$00
3373 : 85 49 __ STA T4 + 1 
3375 : 18 __ __ CLC
3376 : a5 48 __ LDA T4 + 0 
3378 : 69 08 __ ADC #$08
337a : 85 4a __ STA T5 + 0 
337c : a5 49 __ LDA T4 + 1 
337e : 69 00 __ ADC #$00
3380 : 85 4b __ STA T5 + 1 
3382 : a9 00 __ LDA #$00
3384 : 85 4c __ STA T6 + 0 
.l30:
3386 : c5 4d __ CMP T8 + 0 
3388 : 90 0a __ BCC $3394 ; (unsync_pipes.s12 + 0)
.s10:
338a : a5 4b __ LDA T5 + 1 
338c : d0 36 __ BNE $33c4 ; (unsync_pipes.s11 + 0)
.s19:
338e : a5 4c __ LDA T6 + 0 
3390 : c5 4a __ CMP T5 + 0 
3392 : 90 30 __ BCC $33c4 ; (unsync_pipes.s11 + 0)
.s12:
3394 : 0a __ __ ASL
3395 : aa __ __ TAX
3396 : bd 59 53 LDA $5359,x ; (row_addr[0] + 0)
3399 : 18 __ __ CLC
339a : 65 43 __ ADC T1 + 0 
339c : 85 0d __ STA P0 
339e : bd 5a 53 LDA $535a,x ; (row_addr[0] + 1)
33a1 : 69 00 __ ADC #$00
33a3 : 85 0e __ STA P1 
33a5 : a5 49 __ LDA T4 + 1 
33a7 : d0 06 __ BNE $33af ; (unsync_pipes.s15 + 0)
.s18:
33a9 : a5 4c __ LDA T6 + 0 
33ab : c5 48 __ CMP T4 + 0 
33ad : f0 0a __ BEQ $33b9 ; (unsync_pipes.s13 + 0)
.s15:
33af : a5 4b __ LDA T5 + 1 
33b1 : d0 0a __ BNE $33bd ; (unsync_pipes.s16 + 0)
.s17:
33b3 : a5 4c __ LDA T6 + 0 
33b5 : c5 4a __ CMP T5 + 0 
33b7 : d0 04 __ BNE $33bd ; (unsync_pipes.s16 + 0)
.s13:
33b9 : a9 0f __ LDA #$0f
33bb : d0 02 __ BNE $33bf ; (unsync_pipes.s14 + 0)
.s16:
33bd : a9 05 __ LDA #$05
.s14:
33bf : 85 0f __ STA P2 
33c1 : 20 d8 33 JSR $33d8 ; (hidden_stale.s4 + 0)
.s11:
33c4 : e6 4c __ INC T6 + 0 
33c6 : a5 4c __ LDA T6 + 0 
33c8 : c9 15 __ CMP #$15
33ca : 90 ba __ BCC $3386 ; (unsync_pipes.l30 + 0)
.s7:
33cc : e6 43 __ INC T1 + 0 
33ce : f0 03 __ BEQ $33d3 ; (unsync_pipes.s27 + 0)
33d0 : 4c 3a 33 JMP $333a ; (unsync_pipes.s28 + 0)
.s27:
33d3 : e6 44 __ INC T1 + 1 
33d5 : 4c 3a 33 JMP $333a ; (unsync_pipes.s28 + 0)
--------------------------------------------------------------------
hidden_stale: ; hidden_stale(u16,u8)->void
; 293, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
33d8 : a9 3b __ LDA #$3b
33da : 85 1b __ STA ACCU + 0 
33dc : 18 __ __ CLC
33dd : a9 63 __ LDA #$63
33df : 65 0e __ ADC P1 ; (a + 1)
33e1 : 85 1c __ STA ACCU + 1 
33e3 : a4 0d __ LDY P0 ; (a + 0)
33e5 : b1 1b __ LDA (ACCU + 0),y 
33e7 : aa __ __ TAX
33e8 : 05 0f __ ORA P2 ; (bits + 0)
33ea : 91 1b __ STA (ACCU + 0),y 
33ec : 8a __ __ TXA
33ed : d0 30 __ BNE $341f ; (hidden_stale.s3 + 0)
.s5:
33ef : ad f6 3a LDA $3af6 ; (dirty_count + 0)
33f2 : 85 1b __ STA ACCU + 0 
33f4 : 18 __ __ CLC
33f5 : 69 01 __ ADC #$01
33f7 : 8d f6 3a STA $3af6 ; (dirty_count + 0)
33fa : ad f7 3a LDA $3af7 ; (dirty_count + 1)
33fd : 85 1c __ STA ACCU + 1 
33ff : 69 00 __ ADC #$00
3401 : 8d f7 3a STA $3af7 ; (dirty_count + 1)
3404 : 06 1b __ ASL ACCU + 0 
3406 : 26 1c __ ROL ACCU + 1 
3408 : 18 __ __ CLC
3409 : a9 0c __ LDA #$0c
340b : 65 1b __ ADC ACCU + 0 
340d : 85 1b __ STA ACCU + 0 
340f : a9 6b __ LDA #$6b
3411 : 65 1c __ ADC ACCU + 1 
3413 : 85 1c __ STA ACCU + 1 
3415 : 98 __ __ TYA
3416 : a0 00 __ LDY #$00
3418 : 91 1b __ STA (ACCU + 0),y 
341a : a5 0e __ LDA P1 ; (a + 1)
341c : c8 __ __ INY
341d : 91 1b __ STA (ACCU + 0),y 
.s3:
341f : 60 __ __ RTS
--------------------------------------------------------------------
prerender: ; prerender(u8)->u8
; 330, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
3420 : a2 08 __ LDX #$08
3422 : b5 53 __ LDA T11 + 0,x 
3424 : 9d ed bf STA $bfed,x ; (prerender@stack + 0)
3427 : ca __ __ DEX
3428 : 10 f8 __ BPL $3422 ; (prerender.s1 + 2)
.s4:
342a : a5 10 __ LDA P3 ; (i + 0)
342c : 0a __ __ ASL
342d : 0a __ __ ASL
342e : a8 __ __ TAY
342f : b9 8b 53 LDA $538b,y ; (pipes[0].x + 0)
3432 : e9 01 __ SBC #$01
3434 : 85 47 __ STA T2 + 0 
3436 : b9 8c 53 LDA $538c,y ; (pipes[0].x + 1)
3439 : e9 00 __ SBC #$00
343b : 85 48 __ STA T2 + 1 
343d : 30 08 __ BMI $3447 ; (prerender.s6 + 0)
.s73:
343f : d0 16 __ BNE $3457 ; (prerender.s5 + 0)
.s72:
3441 : a5 47 __ LDA T2 + 0 
3443 : c9 50 __ CMP #$50
3445 : b0 10 __ BCS $3457 ; (prerender.s5 + 0)
.s6:
3447 : b9 8c 53 LDA $538c,y ; (pipes[0].x + 1)
344a : 49 80 __ EOR #$80
344c : c9 7f __ CMP #$7f
344e : d0 05 __ BNE $3455 ; (prerender.s71 + 0)
.s70:
3450 : b9 8b 53 LDA $538b,y ; (pipes[0].x + 0)
3453 : c9 f8 __ CMP #$f8
.s71:
3455 : b0 05 __ BCS $345c ; (prerender.s7 + 0)
.s5:
3457 : a9 00 __ LDA #$00
3459 : 4c 58 36 JMP $3658 ; (prerender.s3 + 0)
.s7:
345c : a9 00 __ LDA #$00
345e : 85 4a __ STA T5 + 1 
3460 : ad 0b 6b LDA $6b0b ; (page + 0)
3463 : f0 06 __ BEQ $346b ; (prerender.s69 + 0)
.s8:
3465 : a9 10 __ LDA #$10
3467 : 85 4c __ STA T6 + 1 
3469 : b0 06 __ BCS $3471 ; (prerender.s9 + 0)
.s69:
346b : 85 4c __ STA T6 + 1 
346d : a9 10 __ LDA #$10
346f : 85 4a __ STA T5 + 1 
.s9:
3471 : b9 8d 53 LDA $538d,y ; (pipes[0].gap + 0)
3474 : 85 5a __ STA T17 + 0 
3476 : 24 48 __ BIT T2 + 1 
3478 : 10 03 __ BPL $347d ; (prerender.s66 + 0)
347a : 4c c1 36 JMP $36c1 ; (prerender.s10 + 0)
.s66:
347d : a5 47 __ LDA T2 + 0 
347f : 85 4d __ STA T7 + 0 
3481 : 18 __ __ CLC
3482 : 69 0b __ ADC #$0b
3484 : aa __ __ TAX
3485 : a9 00 __ LDA #$00
3487 : 85 4e __ STA T8 + 0 
3489 : a5 48 __ LDA T2 + 1 
348b : 69 00 __ ADC #$00
348d : d0 08 __ BNE $3497 ; (prerender.s11 + 0)
.s68:
348f : e0 51 __ CPX #$51
3491 : b0 04 __ BCS $3497 ; (prerender.s11 + 0)
.s67:
3493 : a9 0b __ LDA #$0b
3495 : 90 05 __ BCC $349c ; (prerender.s12 + 0)
.s11:
3497 : 38 __ __ SEC
3498 : a9 50 __ LDA #$50
349a : e5 4d __ SBC T7 + 0 
.s12:
349c : 85 4f __ STA T9 + 0 
349e : a5 4c __ LDA T6 + 1 
34a0 : 09 08 __ ORA #$08
34a2 : 85 51 __ STA T10 + 1 
34a4 : a5 4a __ LDA T5 + 1 
34a6 : 09 08 __ ORA #$08
34a8 : 85 54 __ STA T11 + 1 
34aa : 38 __ __ SEC
34ab : a9 4f __ LDA #$4f
34ad : e5 4d __ SBC T7 + 0 
34af : 85 52 __ STA T12 + 0 
34b1 : 18 __ __ CLC
34b2 : a5 5a __ LDA T17 + 0 
34b4 : 69 07 __ ADC #$07
34b6 : 85 55 __ STA T13 + 0 
34b8 : a9 00 __ LDA #$00
34ba : 85 59 __ STA T15 + 0 
34bc : 2a __ __ ROL
34bd : 85 56 __ STA T13 + 1 
34bf : 38 __ __ SEC
34c0 : a5 55 __ LDA T13 + 0 
34c2 : e9 08 __ SBC #$08
34c4 : 85 57 __ STA T14 + 0 
34c6 : a5 56 __ LDA T13 + 1 
34c8 : e9 00 __ SBC #$00
34ca : 85 58 __ STA T14 + 1 
34cc : d0 06 __ BNE $34d4 ; (prerender.l62 + 0)
.s65:
34ce : a5 59 __ LDA T15 + 0 
34d0 : c5 57 __ CMP T14 + 0 
34d2 : f0 0a __ BEQ $34de ; (prerender.s14 + 0)
.l62:
34d4 : a5 56 __ LDA T13 + 1 
34d6 : d0 0a __ BNE $34e2 ; (prerender.s63 + 0)
.s64:
34d8 : a5 59 __ LDA T15 + 0 
34da : c5 55 __ CMP T13 + 0 
34dc : d0 04 __ BNE $34e2 ; (prerender.s63 + 0)
.s14:
34de : a9 01 __ LDA #$01
34e0 : d0 02 __ BNE $34e4 ; (prerender.l15 + 0)
.s63:
34e2 : a9 00 __ LDA #$00
.l15:
34e4 : 85 5b __ STA T18 + 0 
34e6 : a5 59 __ LDA T15 + 0 
34e8 : c5 5a __ CMP T17 + 0 
34ea : 90 0d __ BCC $34f9 ; (prerender.s32 + 0)
.s16:
34ec : a5 56 __ LDA T13 + 1 
34ee : f0 03 __ BEQ $34f3 ; (prerender.s61 + 0)
34f0 : 4c c5 35 JMP $35c5 ; (prerender.s17 + 0)
.s61:
34f3 : a5 59 __ LDA T15 + 0 
34f5 : c5 55 __ CMP T13 + 0 
34f7 : 90 f7 __ BCC $34f0 ; (prerender.s16 + 4)
.s32:
34f9 : 0a __ __ ASL
34fa : aa __ __ TAX
34fb : a9 12 __ LDA #$12
34fd : 8d 00 d6 STA $d600 
3500 : bd 59 53 LDA $5359,x ; (row_addr[0] + 0)
3503 : 85 43 __ STA T0 + 0 
3505 : 18 __ __ CLC
3506 : 65 4d __ ADC T7 + 0 
3508 : 85 45 __ STA T1 + 0 
350a : bd 5a 53 LDA $535a,x ; (row_addr[0] + 1)
350d : 85 44 __ STA T0 + 1 
350f : 69 00 __ ADC #$00
3511 : 85 46 __ STA T1 + 1 
3513 : 18 __ __ CLC
3514 : 65 4c __ ADC T6 + 1 
3516 : aa __ __ TAX
3517 : 18 __ __ CLC
3518 : a5 45 __ LDA T1 + 0 
351a : 69 01 __ ADC #$01
351c : a8 __ __ TAY
351d : 90 02 __ BCC $3521 ; (prerender.s75 + 0)
.s74:
351f : e8 __ __ INX
3520 : 18 __ __ CLC
.s75:
3521 : a5 46 __ LDA T1 + 1 
3523 : 65 4a __ ADC T5 + 1 
.l33:
3525 : 2c 00 d6 BIT $d600 
3528 : 10 fb __ BPL $3525 ; (prerender.l33 + 0)
.s34:
352a : 8d 01 d6 STA $d601 
352d : a9 13 __ LDA #$13
352f : 8d 00 d6 STA $d600 
.l35:
3532 : 2c 00 d6 BIT $d600 
3535 : 10 fb __ BPL $3532 ; (prerender.l35 + 0)
.s36:
3537 : a5 45 __ LDA T1 + 0 
3539 : 8d 01 d6 STA $d601 
353c : a9 20 __ LDA #$20
353e : 8d 00 d6 STA $d600 
.l37:
3541 : 2c 00 d6 BIT $d600 
3544 : 10 fb __ BPL $3541 ; (prerender.l37 + 0)
.s38:
3546 : 8e 01 d6 STX $d601 
3549 : a9 21 __ LDA #$21
354b : 8d 00 d6 STA $d600 
.l39:
354e : 2c 00 d6 BIT $d600 
3551 : 10 fb __ BPL $354e ; (prerender.l39 + 0)
.s40:
3553 : 8c 01 d6 STY $d601 
3556 : a9 1e __ LDA #$1e
3558 : 8d 00 d6 STA $d600 
.l41:
355b : 2c 00 d6 BIT $d600 
355e : 10 fb __ BPL $355b ; (prerender.l41 + 0)
.s42:
3560 : a6 4f __ LDX T9 + 0 
3562 : 8e 01 d6 STX $d601 
3565 : a5 5b __ LDA T18 + 0 
3567 : f0 03 __ BEQ $356c ; (prerender.s54 + 0)
3569 : 4c 65 36 JMP $3665 ; (prerender.s43 + 0)
.s54:
356c : 8a __ __ TXA
.s78:
356d : 18 __ __ CLC
356e : 65 4d __ ADC T7 + 0 
3570 : c9 50 __ CMP #$50
3572 : d0 51 __ BNE $35c5 ; (prerender.s17 + 0)
.s55:
3574 : 18 __ __ CLC
3575 : a5 4a __ LDA T5 + 1 
3577 : 65 44 __ ADC T0 + 1 
3579 : aa __ __ TAX
357a : 38 __ __ SEC
357b : a5 43 __ LDA T0 + 0 
357d : e9 b1 __ SBC #$b1
357f : 85 45 __ STA T1 + 0 
3581 : 8a __ __ TXA
3582 : e9 ff __ SBC #$ff
3584 : 85 46 __ STA T1 + 1 
3586 : aa __ __ TAX
3587 : a5 45 __ LDA T1 + 0 
3589 : 20 de 20 JSR $20de ; (vdc_mem_addr.s4 + 0)
358c : 18 __ __ CLC
358d : a5 4e __ LDA T8 + 0 
358f : 65 52 __ ADC T12 + 0 
3591 : 85 47 __ STA T2 + 0 
3593 : 38 __ __ SEC
3594 : a9 00 __ LDA #$00
3596 : e5 5b __ SBC T18 + 0 
3598 : 29 0b __ AND #$0b
359a : 18 __ __ CLC
359b : 65 47 __ ADC T2 + 0 
359d : aa __ __ TAX
359e : bd 7e 3a LDA $3a7e,x ; (pipe_tiles[0][0] + 0)
.l56:
35a1 : 2c 00 d6 BIT $d600 
35a4 : 10 fb __ BPL $35a1 ; (prerender.l56 + 0)
.s57:
35a6 : 8d 01 d6 STA $d601 
35a9 : a5 5b __ LDA T18 + 0 
35ab : f0 18 __ BEQ $35c5 ; (prerender.s17 + 0)
.s58:
35ad : 18 __ __ CLC
35ae : a5 46 __ LDA T1 + 1 
35b0 : 69 08 __ ADC #$08
35b2 : aa __ __ TAX
35b3 : a5 45 __ LDA T1 + 0 
35b5 : 20 de 20 JSR $20de ; (vdc_mem_addr.s4 + 0)
35b8 : a6 47 __ LDX T2 + 0 
35ba : bd 94 3a LDA $3a94,x ; (cap_attr[0] + 0)
.l59:
35bd : 2c 00 d6 BIT $d600 
35c0 : 10 fb __ BPL $35bd ; (prerender.l59 + 0)
.s60:
35c2 : 8d 01 d6 STA $d601 
.s17:
35c5 : e6 59 __ INC T15 + 0 
35c7 : a5 59 __ LDA T15 + 0 
35c9 : c9 15 __ CMP #$15
35cb : b0 0a __ BCS $35d7 ; (prerender.s18 + 0)
.s13:
35cd : a5 58 __ LDA T14 + 1 
35cf : f0 03 __ BEQ $35d4 ; (prerender.s13 + 7)
35d1 : 4c d4 34 JMP $34d4 ; (prerender.l62 + 0)
35d4 : 4c ce 34 JMP $34ce ; (prerender.s65 + 0)
.s18:
35d7 : a5 4d __ LDA T7 + 0 
35d9 : c9 1e __ CMP #$1e
35db : b0 79 __ BCS $3656 ; (prerender.s29 + 0)
.s19:
35dd : 65 4f __ ADC T9 + 0 
35df : c9 1e __ CMP #$1e
35e1 : 90 73 __ BCC $3656 ; (prerender.s29 + 0)
.s20:
35e3 : ad f3 3a LDA $3af3 ; (bird_y + 0)
35e6 : 85 43 __ STA T0 + 0 
35e8 : ad f4 3a LDA $3af4 ; (bird_y + 1)
35eb : 4a __ __ LSR
35ec : 66 43 __ ROR T0 + 0 
35ee : 4a __ __ LSR
35ef : 66 43 __ ROR T0 + 0 
35f1 : 4a __ __ LSR
35f2 : 66 43 __ ROR T0 + 0 
35f4 : 4a __ __ LSR
35f5 : 66 43 __ ROR T0 + 0 
35f7 : 4a __ __ LSR
35f8 : 66 43 __ ROR T0 + 0 
35fa : 4a __ __ LSR
35fb : 66 43 __ ROR T0 + 0 
35fd : 4a __ __ LSR
35fe : a5 43 __ LDA T0 + 0 
3600 : 6a __ __ ROR
3601 : 85 45 __ STA T1 + 0 
3603 : d0 04 __ BNE $3609 ; (prerender.s21 + 0)
.s31:
3605 : a9 00 __ LDA #$00
3607 : f0 03 __ BEQ $360c ; (prerender.s22 + 0)
.s21:
3609 : 38 __ __ SEC
360a : e9 01 __ SBC #$01
.s22:
360c : 85 47 __ STA T2 + 0 
360e : 18 __ __ CLC
360f : a5 45 __ LDA T1 + 0 
3611 : 69 03 __ ADC #$03
3613 : 85 45 __ STA T1 + 0 
3615 : a9 00 __ LDA #$00
3617 : 6a __ __ ROR
3618 : 85 46 __ STA T1 + 1 
361a : 30 06 __ BMI $3622 ; (prerender.l79 + 0)
.s30:
361c : a5 45 __ LDA T1 + 0 
361e : c5 47 __ CMP T2 + 0 
3620 : 90 34 __ BCC $3656 ; (prerender.s29 + 0)
.l79:
3622 : a9 0c __ LDA #$0c
3624 : 85 0f __ STA P2 
.l23:
3626 : a5 47 __ LDA T2 + 0 
3628 : c9 15 __ CMP #$15
362a : b0 22 __ BCS $364e ; (prerender.s26 + 0)
.s24:
362c : c5 5a __ CMP T17 + 0 
362e : 90 0a __ BCC $363a ; (prerender.s25 + 0)
.s27:
3630 : a5 56 __ LDA T13 + 1 
3632 : d0 1a __ BNE $364e ; (prerender.s26 + 0)
.s28:
3634 : a5 47 __ LDA T2 + 0 
3636 : c5 55 __ CMP T13 + 0 
3638 : 90 14 __ BCC $364e ; (prerender.s26 + 0)
.s25:
363a : 0a __ __ ASL
363b : aa __ __ TAX
363c : bd 59 53 LDA $5359,x ; (row_addr[0] + 0)
363f : 38 __ __ SEC
3640 : e9 e3 __ SBC #$e3
3642 : 85 0d __ STA P0 
3644 : bd 5a 53 LDA $535a,x ; (row_addr[0] + 1)
3647 : e9 ff __ SBC #$ff
3649 : 85 0e __ STA P1 
364b : 20 d8 33 JSR $33d8 ; (hidden_stale.s4 + 0)
.s26:
364e : e6 47 __ INC T2 + 0 
3650 : 24 46 __ BIT T1 + 1 
3652 : 30 d2 __ BMI $3626 ; (prerender.l23 + 0)
3654 : 10 c6 __ BPL $361c ; (prerender.s30 + 0)
.s29:
3656 : a9 01 __ LDA #$01
.s3:
3658 : 85 1b __ STA ACCU + 0 
365a : a2 08 __ LDX #$08
365c : bd ed bf LDA $bfed,x ; (prerender@stack + 0)
365f : 95 53 __ STA T11 + 0,x 
3661 : ca __ __ DEX
3662 : 10 f8 __ BPL $365c ; (prerender.s3 + 4)
3664 : 60 __ __ RTS
.s43:
3665 : a9 12 __ LDA #$12
3667 : 8d 00 d6 STA $d600 
366a : 18 __ __ CLC
366b : a5 51 __ LDA T10 + 1 
366d : 65 46 __ ADC T1 + 1 
366f : aa __ __ TAX
3670 : 18 __ __ CLC
3671 : a5 45 __ LDA T1 + 0 
3673 : 69 01 __ ADC #$01
3675 : a8 __ __ TAY
3676 : 90 02 __ BCC $367a ; (prerender.s77 + 0)
.s76:
3678 : e8 __ __ INX
3679 : 18 __ __ CLC
.s77:
367a : a5 54 __ LDA T11 + 1 
367c : 65 46 __ ADC T1 + 1 
.l44:
367e : 2c 00 d6 BIT $d600 
3681 : 10 fb __ BPL $367e ; (prerender.l44 + 0)
.s45:
3683 : 8d 01 d6 STA $d601 
3686 : a9 13 __ LDA #$13
3688 : 8d 00 d6 STA $d600 
.l46:
368b : 2c 00 d6 BIT $d600 
368e : 10 fb __ BPL $368b ; (prerender.l46 + 0)
.s47:
3690 : a5 45 __ LDA T1 + 0 
3692 : 8d 01 d6 STA $d601 
3695 : a9 20 __ LDA #$20
3697 : 8d 00 d6 STA $d600 
.l48:
369a : 2c 00 d6 BIT $d600 
369d : 10 fb __ BPL $369a ; (prerender.l48 + 0)
.s49:
369f : 8e 01 d6 STX $d601 
36a2 : a9 21 __ LDA #$21
36a4 : 8d 00 d6 STA $d600 
.l50:
36a7 : 2c 00 d6 BIT $d600 
36aa : 10 fb __ BPL $36a7 ; (prerender.l50 + 0)
.s51:
36ac : 8c 01 d6 STY $d601 
36af : a9 1e __ LDA #$1e
36b1 : 8d 00 d6 STA $d600 
.l52:
36b4 : 2c 00 d6 BIT $d600 
36b7 : 10 fb __ BPL $36b4 ; (prerender.l52 + 0)
.s53:
36b9 : a5 4f __ LDA T9 + 0 
36bb : 8d 01 d6 STA $d601 
36be : 4c 6d 35 JMP $356d ; (prerender.s78 + 0)
.s10:
36c1 : a9 00 __ LDA #$00
36c3 : 85 4d __ STA T7 + 0 
36c5 : 38 __ __ SEC
36c6 : e5 47 __ SBC T2 + 0 
36c8 : 85 4e __ STA T8 + 0 
36ca : 49 ff __ EOR #$ff
36cc : 18 __ __ CLC
36cd : 69 0c __ ADC #$0c
36cf : c9 51 __ CMP #$51
36d1 : b0 03 __ BCS $36d6 ; (prerender.s10 + 21)
36d3 : 4c 9c 34 JMP $349c ; (prerender.s12 + 0)
36d6 : 4c 97 34 JMP $3497 ; (prerender.s11 + 0)
--------------------------------------------------------------------
memcpy@proxy: ; memcpy@proxy
36d9 : a5 55 __ LDA $55 
36db : 85 11 __ STA P4 
36dd : a9 00 __ LDA #$00
36df : 85 12 __ STA P5 
--------------------------------------------------------------------
memcpy: ; memcpy(void*,const void*,i16)->void
;  30, "/Users/lukaszdziwosz/Desktop/80Terminal/.tools/oscar64/include/string.h"
.s4:
36e1 : a6 12 __ LDX P5 
36e3 : f0 10 __ BEQ $36f5 ; (memcpy.s4 + 20)
36e5 : a0 00 __ LDY #$00
36e7 : b1 0f __ LDA (P2),y 
36e9 : 91 0d __ STA (P0),y 
36eb : c8 __ __ INY
36ec : d0 f9 __ BNE $36e7 ; (memcpy.s4 + 6)
36ee : e6 10 __ INC P3 
36f0 : e6 0e __ INC P1 
36f2 : ca __ __ DEX
36f3 : d0 f2 __ BNE $36e7 ; (memcpy.s4 + 6)
36f5 : a4 11 __ LDY P4 
36f7 : f0 0e __ BEQ $3707 ; (memcpy.s3 + 0)
36f9 : 88 __ __ DEY
36fa : f0 07 __ BEQ $3703 ; (memcpy.s4 + 34)
36fc : b1 0f __ LDA (P2),y 
36fe : 91 0d __ STA (P0),y 
3700 : 88 __ __ DEY
3701 : d0 f9 __ BNE $36fc ; (memcpy.s4 + 27)
3703 : b1 0f __ LDA (P2),y 
3705 : 91 0d __ STA (P0),y 
.s3:
3707 : 60 __ __ RTS
--------------------------------------------------------------------
sound_tick: ; sound_tick()->void
;  12, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.h"
.s4:
3708 : a2 00 __ LDX #$00
370a : ad eb 3a LDA $3aeb ; (timer[0] + 0)
370d : d0 0b __ BNE $371a ; (sound_tick.l6 + 0)
.l21:
370f : e8 __ __ INX
3710 : e0 03 __ CPX #$03
3712 : 90 01 __ BCC $3715 ; (sound_tick.s5 + 0)
3714 : 60 __ __ RTS
.s5:
3715 : bd eb 3a LDA $3aeb,x ; (timer[0] + 0)
3718 : f0 f5 __ BEQ $370f ; (sound_tick.l21 + 0)
.l6:
371a : 86 47 __ STX T6 + 0 
371c : 85 48 __ STA T7 + 0 
371e : 8a __ __ TXA
371f : 0a __ __ ASL
3720 : 85 46 __ STA T5 + 0 
3722 : a8 __ __ TAY
3723 : b9 c3 7a LDA $7ac3,y ; (step[0] + 1)
3726 : 19 c2 7a ORA $7ac2,y ; (step[0] + 0)
3729 : f0 55 __ BEQ $3780 ; (sound_tick.s10 + 0)
.s7:
372b : b9 c3 7a LDA $7ac3,y ; (step[0] + 1)
372e : 29 80 __ AND #$80
3730 : 10 02 __ BPL $3734 ; (sound_tick.s7 + 9)
3732 : a9 ff __ LDA #$ff
3734 : 85 1d __ STA ACCU + 2 
3736 : b9 c2 7a LDA $7ac2,y ; (step[0] + 0)
3739 : 18 __ __ CLC
373a : 79 bc 7a ADC $7abc,y ; (freq[0] + 0)
373d : 85 43 __ STA T0 + 0 
373f : b9 c3 7a LDA $7ac3,y ; (step[0] + 1)
3742 : 79 bd 7a ADC $7abd,y ; (freq[0] + 1)
3745 : 85 44 __ STA T0 + 1 
3747 : a5 1d __ LDA ACCU + 2 
3749 : 69 00 __ ADC #$00
374b : 85 45 __ STA T0 + 2 
374d : a5 1d __ LDA ACCU + 2 
374f : 69 00 __ ADC #$00
3751 : 10 15 __ BPL $3768 ; (sound_tick.s15 + 0)
.s8:
3753 : a9 00 __ LDA #$00
.s20:
3755 : 85 44 __ STA T0 + 1 
.s9:
3757 : 99 bc 7a STA $7abc,y ; (freq[0] + 0)
375a : a5 44 __ LDA T0 + 1 
375c : 99 bd 7a STA $7abd,y ; (freq[0] + 1)
375f : 8a __ __ TXA
3760 : 20 fc 32 JSR $32fc ; (apply.s4 + 0)
3763 : a6 47 __ LDX T6 + 0 
3765 : 4c 80 37 JMP $3780 ; (sound_tick.s10 + 0)
.s15:
3768 : d0 04 __ BNE $376e ; (sound_tick.s23 + 0)
.s16:
376a : a5 45 __ LDA T0 + 2 
376c : f0 04 __ BEQ $3772 ; (sound_tick.s17 + 0)
.s23:
376e : a9 ff __ LDA #$ff
3770 : d0 e3 __ BNE $3755 ; (sound_tick.s20 + 0)
.s17:
3772 : a9 ff __ LDA #$ff
3774 : c5 44 __ CMP T0 + 1 
3776 : d0 02 __ BNE $377a ; (sound_tick.s19 + 0)
.s18:
3778 : c5 43 __ CMP T0 + 0 
.s19:
377a : 90 d9 __ BCC $3755 ; (sound_tick.s20 + 0)
.s22:
377c : a5 43 __ LDA T0 + 0 
377e : b0 d7 __ BCS $3757 ; (sound_tick.s9 + 0)
.s10:
3780 : c6 48 __ DEC T7 + 0 
3782 : a5 48 __ LDA T7 + 0 
3784 : 9d eb 3a STA $3aeb,x ; (timer[0] + 0)
3787 : dd cb 7a CMP $7acb,x ; (jump_at[0] + 0)
378a : d0 19 __ BNE $37a5 ; (sound_tick.s14 + 0)
.s11:
378c : bd cb 7a LDA $7acb,x ; (jump_at[0] + 0)
378f : f0 14 __ BEQ $37a5 ; (sound_tick.s14 + 0)
.s12:
3791 : a4 46 __ LDY T5 + 0 
3793 : b9 cf 7a LDA $7acf,y ; (jump_freq[0] + 0)
3796 : 99 bc 7a STA $7abc,y ; (freq[0] + 0)
3799 : b9 d0 7a LDA $7ad0,y ; (jump_freq[0] + 1)
379c : 99 bd 7a STA $7abd,y ; (freq[0] + 1)
379f : 8a __ __ TXA
37a0 : 20 fc 32 JSR $32fc ; (apply.s4 + 0)
37a3 : a6 47 __ LDX T6 + 0 
.s14:
37a5 : a5 48 __ LDA T7 + 0 
37a7 : f0 03 __ BEQ $37ac ; (sound_tick.s13 + 0)
37a9 : 4c 0f 37 JMP $370f ; (sound_tick.l21 + 0)
.s13:
37ac : bd c8 7a LDA $7ac8,x ; (wave[0] + 0)
37af : bc 4f 3a LDY $3a4f,x ; (__multab7L + 0)
37b2 : 99 04 d4 STA $d404,y 
37b5 : 4c 0f 37 JMP $370f ; (sound_tick.l21 + 0)
.s3:
37b8 : 60 __ __ RTS
--------------------------------------------------------------------
stage_frame: ; stage_frame()->void
; 649, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
37b9 : a2 04 __ LDX #$04
37bb : b5 53 __ LDA T2 + 0,x 
37bd : 9d f7 bf STA $bff7,x ; (stage_frame@stack + 0)
37c0 : ca __ __ DEX
37c1 : 10 f8 __ BPL $37bb ; (stage_frame.s1 + 2)
.s4:
37c3 : ac d5 7a LDY $7ad5 ; (max_dirty + 0)
37c6 : ad d6 7a LDA $7ad6 ; (max_dirty + 1)
37c9 : cd f7 3a CMP $3af7 ; (dirty_count + 1)
37cc : d0 03 __ BNE $37d1 ; (stage_frame.s41 + 0)
.s40:
37ce : cc f6 3a CPY $3af6 ; (dirty_count + 0)
.s41:
37d1 : b0 0c __ BCS $37df ; (stage_frame.s6 + 0)
.s5:
37d3 : ad f6 3a LDA $3af6 ; (dirty_count + 0)
37d6 : 8d d5 7a STA $7ad5 ; (max_dirty + 0)
37d9 : ad f7 3a LDA $3af7 ; (dirty_count + 1)
37dc : 8d d6 7a STA $7ad6 ; (max_dirty + 1)
.s6:
37df : ad fc 3b LDA $3bfc ; (bird_set + 0)
37e2 : cd ff 3a CMP $3aff ; (shown_set + 0)
37e5 : f0 03 __ BEQ $37ea ; (stage_frame.s8 + 0)
.s7:
37e7 : 20 8e 2c JSR $2c8e ; (load_pose.s4 + 0)
.s8:
37ea : ad ba 7a LDA $7aba ; (stepped + 0)
37ed : d0 0c __ BNE $37fb ; (stage_frame.s9 + 0)
.s38:
37ef : ae ee 3a LDX $3aee ; (state + 0)
37f2 : ca __ __ DEX
37f3 : d0 06 __ BNE $37fb ; (stage_frame.s9 + 0)
.s39:
37f5 : 8d ff 3b STA $3bff ; (flip + 0)
37f8 : 4c d1 38 JMP $38d1 ; (stage_frame.s3 + 0)
.s9:
37fb : a9 01 __ LDA #$01
37fd : 8d ff 3b STA $3bff ; (flip + 0)
3800 : cd ee 3a CMP $3aee ; (state + 0)
3803 : d0 74 __ BNE $3879 ; (stage_frame.s13 + 0)
.s10:
3805 : ad f3 3a LDA $3af3 ; (bird_y + 0)
3808 : 85 54 __ STA T3 + 0 
380a : ad f4 3a LDA $3af4 ; (bird_y + 1)
380d : 4a __ __ LSR
380e : 66 54 __ ROR T3 + 0 
3810 : 4a __ __ LSR
3811 : 66 54 __ ROR T3 + 0 
3813 : 4a __ __ LSR
3814 : 66 54 __ ROR T3 + 0 
3816 : 4a __ __ LSR
3817 : 66 54 __ ROR T3 + 0 
3819 : 4a __ __ LSR
381a : 66 54 __ ROR T3 + 0 
381c : 4a __ __ LSR
381d : 66 54 __ ROR T3 + 0 
381f : 4a __ __ LSR
3820 : 66 54 __ ROR T3 + 0 
3822 : a9 00 __ LDA #$00
3824 : 85 55 __ STA T4 + 0 
.l11:
3826 : 0a __ __ ASL
3827 : 0a __ __ ASL
3828 : aa __ __ TAX
3829 : bd 8b 53 LDA $538b,x ; (pipes[0].x + 0)
382c : 38 __ __ SEC
382d : e9 01 __ SBC #$01
382f : a8 __ __ TAY
3830 : bd 8c 53 LDA $538c,x ; (pipes[0].x + 1)
3833 : e9 00 __ SBC #$00
3835 : 30 06 __ BMI $383d ; (stage_frame.s25 + 0)
.s37:
3837 : d0 38 __ BNE $3871 ; (stage_frame.s12 + 0)
.s36:
3839 : c0 23 __ CPY #$23
383b : b0 34 __ BCS $3871 ; (stage_frame.s12 + 0)
.s25:
383d : bd 8c 53 LDA $538c,x ; (pipes[0].x + 1)
3840 : 30 2f __ BMI $3871 ; (stage_frame.s12 + 0)
.s35:
3842 : d0 07 __ BNE $384b ; (stage_frame.s26 + 0)
.s34:
3844 : bd 8b 53 LDA $538b,x ; (pipes[0].x + 0)
3847 : c9 15 __ CMP #$15
3849 : 90 26 __ BCC $3871 ; (stage_frame.s12 + 0)
.s26:
384b : bd 8d 53 LDA $538d,x ; (pipes[0].gap + 0)
384e : 85 56 __ STA T5 + 0 
3850 : a5 54 __ LDA T3 + 0 
3852 : 85 57 __ STA T6 + 0 
3854 : 4c 5b 38 JMP $385b ; (stage_frame.l27 + 0)
.s30:
3857 : a5 54 __ LDA T3 + 0 
3859 : e6 57 __ INC T6 + 0 
.l27:
385b : 18 __ __ CLC
385c : 69 03 __ ADC #$03
385e : 85 43 __ STA T0 + 0 
3860 : a9 00 __ LDA #$00
3862 : a6 57 __ LDX T6 + 0 
3864 : 86 52 __ STX T1 + 0 
3866 : 6a __ __ ROR
3867 : 30 04 __ BMI $386d ; (stage_frame.s43 + 0)
.s33:
3869 : e4 43 __ CPX T0 + 0 
386b : b0 04 __ BCS $3871 ; (stage_frame.s12 + 0)
.s43:
386d : e0 15 __ CPX #$15
386f : 90 6b __ BCC $38dc ; (stage_frame.s28 + 0)
.s12:
3871 : e6 55 __ INC T4 + 0 
3873 : a5 55 __ LDA T4 + 0 
3875 : c9 04 __ CMP #$04
3877 : d0 ad __ BNE $3826 ; (stage_frame.l11 + 0)
.s13:
3879 : a9 0c __ LDA #$0c
387b : 85 11 __ STA P4 
387d : ad 0b 6b LDA $6b0b ; (page + 0)
3880 : 85 52 __ STA T1 + 0 
3882 : f0 06 __ BEQ $388a ; (stage_frame.s24 + 0)
.s14:
3884 : a9 00 __ LDA #$00
3886 : 85 0f __ STA P2 
3888 : f0 06 __ BEQ $3890 ; (stage_frame.s15 + 0)
.s24:
388a : a9 00 __ LDA #$00
388c : 85 0f __ STA P2 
388e : a9 10 __ LDA #$10
.s15:
3890 : 85 10 __ STA P3 
3892 : 20 77 2a JSR $2a77 ; (write_cells.s4 + 0)
.l16:
3895 : ad 00 d6 LDA $d600 
3898 : 29 20 __ AND #$20
389a : d0 f9 __ BNE $3895 ; (stage_frame.l16 + 0)
.s17:
389c : a9 0c __ LDA #$0c
389e : 8d 00 d6 STA $d600 
38a1 : a5 52 __ LDA T1 + 0 
38a3 : 49 01 __ EOR #$01
38a5 : 8d 0b 6b STA $6b0b ; (page + 0)
38a8 : f0 06 __ BEQ $38b0 ; (stage_frame.s19 + 0)
.s18:
38aa : a9 10 __ LDA #$10
38ac : a0 01 __ LDY #$01
38ae : d0 03 __ BNE $38b3 ; (stage_frame.l20 + 0)
.s19:
38b0 : a9 00 __ LDA #$00
38b2 : a8 __ __ TAY
.l20:
38b3 : 2c 00 d6 BIT $d600 
38b6 : 10 fb __ BPL $38b3 ; (stage_frame.l20 + 0)
.s21:
38b8 : 8d 01 d6 STA $d601 
38bb : a9 14 __ LDA #$14
38bd : 8d 00 d6 STA $d600 
38c0 : 98 __ __ TYA
38c1 : f0 04 __ BEQ $38c7 ; (stage_frame.s45 + 0)
.s46:
38c3 : a9 18 __ LDA #$18
38c5 : d0 02 __ BNE $38c9 ; (stage_frame.l22 + 0)
.s45:
38c7 : a9 08 __ LDA #$08
.l22:
38c9 : 2c 00 d6 BIT $d600 
38cc : 10 fb __ BPL $38c9 ; (stage_frame.l22 + 0)
.s23:
38ce : 8d 01 d6 STA $d601 
.s3:
38d1 : a2 04 __ LDX #$04
38d3 : bd f7 bf LDA $bff7,x ; (stage_frame@stack + 0)
38d6 : 95 53 __ STA T2 + 0,x 
38d8 : ca __ __ DEX
38d9 : 10 f8 __ BPL $38d3 ; (stage_frame.s3 + 2)
38db : 60 __ __ RTS
.s28:
38dc : e4 56 __ CPX T5 + 0 
38de : 90 0f __ BCC $38ef ; (stage_frame.s29 + 0)
.s31:
38e0 : a5 56 __ LDA T5 + 0 
38e2 : 69 06 __ ADC #$06
38e4 : 90 03 __ BCC $38e9 ; (stage_frame.s32 + 0)
38e6 : 4c 57 38 JMP $3857 ; (stage_frame.s30 + 0)
.s32:
38e9 : c5 57 __ CMP T6 + 0 
38eb : 90 02 __ BCC $38ef ; (stage_frame.s29 + 0)
.s44:
38ed : d0 f7 __ BNE $38e6 ; (stage_frame.s31 + 6)
.s29:
38ef : 06 52 __ ASL T1 + 0 
38f1 : a9 1e __ LDA #$1e
38f3 : 85 53 __ STA T2 + 0 
38f5 : a9 0c __ LDA #$0c
38f7 : 85 0f __ STA P2 
.l42:
38f9 : a6 52 __ LDX T1 + 0 
38fb : bd 59 53 LDA $5359,x ; (row_addr[0] + 0)
38fe : 18 __ __ CLC
38ff : 65 53 __ ADC T2 + 0 
3901 : 85 0d __ STA P0 
3903 : bd 5a 53 LDA $535a,x ; (row_addr[0] + 1)
3906 : 69 00 __ ADC #$00
3908 : 85 0e __ STA P1 
390a : 20 d8 33 JSR $33d8 ; (hidden_stale.s4 + 0)
390d : e6 53 __ INC T2 + 0 
390f : a5 53 __ LDA T2 + 0 
3911 : c9 23 __ CMP #$23
3913 : d0 e4 __ BNE $38f9 ; (stage_frame.l42 + 0)
3915 : 4c 57 38 JMP $3857 ; (stage_frame.s30 + 0)
--------------------------------------------------------------------
sound_off: ; sound_off()->void
;  13, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.h"
.s4:
3918 : a9 00 __ LDA #$00
391a : 8d 04 d4 STA $d404 
391d : 8d 0b d4 STA $d40b 
3920 : 8d 12 d4 STA $d412 
3923 : 8d 18 d4 STA $d418 
.s3:
3926 : 60 __ __ RTS
--------------------------------------------------------------------
putch: ; putch(u8)->void
;  89, "/Users/lukaszdziwosz/Desktop/80Terminal/.tools/oscar64/include/conio.h"
.s4:
3927 : aa __ __ TAX
3928 : ad 5e 3a LDA $3a5e ; (giocharmap + 0)
392b : f0 2c __ BEQ $3959 ; (putch.s7 + 0)
.s5:
392d : e0 0a __ CPX #$0a
392f : d0 05 __ BNE $3936 ; (putch.s8 + 0)
.s6:
3931 : a9 0d __ LDA #$0d
.s18:
3933 : 4c d2 ff JMP $ffd2 
.s8:
3936 : e0 09 __ CPX #$09
3938 : f0 29 __ BEQ $3963 ; (putch.s9 + 0)
.s11:
393a : c9 02 __ CMP #$02
393c : 90 1b __ BCC $3959 ; (putch.s7 + 0)
.s12:
393e : e0 41 __ CPX #$41
3940 : 90 17 __ BCC $3959 ; (putch.s7 + 0)
.s13:
3942 : e0 7b __ CPX #$7b
3944 : b0 13 __ BCS $3959 ; (putch.s7 + 0)
.s14:
3946 : 8a __ __ TXA
3947 : e0 61 __ CPX #$61
3949 : b0 04 __ BCS $394f ; (putch.s15 + 0)
.s17:
394b : c9 5b __ CMP #$5b
394d : b0 0a __ BCS $3959 ; (putch.s7 + 0)
.s15:
394f : 49 20 __ EOR #$20
3951 : aa __ __ TAX
3952 : ad 5e 3a LDA $3a5e ; (giocharmap + 0)
3955 : c9 02 __ CMP #$02
3957 : f0 04 __ BEQ $395d ; (putch.s16 + 0)
.s7:
3959 : 8a __ __ TXA
395a : 4c 33 39 JMP $3933 ; (putch.s18 + 0)
.s16:
395d : 8a __ __ TXA
395e : 29 5f __ AND #$5f
3960 : 4c 33 39 JMP $3933 ; (putch.s18 + 0)
.s9:
3963 : a5 ec __ LDA $ec 
3965 : 29 03 __ AND #$03
3967 : a8 __ __ TAY
.l10:
3968 : a9 20 __ LDA #$20
396a : 20 d2 ff JSR $ffd2 
396d : c8 __ __ INY
396e : c0 04 __ CPY #$04
3970 : 90 f6 __ BCC $3968 ; (putch.l10 + 0)
.s3:
3972 : 60 __ __ RTS
--------------------------------------------------------------------
3973 : __ __ __ BYT 54 48 41 4e 4b 20 59 4f 55 00                   : THANK YOU.
--------------------------------------------------------------------
mul16by8: ; mul16by8
397d : 4a __ __ LSR
397e : f0 2e __ BEQ $39ae ; (mul16by8 + 49)
3980 : a2 00 __ LDX #$00
3982 : a0 00 __ LDY #$00
3984 : 90 13 __ BCC $3999 ; (mul16by8 + 28)
3986 : a4 1b __ LDY ACCU + 0 
3988 : a6 1c __ LDX ACCU + 1 
398a : b0 0d __ BCS $3999 ; (mul16by8 + 28)
398c : 85 02 __ STA $02 
398e : 18 __ __ CLC
398f : 98 __ __ TYA
3990 : 65 1b __ ADC ACCU + 0 
3992 : a8 __ __ TAY
3993 : 8a __ __ TXA
3994 : 65 1c __ ADC ACCU + 1 
3996 : aa __ __ TAX
3997 : a5 02 __ LDA $02 
3999 : 06 1b __ ASL ACCU + 0 
399b : 26 1c __ ROL ACCU + 1 
399d : 4a __ __ LSR
399e : 90 f9 __ BCC $3999 ; (mul16by8 + 28)
39a0 : d0 ea __ BNE $398c ; (mul16by8 + 15)
39a2 : 18 __ __ CLC
39a3 : 98 __ __ TYA
39a4 : 65 1b __ ADC ACCU + 0 
39a6 : 85 1b __ STA ACCU + 0 
39a8 : 8a __ __ TXA
39a9 : 65 1c __ ADC ACCU + 1 
39ab : 85 1c __ STA ACCU + 1 
39ad : 60 __ __ RTS
39ae : b0 04 __ BCS $39b4 ; (mul16by8 + 55)
39b0 : 85 1b __ STA ACCU + 0 
39b2 : 85 1c __ STA ACCU + 1 
39b4 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
39b5 : a5 1c __ LDA ACCU + 1 
39b7 : d0 3b __ BNE $39f4 ; (divmod + 63)
39b9 : a5 04 __ LDA WORK + 1 
39bb : d0 1e __ BNE $39db ; (divmod + 38)
39bd : 85 06 __ STA WORK + 3 
39bf : a2 04 __ LDX #$04
39c1 : 06 1b __ ASL ACCU + 0 
39c3 : 2a __ __ ROL
39c4 : c5 03 __ CMP WORK + 0 
39c6 : 90 02 __ BCC $39ca ; (divmod + 21)
39c8 : e5 03 __ SBC WORK + 0 
39ca : 26 1b __ ROL ACCU + 0 
39cc : 2a __ __ ROL
39cd : c5 03 __ CMP WORK + 0 
39cf : 90 02 __ BCC $39d3 ; (divmod + 30)
39d1 : e5 03 __ SBC WORK + 0 
39d3 : 26 1b __ ROL ACCU + 0 
39d5 : ca __ __ DEX
39d6 : d0 eb __ BNE $39c3 ; (divmod + 14)
39d8 : 85 05 __ STA WORK + 2 
39da : 60 __ __ RTS
39db : a5 1b __ LDA ACCU + 0 
39dd : 85 05 __ STA WORK + 2 
39df : a5 1c __ LDA ACCU + 1 
39e1 : 85 06 __ STA WORK + 3 
39e3 : a9 00 __ LDA #$00
39e5 : 85 1b __ STA ACCU + 0 
39e7 : 85 1c __ STA ACCU + 1 
39e9 : 60 __ __ RTS
39ea : 85 03 __ STA WORK + 0 
39ec : a9 00 __ LDA #$00
39ee : 85 04 __ STA WORK + 1 
39f0 : a5 1c __ LDA ACCU + 1 
39f2 : f0 c9 __ BEQ $39bd ; (divmod + 8)
39f4 : a5 04 __ LDA WORK + 1 
39f6 : d0 1f __ BNE $3a17 ; (divmod + 98)
39f8 : a5 03 __ LDA WORK + 0 
39fa : 30 1b __ BMI $3a17 ; (divmod + 98)
39fc : a9 00 __ LDA #$00
39fe : 85 06 __ STA WORK + 3 
3a00 : a2 10 __ LDX #$10
3a02 : 06 1b __ ASL ACCU + 0 
3a04 : 26 1c __ ROL ACCU + 1 
3a06 : 2a __ __ ROL
3a07 : c5 03 __ CMP WORK + 0 
3a09 : 90 02 __ BCC $3a0d ; (divmod + 88)
3a0b : e5 03 __ SBC WORK + 0 
3a0d : 26 1b __ ROL ACCU + 0 
3a0f : 26 1c __ ROL ACCU + 1 
3a11 : ca __ __ DEX
3a12 : d0 f2 __ BNE $3a06 ; (divmod + 81)
3a14 : 85 05 __ STA WORK + 2 
3a16 : 60 __ __ RTS
3a17 : a9 00 __ LDA #$00
3a19 : 85 05 __ STA WORK + 2 
3a1b : 85 06 __ STA WORK + 3 
3a1d : a0 10 __ LDY #$10
3a1f : 18 __ __ CLC
3a20 : 26 1b __ ROL ACCU + 0 
3a22 : 26 1c __ ROL ACCU + 1 
3a24 : 26 05 __ ROL WORK + 2 
3a26 : 26 06 __ ROL WORK + 3 
3a28 : 38 __ __ SEC
3a29 : a5 05 __ LDA WORK + 2 
3a2b : e5 03 __ SBC WORK + 0 
3a2d : aa __ __ TAX
3a2e : a5 06 __ LDA WORK + 3 
3a30 : e5 04 __ SBC WORK + 1 
3a32 : 90 04 __ BCC $3a38 ; (divmod + 131)
3a34 : 86 05 __ STX WORK + 2 
3a36 : 85 06 __ STA WORK + 3 
3a38 : 88 __ __ DEY
3a39 : d0 e5 __ BNE $3a20 ; (divmod + 107)
3a3b : 26 1b __ ROL ACCU + 0 
3a3d : 26 1c __ ROL ACCU + 1 
3a3f : 60 __ __ RTS
--------------------------------------------------------------------
__multab60L:
3a40 : __ __ __ BYT 00 3c 78                                        : .<x
--------------------------------------------------------------------
__multab5L:
3a43 : __ __ __ BYT 00 05 0a 0f 14 19 1e 23 28 2d 32 37             : .......#(-27
--------------------------------------------------------------------
__multab7L:
3a4f : __ __ __ BYT 00 07 0e                                        : ...
--------------------------------------------------------------------
panel_text@proxy: ; panel_text@proxy
3a52 : a5 1b __ LDA ACCU + 0 
3a54 : 85 12 __ STA P5 
3a56 : a5 1c __ LDA ACCU + 1 
3a58 : 85 13 __ STA P6 
3a5a : 4c a0 28 JMP $28a0 ; (panel_text.s4 + 0)
--------------------------------------------------------------------
spentry:
3a5d : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
3a5e : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
round:
3a5f : __ __ __ BYT 0f 3f 7f 7f ff ff ff ff                         : .?......
--------------------------------------------------------------------
stripe:
3a67 : __ __ __ BYT f0 78 3c 1e 0f 87 c3 e1                         : .x<.....
--------------------------------------------------------------------
random_state:
3a6f : __ __ __ BYT e1 ac                                           : ..
--------------------------------------------------------------------
flap:
3a71 : __ __ __ BYT 00 01 02 01                                     : ....
--------------------------------------------------------------------
bird_row:
3a75 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
shown_row:
3a76 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
bird_colours:
3a77 : __ __ __ BYT 0d 0d 0d 0f 09                                  : .....
--------------------------------------------------------------------
set_pose:
3a7c : __ __ __ BYT ff ff                                           : ..
--------------------------------------------------------------------
pipe_tiles:
3a7e : __ __ __ BYT 20 0a 0b 0b 0b 0b 0b 0c 20 20 20 0d 0e 0f 0f 0f :  .......   .....
3a8e : __ __ __ BYT 0f 0f 0f 10 20 20                               : ....  
--------------------------------------------------------------------
cap_attr:
3a94 : __ __ __ BYT 05 05 05 05 05 05 05 05 05 04 04                : ...........
--------------------------------------------------------------------
body:
3a9f : __ __ __ BYT 20 0a 0b 0b 0b 0b 0b 0c 20 20                   :  .......  
--------------------------------------------------------------------
cap:
3aa9 : __ __ __ BYT 0d 0e 0f 0f 0f 0f 0f 0f 10 20                   : ......... 
--------------------------------------------------------------------
bitshift:
3ab3 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
3ac3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ad3 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
3ae3 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
timer:
3aeb : __ __ __ BSS	3
--------------------------------------------------------------------
state:
3aee : __ __ __ BSS	1
--------------------------------------------------------------------
score:
3aef : __ __ __ BSS	2
--------------------------------------------------------------------
velocity:
3af1 : __ __ __ BSS	2
--------------------------------------------------------------------
bird_y:
3af3 : __ __ __ BSS	2
--------------------------------------------------------------------
phase:
3af5 : __ __ __ BSS	1
--------------------------------------------------------------------
dirty_count:
3af6 : __ __ __ BSS	2
--------------------------------------------------------------------
front_count:
3af8 : __ __ __ BSS	2
--------------------------------------------------------------------
best:
3afa : __ __ __ BSS	2
--------------------------------------------------------------------
frame_count:
3afc : __ __ __ BSS	2
--------------------------------------------------------------------
bird_pose:
3afe : __ __ __ BSS	1
--------------------------------------------------------------------
shown_set:
3aff : __ __ __ BSS	1
--------------------------------------------------------------------
letters:
3b00 : __ __ __ BYT 0e 11 13 15 19 11 0e 04 0c 04 04 04 04 0e 0e 11 : ................
3b10 : __ __ __ BYT 01 02 04 08 1f 1e 01 01 0e 01 01 1e 02 06 0a 12 : ................
3b20 : __ __ __ BYT 1f 02 02 1f 10 10 1e 01 01 1e 0e 10 10 1e 11 11 : ................
3b30 : __ __ __ BYT 0e 1f 01 02 04 08 08 08 0e 11 11 0e 11 11 0e 0e : ................
3b40 : __ __ __ BYT 11 11 0f 01 01 0e 0e 11 11 1f 11 11 11 1e 11 11 : ................
3b50 : __ __ __ BYT 1e 11 11 1e 0e 11 10 10 10 11 0e 1e 11 11 11 11 : ................
3b60 : __ __ __ BYT 11 1e 1f 10 10 1e 10 10 1f 1f 10 10 1e 10 10 10 : ................
3b70 : __ __ __ BYT 0e 11 10 17 11 11 0f 11 11 11 1f 11 11 11 0e 04 : ................
3b80 : __ __ __ BYT 04 04 04 04 0e 07 02 02 02 02 12 0c 11 12 14 18 : ................
3b90 : __ __ __ BYT 14 12 11 10 10 10 10 10 10 1f 11 1b 15 15 11 11 : ................
3ba0 : __ __ __ BYT 11 11 19 15 13 11 11 11 0e 11 11 11 11 11 0e 1e : ................
3bb0 : __ __ __ BYT 11 11 1e 10 10 10 0e 11 11 11 15 12 0d 1e 11 11 : ................
3bc0 : __ __ __ BYT 1e 14 12 11 0f 10 10 0e 01 01 1e 1f 04 04 04 04 : ................
3bd0 : __ __ __ BYT 04 04 11 11 11 11 11 11 0e 11 11 11 11 11 0a 04 : ................
3be0 : __ __ __ BYT 11 11 11 15 15 15 0a 11 11 0a 04 0a 11 11 11 11 : ................
3bf0 : __ __ __ BYT 0a 04 04 04 04 1f 01 02 04 08 10 1f             : ............
--------------------------------------------------------------------
bird_set:
3bfc : __ __ __ BSS	1
--------------------------------------------------------------------
panel_y:
3bfd : __ __ __ BSS	1
--------------------------------------------------------------------
flash:
3bfe : __ __ __ BSS	1
--------------------------------------------------------------------
flip:
3bff : __ __ __ BSS	1
--------------------------------------------------------------------
bird_art:
3c00 : __ __ __ BYT 00 1f ff fc 00 01 ff ff fe 00 0c 07 ff f1 00 30 : ...............0
3c10 : __ __ __ BYT 01 ff f1 00 70 01 ff ff 00 fc 07 ff fe 00 ff ff : ....p...........
3c20 : __ __ __ BYT ff 00 fe ff ff ff ff ff 7f ff ff fe 00 3f ff ff : .............?..
3c30 : __ __ __ BYT fc fc 0f ff ff f0 f0 00 ff ff 00 00 00 1f ff fc : ................
3c40 : __ __ __ BYT 00 01 ff ff fe 00 0f ff ff f1 00 3f ff ff f1 00 : ...........?....
3c50 : __ __ __ BYT 78 03 ff ff 00 e0 00 ff fe 00 e0 00 ff 00 fe f8 : x...............
3c60 : __ __ __ BYT 03 ff ff ff 7f ff ff fe 00 3f ff ff fc fc 0f ff : .........?......
3c70 : __ __ __ BYT ff f0 f0 00 ff ff 00 00 00 1f ff fc 00 01 ff ff : ................
3c80 : __ __ __ BYT fe 00 0f ff ff f1 00 3f ff ff f1 00 7f ff ff ff : .......?........
3c90 : __ __ __ BYT 00 ff ff ff fe 00 f8 03 ff 00 fe e0 00 ff ff ff : ................
3ca0 : __ __ __ BYT 60 00 ff fe 00 30 01 ff fc fc 0c 07 ff f0 f0 00 : `....0..........
3cb0 : __ __ __ BYT 1f ff 00 00                                     : ....
--------------------------------------------------------------------
saved_regs:
3cb4 : __ __ __ BSS	37
--------------------------------------------------------------------
saved_font:
3cd9 : __ __ __ BSS	3840
--------------------------------------------------------------------
shapes:
4bd9 : __ __ __ BSS	1920
--------------------------------------------------------------------
row_addr:
5359 : __ __ __ BSS	50
--------------------------------------------------------------------
pipes:
538b : __ __ __ BSS	16
--------------------------------------------------------------------
screen:
539b : __ __ __ BSS	2000
--------------------------------------------------------------------
attr:
5b6b : __ __ __ BSS	2000
--------------------------------------------------------------------
marked:
633b : __ __ __ BSS	2000
--------------------------------------------------------------------
page:
6b0b : __ __ __ BSS	1
--------------------------------------------------------------------
dirty:
6b0c : __ __ __ BSS	4000
--------------------------------------------------------------------
line:
7aac : __ __ __ BSS	11
--------------------------------------------------------------------
blank_overruns:
7ab7 : __ __ __ BSS	2
--------------------------------------------------------------------
previous_keys:
7ab9 : __ __ __ BSS	1
--------------------------------------------------------------------
stepped:
7aba : __ __ __ BSS	1
--------------------------------------------------------------------
death_delay:
7abb : __ __ __ BSS	1
--------------------------------------------------------------------
freq:
7abc : __ __ __ BSS	6
--------------------------------------------------------------------
step:
7ac2 : __ __ __ BSS	6
--------------------------------------------------------------------
wave:
7ac8 : __ __ __ BSS	3
--------------------------------------------------------------------
jump_at:
7acb : __ __ __ BSS	3
--------------------------------------------------------------------
prerendered:
7ace : __ __ __ BSS	1
--------------------------------------------------------------------
jump_freq:
7acf : __ __ __ BSS	6
--------------------------------------------------------------------
max_dirty:
7ad5 : __ __ __ BSS	2
