BITS 32

%macro PRINT 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

%macro NEWLINE 0
    PRINT newline, 1
%endmacro

%macro ASK_TEXT 3
    PRINT %1, %2
    mov ecx, %3
    call read_line
%endmacro

%macro ASK_UNIT 2
    PRINT %1, %2
    mov ecx, input_buffer
    call read_line
    call atoi
%endmacro

section .data
    title db 10, "SOLAR STUDENT TUITION SYSTEM", 10
    title_len equ $ - title
    info_title db 10, "ENTER STUDENT INFORMATION", 10
    info_title_len equ $ - info_title

    status_p db "Enrollment Status: ", 0
    status_p_len equ $ - status_p
    student_p db "Student Number: ", 0
    student_p_len equ $ - student_p
    name_p db "Name: ", 0
    name_p_len equ $ - name_p
    phone_p db "Phone: ", 0
    phone_p_len equ $ - phone_p
    zip_p db "Zip Code: ", 0
    zip_p_len equ $ - zip_p
    class_p db "Classification: ", 0
    class_p_len equ $ - class_p
    college_p db "College: ", 0
    college_p_len equ $ - college_p
    program_p db "Program: ", 0
    program_p_len equ $ - program_p
    year_p db "Year Level: ", 0
    year_p_len equ $ - year_p
    section_p db "Section: ", 0
    section_p_len equ $ - section_p
    address_p db "Address: ", 0
    address_p_len equ $ - address_p

    course_header db 10, "Courses                 Title                              Section   Units   Day       Time                         Room", 10
    course_header_len equ $ - course_header
    row1 db "CCS0021                 INFORMATION MANAGEMENT (LEC)       TN24      ", 0
    row1_len equ $ - row1
    row2 db "CCS0021L                INFORMATION MANAGEMENT (LAB)       TN24      ", 0
    row2_len equ $ - row2
    row3 db "CS0001                  DISCRETE STRUCTURES 1              TN24      ", 0
    row3_len equ $ - row3
    row4 db "CS0003                  COMPUTER SYSTEMS & ARCHITECTURE    TN24      ", 0
    row4_len equ $ - row4
    row5 db "CS0003L                 COMPUTER SYSTEMS & ARCHITECTURE LAB TN24      ", 0
    row5_len equ $ - row5
    row6 db "CS0070                  OBJECT ORIENTED PROGRAMMING        TN24      ", 0
    row6_len equ $ - row6
    row7 db "CS0070L                 OBJECT ORIENTED PROGRAMMING-LAB    TN24      ", 0
    row7_len equ $ - row7
    row8 db "GED0021                 SPECIALIZED ENGLISH PROGRAM 2      TN24      ", 0
    row8_len equ $ - row8
    row9 db "GED0055                 MATHEMATICAL ANALYSIS              M551      ", 0
    row9_len equ $ - row9
    row10 db "GED0081                 COLLEGE PHYSICS 1 LECTURE          TN24      ", 0
    row10_len equ $ - row10
    row11 db "GED0081L                COLLEGE PHYSICS 1 LABORATORY       TN24      ", 0
    row11_len equ $ - row11
    row_suffix1 db "  T         16:00-18:40                 ONLINE", 10
    row_suffix1_len equ $ - row_suffix1
    row_suffix2 db "  F         16:00-18:50                 ONLINE", 10
    row_suffix2_len equ $ - row_suffix2
    row_suffix3 db "  S/W       15:00-16:50                 F710/F710", 10
    row_suffix3_len equ $ - row_suffix3
    row_suffix4 db "  F         10:00-12:40                 ONLINE", 10
    row_suffix4_len equ $ - row_suffix4
    row_suffix5 db "  TH        10:00-12:50                 E610", 10
    row_suffix5_len equ $ - row_suffix5
    row_suffix6 db "  F         07:00-09:40                 ONLINE", 10
    row_suffix6_len equ $ - row_suffix6
    row_suffix7 db "  TH        07:00-09:50                 E609", 10
    row_suffix7_len equ $ - row_suffix7
    row_suffix8 db "  S/W       11:00-12:50                 F607/F607", 10
    row_suffix8_len equ $ - row_suffix8
    row_suffix9 db "  M/TH      13:00-14:50                 F504/F504", 10
    row_suffix9_len equ $ - row_suffix9
    row_suffix10 db "  T         07:00-09:40                 ONLINE", 10
    row_suffix10_len equ $ - row_suffix10
    row_suffix11 db "  S         07:00-09:50                 F1003", 10
    row_suffix11_len equ $ - row_suffix11
    total_units_label db "TOTAL UNITS: ", 0
    total_units_label_len equ $ - total_units_label

    assessment_header db 10, "Assessment", 32 dup(' '), "Amount", 10
    assessment_header_len equ $ - assessment_header
    assessment_tuition db "Tuition Fee (", 0
    assessment_tuition_len equ $ - assessment_tuition
    assessment_tuition_suffix db " units)", 24 dup(' '), 0
    assessment_tuition_suffix_len equ $ - assessment_tuition_suffix
    assessment_misc db "Miscellaneous Fee", 32 dup(' '), "12,305.00", 10
    assessment_misc_len equ $ - assessment_misc
    assessment_id db "ID Validation Fee", 34 dup(' '), "80.00", 10
    assessment_id_len equ $ - assessment_id
    assessment_lab db "Laboratory Fees", 34 dup(' '), 0
    assessment_lab_len equ $ - assessment_lab
    assessment_total db "TOTAL ASSESSMENT", 33 dup(' '), 0
    assessment_total_len equ $ - assessment_total

    units_title db 10, "ENTER UNITS PER SUBJECT", 10
    units_title_len equ $ - units_title
    u1p db "CCS0021 - Information Management: ", 0
    u1p_len equ $ - u1p
    u2p db "CCS0021L - Information Management Lab: ", 0
    u2p_len equ $ - u2p
    u3p db "CS0001 - Discrete Structures 1: ", 0
    u3p_len equ $ - u3p
    u4p db "CS0003 - Computer Systems & Architecture: ", 0
    u4p_len equ $ - u4p
    u5p db "CS0003L - Computer Systems & Architecture Lab: ", 0
    u5p_len equ $ - u5p
    u6p db "CS0070 - Object Oriented Programming: ", 0
    u6p_len equ $ - u6p
    u7p db "CS0070L - Object Oriented Programming Lab: ", 0
    u7p_len equ $ - u7p
    u8p db "GED0021 - Specialized English Program 2: ", 0
    u8p_len equ $ - u8p
    u9p db "GED0055 - Mathematical Analysis: ", 0
    u9p_len equ $ - u9p
    u10p db "GED0081 - College Physics 1 Lecture: ", 0
    u10p_len equ $ - u10p
    u11p db "GED0081L - College Physics 1 Laboratory: ", 0
    u11p_len equ $ - u11p

    output_title db 10, "STUDENT INFORMATION", 10
    output_title_len equ $ - output_title
    subjects_title db 10, "SUBJECT UNITS", 10
    subjects_title_len equ $ - subjects_title
    total_units_msg db "Total units: ", 0
    total_units_msg_len equ $ - total_units_msg
    tuition_msg db "Tuition fee (P1000 per unit): P ", 0
    tuition_msg_len equ $ - tuition_msg
    lab_msg db "Laboratory fee (P2500 per lab unit): P ", 0
    lab_msg_len equ $ - lab_msg
    total_msg db "TOTAL AMOUNT: P ", 0
    total_msg_len equ $ - total_msg
    newline db 10

section .bss
    input_buffer resb 80
    output_buffer resb 16
    status resb 80
    student_no resb 80
    student_name resb 80
    phone resb 80
    zip_code resb 80
    classification resb 80
    college resb 80
    program resb 80
    year_level resb 80
    section_name resb 80
    address resb 80
    units resd 11
    total_units resd 1
    tuition_fee resd 1
    lab_fee resd 1
    total_amount resd 1

section .text
    global _start

_start:
    PRINT title, title_len
    PRINT info_title, info_title_len
    ASK_TEXT status_p, status_p_len, status
    ASK_TEXT student_p, student_p_len, student_no
    ASK_TEXT name_p, name_p_len, student_name
    ASK_TEXT phone_p, phone_p_len, phone
    ASK_TEXT zip_p, zip_p_len, zip_code
    ASK_TEXT class_p, class_p_len, classification
    ASK_TEXT college_p, college_p_len, college
    ASK_TEXT program_p, program_p_len, program
    ASK_TEXT year_p, year_p_len, year_level
    ASK_TEXT section_p, section_p_len, section_name
    ASK_TEXT address_p, address_p_len, address

    PRINT units_title, units_title_len
    ASK_UNIT u1p, u1p_len
    mov [units], eax
    ASK_UNIT u2p, u2p_len
    mov [units + 4], eax
    ASK_UNIT u3p, u3p_len
    mov [units + 8], eax
    ASK_UNIT u4p, u4p_len
    mov [units + 12], eax
    ASK_UNIT u5p, u5p_len
    mov [units + 16], eax
    ASK_UNIT u6p, u6p_len
    mov [units + 20], eax
    ASK_UNIT u7p, u7p_len
    mov [units + 24], eax
    ASK_UNIT u8p, u8p_len
    mov [units + 28], eax
    ASK_UNIT u9p, u9p_len
    mov [units + 32], eax
    ASK_UNIT u10p, u10p_len
    mov [units + 36], eax
    ASK_UNIT u11p, u11p_len
    mov [units + 40], eax

    call calculate_fees
    call display_information
    call display_subject_units

    PRINT assessment_header, assessment_header_len
    PRINT assessment_tuition, assessment_tuition_len
    mov eax, [total_units]
    call print_uint
    PRINT assessment_tuition_suffix, assessment_tuition_suffix_len
    mov eax, [tuition_fee]
    call print_uint
    NEWLINE
    PRINT assessment_misc, assessment_misc_len
    PRINT assessment_id, assessment_id_len
    PRINT assessment_lab, assessment_lab_len
    mov eax, [lab_fee]
    call print_uint
    NEWLINE
    PRINT assessment_total, assessment_total_len
    mov eax, [total_amount]
    call print_uint
    NEWLINE

    mov eax, 1
    xor ebx, ebx
    int 0x80

calculate_fees:
    xor eax, eax
    mov ecx, 11
    mov esi, units
.sum_units:
    add eax, [esi]
    add esi, 4
    loop .sum_units
    mov [total_units], eax
    mov ebx, 1000
    mul ebx
    mov [tuition_fee], eax
    mov eax, [units + 4]
    add eax, [units + 16]
    add eax, [units + 24]
    add eax, [units + 40]
    mov ebx, 2500
    mul ebx
    mov [lab_fee], eax
    add eax, [tuition_fee]
    mov [total_amount], eax
    ret

display_information:
    PRINT output_title, output_title_len
    PRINT status_p, status_p_len
    PRINT status, 80
    PRINT student_p, student_p_len
    PRINT student_no, 80
    PRINT name_p, name_p_len
    PRINT student_name, 80
    PRINT phone_p, phone_p_len
    PRINT phone, 80
    PRINT zip_p, zip_p_len
    PRINT zip_code, 80
    PRINT class_p, class_p_len
    PRINT classification, 80
    PRINT college_p, college_p_len
    PRINT college, 80
    PRINT program_p, program_p_len
    PRINT program, 80
    PRINT year_p, year_p_len
    PRINT year_level, 80
    PRINT section_p, section_p_len
    PRINT section_name, 80
    PRINT address_p, address_p_len
    PRINT address, 80
    ret

display_subject_units:
    PRINT course_header, course_header_len
    PRINT row1, row1_len
    mov eax, [units]
    call print_uint
    PRINT row_suffix1, row_suffix1_len
    PRINT row2, row2_len
    mov eax, [units + 4]
    call print_uint
    PRINT row_suffix2, row_suffix2_len
    PRINT row3, row3_len
    mov eax, [units + 8]
    call print_uint
    PRINT row_suffix3, row_suffix3_len
    PRINT row4, row4_len
    mov eax, [units + 12]
    call print_uint
    PRINT row_suffix4, row_suffix4_len
    PRINT row5, row5_len
    mov eax, [units + 16]
    call print_uint
    PRINT row_suffix5, row_suffix5_len
    PRINT row6, row6_len
    mov eax, [units + 20]
    call print_uint
    PRINT row_suffix6, row_suffix6_len
    PRINT row7, row7_len
    mov eax, [units + 24]
    call print_uint
    PRINT row_suffix7, row_suffix7_len
    PRINT row8, row8_len
    mov eax, [units + 28]
    call print_uint
    PRINT row_suffix8, row_suffix8_len
    PRINT row9, row9_len
    mov eax, [units + 32]
    call print_uint
    PRINT row_suffix9, row_suffix9_len
    PRINT row10, row10_len
    mov eax, [units + 36]
    call print_uint
    PRINT row_suffix10, row_suffix10_len
    PRINT row11, row11_len
    mov eax, [units + 40]
    call print_uint
    PRINT row_suffix11, row_suffix11_len
    PRINT total_units_label, total_units_label_len
    mov eax, [total_units]
    call print_uint
    NEWLINE
    ret

read_line:
    mov eax, 3
    mov ebx, 0
    mov edx, 80
    int 0x80
    ret

atoi:
    mov esi, input_buffer
    xor eax, eax
    xor ebx, ebx
.convert:
    mov bl, [esi]
    cmp bl, 10
    je .done
    cmp bl, 13
    je .done
    cmp bl, 0
    je .done
    sub bl, '0'
    imul eax, 10
    add eax, ebx
    inc esi
    jmp .convert
.done:
    ret

print_uint:
    mov edi, output_buffer + 15
    mov byte [edi], 0
    mov ebx, 10
.convert:
    xor edx, edx
    div ebx
    add dl, '0'
    dec edi
    mov [edi], dl
    test eax, eax
    jnz .convert
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, output_buffer + 15
    sub edx, edi
    int 0x80
    ret
