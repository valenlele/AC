.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
OP1: .double 2.5
OP2: .double 1.5
cero: .double 0.0

.code
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)

l.d f0, OP1($0)
l.d f1, OP2($0)
l.d f2, cero($0)

add.d f2, f0, f1

s.d f2, 0($s1)
daddi $s5, $0, 3
sd $s5, 0($s0) 
halt