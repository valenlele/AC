.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
solicitarNumero: .asciiz "Ingrese un numero entero\n"
carac9: .asciiz "9"
carac0: .asciiz "0"

.code
lwu $a0, CONTROL($0)
lwu $a1, DATA($0)
jal ingreso
dadd $a2, $0, $v0
jal ingreso
dadd $a3, $0, $v0
jal resultado

halt

ingreso: daddi $t0, $0, solicitarNumero
sd $t0, 0($a1)
daddi $t1, $0, 4
sd $t1, 0($a0)
daddi $t2, $0, 9
sd $t2, 0($a0)
lbu $v0, 0($a1)

lbu $t3, carac9($0)
daddi $t3, $t3, 1
slt $t4, $v0, $t3
beqz $t4, ingreso

lbu $t5, carac0($0)
slt $t4, $v0, $t5
bnez $t4, ingreso

daddi $v0, $v0, -48

jr $ra

resultado: dadd $t0, $a2, $a3
sd $t0, 0($a1)
daddi $t1, $0, 1
sd $t1, 0($a0)
jr $ra