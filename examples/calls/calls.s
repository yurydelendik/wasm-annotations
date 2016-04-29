	.text
	.file	"calls.bc"
	.hidden	test2
	.globl	test2
	.type	test2,@function
test2:                                  # @test2
.Lfunc_begin0:
	.file	1 "calls.c"
	.loc	1 4 0                   # calls.c:4:0
	.param  	i32
	.result 	i32
	.local  	i32
# BB#0:                                 # %entry
	#DEBUG_VALUE: test2:j <- %vreg2
	i32.const	$1=, 0
	block
.Ltmp0:
	.loc	1 5 7 prologue_end      # calls.c:5:7
	i32.const	$push0=, 1
	i32.lt_s	$push1=, $0, $pop0
	br_if   	0, $pop1        # 0: down to label0
# BB#1:                                 # %if.then
.Ltmp1:
	.loc	1 6 12                  # calls.c:6:12
	i32.call	$1=, test@FUNCTION, $0
.Ltmp2:
.LBB0_2:                                # %return
	end_block                       # label0:
	.loc	1 8 1                   # calls.c:8:1
	return  	$1
.Ltmp3:
	.endfunc
.Lfunc_end0:
	.size	test2, .Lfunc_end0-test2

	.hidden	test3
	.globl	test3
	.type	test3,@function
test3:                                  # @test3
.Lfunc_begin1:
	.loc	1 11 0                  # calls.c:11:0
	.param  	i32
	.result 	i32
# BB#0:                                 # %entry
	#DEBUG_VALUE: test3:k <- %vreg3
	block
.Ltmp4:
	.loc	1 12 7 prologue_end     # calls.c:12:7
	i32.const	$push0=, -1
	i32.le_s	$push1=, $0, $pop0
	br_if   	0, $pop1        # 0: down to label1
# BB#1:                                 # %if.end
	.loc	1 15 10                 # calls.c:15:10
	i32.call	$0=, test2@FUNCTION, $0
	.loc	1 16 1                  # calls.c:16:1
	return  	$0
.LBB1_2:                                # %if.then
	end_block                       # label1:
.Ltmp5:
	.loc	1 13 18                 # calls.c:13:18
	i32.const	$push2=, 0
	i32.const	$push5=, 0
	i32.sub 	$push3=, $pop5, $0
	.loc	1 13 13 is_stmt 0       # calls.c:13:13
	i32.call	$push4=, test@FUNCTION, $pop3
	.loc	1 13 12                 # calls.c:13:12
	i32.sub 	$0=, $pop2, $pop4
.Ltmp6:
	.loc	1 16 1 is_stmt 1        # calls.c:16:1
	return  	$0
.Ltmp7:
	.endfunc
.Lfunc_end1:
	.size	test3, .Lfunc_end1-test3

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (trunk 266025)" # string offset=0
.Linfo_string1:
	.asciz	"calls.c"               # string offset=35
.Linfo_string2:
	.asciz	"/Users/yury/llvmwasm"  # string offset=43
.Linfo_string3:
	.asciz	"test2"                 # string offset=64
.Linfo_string4:
	.asciz	"int"                   # string offset=70
.Linfo_string5:
	.asciz	"test3"                 # string offset=74
.Linfo_string6:
	.asciz	"j"                     # string offset=80
.Linfo_string7:
	.asciz	"k"                     # string offset=82
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.int32	.Lfunc_begin0-.Lfunc_begin0
	.int32	.Lfunc_end0-.Lfunc_begin0
	.int16	1                       # Loc expr size
	.int8	150                     # nop (could not find a dwarf register number) DW_OP_nop
	.int32	0
	.int32	0
.Ldebug_loc1:
	.int32	.Lfunc_begin1-.Lfunc_begin0
	.int32	.Lfunc_end1-.Lfunc_begin0
	.int16	1                       # Loc expr size
	.int8	150                     # nop (could not find a dwarf register number) DW_OP_nop
	.int32	0
	.int32	0
	.section	.debug_abbrev,"",@progbits
.Lsection_abbrev:
	.int8	1                       # Abbreviation Code
	.int8	17                      # DW_TAG_compile_unit
	.int8	1                       # DW_CHILDREN_yes
	.int8	37                      # DW_AT_producer
	.int8	14                      # DW_FORM_strp
	.int8	19                      # DW_AT_language
	.int8	5                       # DW_FORM_data2
	.int8	3                       # DW_AT_name
	.int8	14                      # DW_FORM_strp
	.int8	16                      # DW_AT_stmt_list
	.int8	23                      # DW_FORM_sec_offset
	.int8	27                      # DW_AT_comp_dir
	.int8	14                      # DW_FORM_strp
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.int8	25                      # DW_FORM_flag_present
	.int8	17                      # DW_AT_low_pc
	.int8	1                       # DW_FORM_addr
	.int8	18                      # DW_AT_high_pc
	.int8	6                       # DW_FORM_data4
	.int8	0                       # EOM(1)
	.int8	0                       # EOM(2)
	.int8	2                       # Abbreviation Code
	.int8	46                      # DW_TAG_subprogram
	.int8	1                       # DW_CHILDREN_yes
	.int8	17                      # DW_AT_low_pc
	.int8	1                       # DW_FORM_addr
	.int8	18                      # DW_AT_high_pc
	.int8	6                       # DW_FORM_data4
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.int8	25                      # DW_FORM_flag_present
	.int8	64                      # DW_AT_frame_base
	.int8	24                      # DW_FORM_exprloc
	.int8	3                       # DW_AT_name
	.int8	14                      # DW_FORM_strp
	.int8	58                      # DW_AT_decl_file
	.int8	11                      # DW_FORM_data1
	.int8	59                      # DW_AT_decl_line
	.int8	11                      # DW_FORM_data1
	.int8	39                      # DW_AT_prototyped
	.int8	25                      # DW_FORM_flag_present
	.int8	73                      # DW_AT_type
	.int8	19                      # DW_FORM_ref4
	.int8	63                      # DW_AT_external
	.int8	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.int8	25                      # DW_FORM_flag_present
	.int8	0                       # EOM(1)
	.int8	0                       # EOM(2)
	.int8	3                       # Abbreviation Code
	.int8	5                       # DW_TAG_formal_parameter
	.int8	0                       # DW_CHILDREN_no
	.int8	2                       # DW_AT_location
	.int8	23                      # DW_FORM_sec_offset
	.int8	3                       # DW_AT_name
	.int8	14                      # DW_FORM_strp
	.int8	58                      # DW_AT_decl_file
	.int8	11                      # DW_FORM_data1
	.int8	59                      # DW_AT_decl_line
	.int8	11                      # DW_FORM_data1
	.int8	73                      # DW_AT_type
	.int8	19                      # DW_FORM_ref4
	.int8	0                       # EOM(1)
	.int8	0                       # EOM(2)
	.int8	4                       # Abbreviation Code
	.int8	36                      # DW_TAG_base_type
	.int8	0                       # DW_CHILDREN_no
	.int8	3                       # DW_AT_name
	.int8	14                      # DW_FORM_strp
	.int8	62                      # DW_AT_encoding
	.int8	11                      # DW_FORM_data1
	.int8	11                      # DW_AT_byte_size
	.int8	11                      # DW_FORM_data1
	.int8	0                       # EOM(1)
	.int8	0                       # EOM(2)
	.int8	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.int32	114                     # Length of Unit
	.int16	4                       # DWARF version number
	.int32	.Lsection_abbrev        # Offset Into Abbrev. Section
	.int8	4                       # Address Size (in bytes)
	.int8	1                       # Abbrev [1] 0xb:0x6b DW_TAG_compile_unit
	.int32	.Linfo_string0          # DW_AT_producer
	.int16	12                      # DW_AT_language
	.int32	.Linfo_string1          # DW_AT_name
	.int32	.Lline_table_start0     # DW_AT_stmt_list
	.int32	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.int32	.Lfunc_begin0           # DW_AT_low_pc
	.int32	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.int8	2                       # Abbrev [2] 0x26:0x24 DW_TAG_subprogram
	.int32	.Lfunc_begin0           # DW_AT_low_pc
	.int32	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.int8	0                       # DW_AT_frame_base
	.int32	.Linfo_string3          # DW_AT_name
	.int8	1                       # DW_AT_decl_file
	.int8	3                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.int32	110                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.int8	3                       # Abbrev [3] 0x3a:0xf DW_TAG_formal_parameter
	.int32	.Ldebug_loc0            # DW_AT_location
	.int32	.Linfo_string6          # DW_AT_name
	.int8	1                       # DW_AT_decl_file
	.int8	3                       # DW_AT_decl_line
	.int32	110                     # DW_AT_type
	.int8	0                       # End Of Children Mark
	.int8	2                       # Abbrev [2] 0x4a:0x24 DW_TAG_subprogram
	.int32	.Lfunc_begin1           # DW_AT_low_pc
	.int32	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.int8	0                       # DW_AT_frame_base
	.int32	.Linfo_string5          # DW_AT_name
	.int8	1                       # DW_AT_decl_file
	.int8	10                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.int32	110                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.int8	3                       # Abbrev [3] 0x5e:0xf DW_TAG_formal_parameter
	.int32	.Ldebug_loc1            # DW_AT_location
	.int32	.Linfo_string7          # DW_AT_name
	.int8	1                       # DW_AT_decl_file
	.int8	10                      # DW_AT_decl_line
	.int32	110                     # DW_AT_type
	.int8	0                       # End Of Children Mark
	.int8	4                       # Abbrev [4] 0x6e:0x7 DW_TAG_base_type
	.int32	.Linfo_string4          # DW_AT_name
	.int8	5                       # DW_AT_encoding
	.int8	4                       # DW_AT_byte_size
	.int8	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
	.section	.debug_macinfo,"",@progbits
.Ldebug_macinfo:
.Lcu_macro_begin0:
	.int8	0                       # End Of Macro List Mark
	.section	.debug_pubnames,"",@progbits
	.int32	.LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
.LpubNames_begin0:
	.int16	2                       # DWARF Version
	.int32	.Lcu_begin0             # Offset of Compilation Unit Info
	.int32	118                     # Compilation Unit Length
	.int32	38                      # DIE offset
	.asciz	"test2"                 # External Name
	.int32	74                      # DIE offset
	.asciz	"test3"                 # External Name
	.int32	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.int32	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.int16	2                       # DWARF Version
	.int32	.Lcu_begin0             # Offset of Compilation Unit Info
	.int32	118                     # Compilation Unit Length
	.int32	110                     # DIE offset
	.asciz	"int"                   # External Name
	.int32	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (trunk 266025)"
	.section	.debug_line,"",@progbits
.Lline_table_start0:
