global _start

section .data

    ; ANSI cursor-control sequences
    clear_screen db 27, "[2J", 27, "[3J", 27, "[H"
    clear_screen_len equ $ - clear_screen

    cursor_prefix db 27, "["
    cursor_prefix_len equ $ - cursor_prefix

    semicolon db ";"
    semicolon_len equ $ - semicolon

    cursor_home db "H"
    cursor_home_len equ $ - cursor_home

    newline db 10

    ; Page positioning constants
    PAGE_RIGHT equ 72
    LEFT_BOX_RIGHT equ 36
    RIGHT_BOX_LEFT equ 37
    HALF_BOX_WIDTH equ 36

    ; ------------------------------------------------------------------------
    ; Questions
    ; ------------------------------------------------------------------------
    input_title db "ABOUT ME SLAMBOOK - ENTER YOUR INFORMATION"
    input_title_len equ $ - input_title

    input_instruction db "Type an answer after each question and press ENTER."
    input_instruction_len equ $ - input_instruction

    p_name db "Name: "
    p_name_len equ $ - p_name

    p_email db "School Email: "
    p_email_len equ $ - p_email

    p_course db "Course: "
    p_course_len equ $ - p_course

    p_age db "Age: "
    p_age_len equ $ - p_age

    p_happy db "First time I felt completely happy: "
    p_happy_len equ $ - p_happy

    p_achievement db "First big achievement: "
    p_achievement_len equ $ - p_achievement

    p_risk db "First risk I ever took: "
    p_risk_len equ $ - p_risk

    p_colors db "Favorite colors: "
    p_colors_len equ $ - p_colors

    p_song db "Favorite song: "
    p_song_len equ $ - p_song

    p_singer db "Favorite singer: "
    p_singer_len equ $ - p_singer

    p_food db "Favorite food: "
    p_food_len equ $ - p_food

    p_weekend db "Favorite thing to do on a weekend: "
    p_weekend_len equ $ - p_weekend

    p_hobbies db "Hobbies: "
    p_hobbies_len equ $ - p_hobbies

    p_ambition db "Ambition: "
    p_ambition_len equ $ - p_ambition

    p_motto db "Motto: "
    p_motto_len equ $ - p_motto

    ready_message db "Your answers are ready. Press ENTER to view your slambook."
    ready_message_len equ $ - ready_message

    ; ------------------------------------------------------------------------
    ; Display labels
    ; ------------------------------------------------------------------------
    about_title db "[ ABOUT ME ]"
    about_title_len equ $ - about_title

    name_label db "Name:"
    name_label_len equ $ - name_label

    email_label db "School Email:"
    email_label_len equ $ - email_label

    course_label db "Course:"
    course_label_len equ $ - course_label

    age_label db "Age:"
    age_label_len equ $ - age_label

    firsts_title db "MY FIRSTS"
    firsts_title_len equ $ - firsts_title

    happy_label db "First time I felt completely happy:"
    happy_label_len equ $ - happy_label

    achievement_label db "First big achievement:"
    achievement_label_len equ $ - achievement_label

    risk_label db "First risk I ever took:"
    risk_label_len equ $ - risk_label

    favorites_title db "FAVORITES"
    favorites_title_len equ $ - favorites_title

    colors_label db "Colors:"
    colors_label_len equ $ - colors_label

    song_label db "Song:"
    song_label_len equ $ - song_label

    singer_label db "Singer:"
    singer_label_len equ $ - singer_label

    food_label db "Food:"
    food_label_len equ $ - food_label

    weekend_label db "Weekend:"
    weekend_label_len equ $ - weekend_label

    hobbies_label db "Hobbies:"
    hobbies_label_len equ $ - hobbies_label

    ambition_title db "AMBITION"
    ambition_title_len equ $ - ambition_title

    ambition_label db "Ambition:"
    ambition_label_len equ $ - ambition_label

    motto_label db "Motto:"
    motto_label_len equ $ - motto_label

    footer db "********************  MY SLAMBOOK  ********************"
    footer_len equ $ - footer

    ; ------------------------------------------------------------------------
    ; ASCII art header
    ; ------------------------------------------------------------------------
    header1 db " AAAAA  BBBB   OOO   U   U TTTTT    M   M  EEEEE"
    header1_len equ $ - header1

    header2 db " A   A  B   B O   O  U   U   T      MM MM  E"
    header2_len equ $ - header2

    header3 db " AAAAA  BBBB  O   O  U   U   T      M M M  EEEE"
    header3_len equ $ - header3

    header4 db " A   A  B   B O   O  U   U   T      M   M  E"
    header4_len equ $ - header4

    header5 db " A   A  BBBB   OOO   UUUUU   T      M   M  EEEEE"
    header5_len equ $ - header5

    cat1 db " /\\_/\\ "
    cat1_len equ $ - cat1

    cat2 db "( o   o )"
    cat2_len equ $ - cat2

    cat3 db " >  ^  < "
    cat3_len equ $ - cat3

    cat4 db "  /|_|\\  "
    cat4_len equ $ - cat4

    flower1 db "  .-.  "
    flower1_len equ $ - flower1

    flower2 db " (o o) "
    flower2_len equ $ - flower2

    flower3 db "  |=|  "
    flower3_len equ $ - flower3

    heart1 db " /\\_/\\ "
    heart1_len equ $ - heart1

    heart2 db "(  o o  )"
    heart2_len equ $ - heart2

    pencil_art db " /====> "
    pencil_art_len equ $ - pencil_art

    tiny_heart db "@@"
    tiny_heart_len equ $ - tiny_heart

    divider_art db "~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
    divider_art_len equ $ - divider_art

    box_corner db "#"
    box_corner_len equ $ - box_corner

    box_junction db "@"
    box_junction_len equ $ - box_junction

    cd_art db "C---D"
    cd_art_len equ $ - cd_art

    ; ------------------------------------------------------------------------
    ; Input buffers
    ; ------------------------------------------------------------------------
    name_buf times 80 db 0
    email_buf times 80 db 0
    course_buf times 80 db 0
    age_buf times 16 db 0

    happy_buf times 100 db 0
    achievement_buf times 100 db 0
    risk_buf times 100 db 0

    colors_buf times 80 db 0
    song_buf times 80 db 0
    singer_buf times 80 db 0
    food_buf times 80 db 0
    weekend_buf times 100 db 0
    hobbies_buf times 100 db 0

    ambition_buf times 100 db 0
    motto_buf times 100 db 0
    wait_buf times 8 db 0

    number_buffer times 12 db 0
    hline_buffer times 100 db 0
    one_char db 0


section .text

; ----------------------------------------------------------------------------
; print_at(row, column, address, length)
; ----------------------------------------------------------------------------

print_at:
    push ebp
    mov ebp, esp
    push ebx

    push dword [ebp + 12]
    push dword [ebp + 8]
    call goto_xy
    add esp, 8

    mov eax, 4
    mov ebx, 1
    mov ecx, [ebp + 16]
    mov edx, [ebp + 20]
    int 0x80

    pop ebx
    leave
    ret


; ----------------------------------------------------------------------------
; print_cstr_at(row, column, address)
; ----------------------------------------------------------------------------

print_cstr_at:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 16]
    call strlen

    push eax
    push dword [ebp + 16]
    push dword [ebp + 12]
    push dword [ebp + 8]
    call print_at
    add esp, 16

    pop ebx
    leave
    ret


; ----------------------------------------------------------------------------
; print_cstr_n_at(row, column, address, maximum_length)
; Prevents long input from overwriting borders.
; ----------------------------------------------------------------------------

print_cstr_n_at:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov esi, [ebp + 16]
    mov edi, [ebp + 20]
    xor ecx, ecx

.count:
    cmp ecx, edi
    jae .print

    cmp byte [esi + ecx], 0
    je .print

    inc ecx
    jmp .count

.print:
    push ecx
    push dword [ebp + 16]
    push dword [ebp + 12]
    push dword [ebp + 8]
    call print_at
    add esp, 16

    pop edi
    pop esi
    pop ebx
    leave
    ret


; ----------------------------------------------------------------------------
; strlen
; ----------------------------------------------------------------------------

strlen:
    push edi
    mov edi, eax
    xor eax, eax

.count:
    cmp byte [edi + eax], 0
    je .finished
    inc eax
    jmp .count

.finished:
    pop edi
    ret


; ----------------------------------------------------------------------------
; read_input(buffer, maximum_bytes)
; ----------------------------------------------------------------------------

read_input:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov eax, 3
    mov ebx, 0
    mov ecx, [ebp + 8]
    mov edx, [ebp + 12]
    int 0x80

    mov ecx, eax
    mov esi, [ebp + 8]

    test ecx, ecx
    jz .empty

.scan:
    cmp byte [esi], 10
    je .terminate

    cmp byte [esi], 13
    je .terminate

    inc esi
    loop .scan

    mov byte [esi], 0
    jmp .done

.terminate:
    mov byte [esi], 0
    jmp .done

.empty:
    mov byte [esi], 0

.done:
    pop esi
    pop ebx
    leave
    ret


; ----------------------------------------------------------------------------
; goto_xy(row, column)
; ----------------------------------------------------------------------------

goto_xy:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, 4
    mov ebx, 1
    mov ecx, cursor_prefix
    mov edx, cursor_prefix_len
    int 0x80

    mov eax, [ebp + 8]
    call print_uint

    mov eax, 4
    mov ebx, 1
    mov ecx, semicolon
    mov edx, semicolon_len
    int 0x80

    mov eax, [ebp + 12]
    call print_uint

    mov eax, 4
    mov ebx, 1
    mov ecx, cursor_home
    mov edx, cursor_home_len
    int 0x80

    pop ebx
    leave
    ret


; ----------------------------------------------------------------------------
; print_uint
; ----------------------------------------------------------------------------

print_uint:
    push ebx
    push ecx
    push edx
    push esi

    mov esi, number_buffer + 12
    mov ebx, 10
    xor ecx, ecx

    test eax, eax
    jnz .convert

    dec esi
    mov byte [esi], '0'
    inc ecx
    jmp .write

.convert:
    xor edx, edx
    div ebx
    add dl, '0'
    dec esi
    mov [esi], dl
    inc ecx
    test eax, eax
    jnz .convert

.write:
    mov eax, 4
    mov ebx, 1
    mov edx, ecx
    mov ecx, esi
    int 0x80

    pop esi
    pop edx
    pop ecx
    pop ebx
    ret


; ----------------------------------------------------------------------------
; draw_hline(row, column, count, character)
; ----------------------------------------------------------------------------

draw_hline:
    push ebp
    mov ebp, esp
    push ebx
    push edi

    push dword [ebp + 12]
    push dword [ebp + 8]
    call goto_xy
    add esp, 8

    mov edi, hline_buffer
    mov ecx, [ebp + 16]
    mov al, byte [ebp + 20]
    cld
    rep stosb

    mov eax, 4
    mov ebx, 1
    mov ecx, hline_buffer
    mov edx, [ebp + 16]
    int 0x80

    pop edi
    pop ebx
    leave
    ret


; ----------------------------------------------------------------------------
; draw_vline(first_row, last_row, column, character)
; ----------------------------------------------------------------------------

draw_vline:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov esi, [ebp + 8]
    mov edi, [ebp + 12]

.next_row:
    cmp esi, edi
    jg .done

    push dword [ebp + 16]
    push esi
    call goto_xy
    add esp, 8

    mov al, byte [ebp + 20]
    mov [one_char], al

    mov eax, 4
    mov ebx, 1
    mov ecx, one_char
    mov edx, 1
    int 0x80

    inc esi
    jmp .next_row

.done:
    pop edi
    pop esi
    pop ebx
    leave
    ret


; ----------------------------------------------------------------------------
; Macros
; ----------------------------------------------------------------------------

%macro PRINT_AT 4
    push dword %4
    push dword %3
    push dword %2
    push dword %1
    call print_at
    add esp, 16
%endmacro

%macro PRINT_CSTR_AT 3
    push dword %3
    push dword %2
    push dword %1
    call print_cstr_at
    add esp, 12
%endmacro

%macro PRINT_CSTR_N_AT 4
    push dword %4
    push dword %3
    push dword %2
    push dword %1
    call print_cstr_n_at
    add esp, 16
%endmacro

%macro HLINE 4
    push dword %4
    push dword %3
    push dword %2
    push dword %1
    call draw_hline
    add esp, 16
%endmacro

%macro VLINE 4
    push dword %4
    push dword %3
    push dword %2
    push dword %1
    call draw_vline
    add esp, 16
%endmacro

%macro ASK 6
    PRINT_AT %1, %2, %3, %4
    push dword %6
    push dword %5
    call read_input
    add esp, 8
%endmacro


; ============================================================================
; PROGRAM START
; ============================================================================

_start:

    ; Clear screen and show instructions.
    mov eax, 4
    mov ebx, 1
    mov ecx, clear_screen
    mov edx, clear_screen_len
    int 0x80

    PRINT_AT 1, 5, input_title, input_title_len
    PRINT_AT 2, 5, input_instruction, input_instruction_len

    ; ABOUT ME questions
    ASK 4, 5, p_name, p_name_len, name_buf, 79
    ASK 6, 5, p_email, p_email_len, email_buf, 79
    ASK 8, 5, p_course, p_course_len, course_buf, 79
    ASK 10, 5, p_age, p_age_len, age_buf, 15

    ; MY FIRST questions
    ASK 13, 5, p_happy, p_happy_len, happy_buf, 99
    ASK 15, 5, p_achievement, p_achievement_len, achievement_buf, 99
    ASK 17, 5, p_risk, p_risk_len, risk_buf, 99

    ; FAVORITES and HOBBIES questions
    ASK 20, 5, p_colors, p_colors_len, colors_buf, 79
    ASK 22, 5, p_song, p_song_len, song_buf, 79
    ASK 24, 5, p_singer, p_singer_len, singer_buf, 79
    ASK 26, 5, p_food, p_food_len, food_buf, 79
    ASK 28, 5, p_weekend, p_weekend_len, weekend_buf, 99
    ASK 30, 5, p_hobbies, p_hobbies_len, hobbies_buf, 99

    ; AMBITION and MOTTO questions
    ASK 33, 5, p_ambition, p_ambition_len, ambition_buf, 99
    ASK 35, 5, p_motto, p_motto_len, motto_buf, 99

    ; Wait before displaying final page
    PRINT_AT 37, 5, ready_message, ready_message_len

    push dword 7
    push dword wait_buf
    call read_input
    add esp, 8

    ; ------------------------------------------------------------------------
    ; Display completed slambook
    ; ------------------------------------------------------------------------
    mov eax, 4
    mov ebx, 1
    mov ecx, clear_screen
    mov edx, clear_screen_len
    int 0x80

    ; ABOUT ME ASCII header
    PRINT_AT 1, 5, header1, header1_len
    PRINT_AT 2, 5, header2, header2_len
    PRINT_AT 3, 5, header3, header3_len
    PRINT_AT 4, 5, header4, header4_len
    PRINT_AT 5, 5, header5, header5_len

    ; Cat decoration
    PRINT_AT 1, 64, cat1, cat1_len
    PRINT_AT 2, 64, cat2, cat2_len
    PRINT_AT 3, 64, cat3, cat3_len
    PRINT_AT 4, 64, cat4, cat4_len
    PRINT_AT 6, 14, divider_art, divider_art_len

    ; ABOUT ME box
    HLINE 7, 1, PAGE_RIGHT, '-'
    HLINE 13, 1, PAGE_RIGHT, '-'
    VLINE 8, 12, 1, '|'
    VLINE 8, 12, PAGE_RIGHT, '|'

    PRINT_AT 7, 1, box_corner, box_corner_len
    PRINT_AT 7, PAGE_RIGHT, box_corner, box_corner_len
    PRINT_AT 13, 1, box_corner, box_corner_len
    PRINT_AT 13, PAGE_RIGHT, box_corner, box_corner_len

    PRINT_AT 8, 4, about_title, about_title_len

    PRINT_AT 9, 4, name_label, name_label_len
    PRINT_CSTR_N_AT 9, 12, name_buf, 30

    PRINT_AT 10, 4, email_label, email_label_len
    PRINT_CSTR_N_AT 10, 20, email_buf, 35

    PRINT_AT 11, 4, course_label, course_label_len
    PRINT_CSTR_N_AT 11, 13, course_buf, 25

    PRINT_AT 12, 4, age_label, age_label_len
    PRINT_CSTR_N_AT 12, 10, age_buf, 3
    PRINT_AT 10, 48, tiny_heart, tiny_heart_len

    ; MY FIRSTS box
    HLINE 15, 1, PAGE_RIGHT, '-'
    HLINE 20, 1, PAGE_RIGHT, '-'
    VLINE 16, 19, 1, '|'
    VLINE 16, 19, PAGE_RIGHT, '|'

    PRINT_AT 15, 1, box_corner, box_corner_len
    PRINT_AT 15, PAGE_RIGHT, box_corner, box_corner_len
    PRINT_AT 20, 1, box_corner, box_corner_len
    PRINT_AT 20, PAGE_RIGHT, box_corner, box_corner_len

    PRINT_AT 16, 4, firsts_title, firsts_title_len

    PRINT_AT 17, 4, achievement_label, achievement_label_len
    PRINT_CSTR_N_AT 17, 30, achievement_buf, 38

    PRINT_AT 18, 4, risk_label, risk_label_len
    PRINT_CSTR_N_AT 18, 29, risk_buf, 39

    PRINT_AT 19, 4, happy_label, happy_label_len
    PRINT_CSTR_N_AT 19, 43, happy_buf, 16

    PRINT_AT 17, 61, flower1, flower1_len
    PRINT_AT 18, 61, flower2, flower2_len
    PRINT_AT 19, 61, flower3, flower3_len

    ; FAVORITES and HOBBIES boxes
    HLINE 22, 1, HALF_BOX_WIDTH, '-'
    HLINE 22, RIGHT_BOX_LEFT, HALF_BOX_WIDTH, '-'
    HLINE 29, 1, HALF_BOX_WIDTH, '-'
    HLINE 29, RIGHT_BOX_LEFT, HALF_BOX_WIDTH, '-'

    VLINE 23, 28, 1, '|'
    VLINE 23, 28, LEFT_BOX_RIGHT, '|'
    VLINE 23, 28, RIGHT_BOX_LEFT, '|'
    VLINE 23, 28, PAGE_RIGHT, '|'

    PRINT_AT 22, 1, box_corner, box_corner_len
    PRINT_AT 22, LEFT_BOX_RIGHT, box_junction, box_junction_len
    PRINT_AT 22, RIGHT_BOX_LEFT, box_junction, box_junction_len
    PRINT_AT 22, PAGE_RIGHT, box_corner, box_corner_len

    PRINT_AT 29, 1, box_corner, box_corner_len
    PRINT_AT 29, LEFT_BOX_RIGHT, box_junction, box_junction_len
    PRINT_AT 29, RIGHT_BOX_LEFT, box_junction, box_junction_len
    PRINT_AT 29, PAGE_RIGHT, box_corner, box_corner_len

    PRINT_AT 23, 4, favorites_title, favorites_title_len
    PRINT_AT 23, 39, hobbies_label, hobbies_label_len

    PRINT_AT 24, 3, colors_label, colors_label_len
    PRINT_CSTR_N_AT 24, 12, colors_buf, 22

    PRINT_AT 25, 3, song_label, song_label_len
    PRINT_CSTR_N_AT 25, 10, song_buf, 25

    PRINT_AT 26, 3, singer_label, singer_label_len
    PRINT_CSTR_N_AT 26, 12, singer_buf, 22

    PRINT_AT 27, 3, food_label, food_label_len
    PRINT_CSTR_N_AT 27, 10, food_buf, 25

    PRINT_AT 24, 39, weekend_label, weekend_label_len
    PRINT_CSTR_N_AT 24, 57, weekend_buf, 13

    PRINT_AT 25, 39, hobbies_label, hobbies_label_len
    PRINT_CSTR_N_AT 25, 48, hobbies_buf, 21

    PRINT_AT 27, 51, heart1, heart1_len
    PRINT_AT 28, 50, heart2, heart2_len
    PRINT_AT 28, 64, cd_art, cd_art_len

    ; AMBITION and MOTTO box
    HLINE 31, 1, PAGE_RIGHT, '-'
    HLINE 36, 1, PAGE_RIGHT, '-'
    VLINE 32, 35, 1, '|'
    VLINE 32, 35, PAGE_RIGHT, '|'

    PRINT_AT 31, 1, box_corner, box_corner_len
    PRINT_AT 31, PAGE_RIGHT, box_corner, box_corner_len
    PRINT_AT 36, 1, box_corner, box_corner_len
    PRINT_AT 36, PAGE_RIGHT, box_corner, box_corner_len

    PRINT_AT 32, 4, ambition_title, ambition_title_len

    PRINT_AT 33, 4, ambition_label, ambition_label_len
    PRINT_CSTR_N_AT 33, 17, ambition_buf, 45

    PRINT_AT 34, 4, motto_label, motto_label_len
    PRINT_CSTR_N_AT 34, 12, motto_buf, 45

    PRINT_AT 32, 60, pencil_art, pencil_art_len

    ; Footer
    PRINT_AT 38, 5, footer, footer_len
    PRINT_AT 39, 1, newline, 1

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80