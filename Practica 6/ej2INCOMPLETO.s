.data
tabla: .word cero, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve
CONTROL: .word32 0x10000
DATA: .word32 0x10008
solicitarNumero: .asciiz "Ingrese un numero entero\n"
carac0: .ascii "0"
carac9: .ascii "9"
cero: .asciiz "CERO"
uno: .asciiz "UNO"
dos: .asciiz "DOS"
tres: .asciiz "TRES"
cuatro: .asciiz "CUATRO"
cinco: .asciiz "CINCO"
seis: .asciiz "SEIS"
siete: .asciiz "SIETE"
ocho: .asciiz "OCHO"
nueve: .asciiz "NUEVE"

.code
lwu $a0, CONTROL($0)
lwu $a1, DATA($0)
jal ingreso
jal muestra
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

muestra: daddi $t1, $0, 8
dmulu $t0, $v0, $t1
ld $t2, tabla($t0)

sd $t2, 0($a1)
daddi $t3, $0, 4
sd $t3, 0($a0)
jr $ra