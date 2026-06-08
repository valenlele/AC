.data
CONTROL: .word32 0x10000
DATA:    .word32 0x10008
num:     .word 5

.code
lwu $s0, CONTROL($0) ; puntero a CONTROL
lwu $s1, DATA($0)    ; puntero a DATA

ld $s2, num($0)
sd $s2, 0($s1)
daddi $s2, $0, 1
sd $s2, 0($s0)
halt