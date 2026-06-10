.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
solicitarBase: .asciiz "Ingrese una base en PF\n"
solicitarExp: .asciiz "Ingrese un exponente entero\n"
valor1: .double 1.0

.code
lwu $a0, CONTROL($0)
lwu $a1, DATA($0)

; imprimir mensaje de solicitud de base en PF
daddi $s0, $0, solicitarBase
sd $s0, 0($a1)
daddi $s1, $0, 4
sd $s1, 0($a0)

; ingreso de base en PF
daddi $s1, $0, 8
sd $s1, 0($a0)
l.d f0, 0($a1)

; imprimir mensaje de solicitud de exp entero
daddi $s0, $0, solicitarExp
sd $s0, 0($a1)
daddi $s1, $0, 4
sd $s1, 0($a0)

; ingreso exp entero
daddi $s1, $0, 8
sd $s1, 0($a0)
ld $a2, 0($a1)

jal a_la_potencia

; imprimir resultado
s.d f1, 0($a1)
daddi $s1, $0, 3
sd $s1, 0($a0) 

halt

a_la_potencia: l.d f1, valor1($0)

loop: slti $t0, $a2, 1
bnez $t0, terminar
daddi $a2, $a2, -1
mul.d f1, f1, f0
j loop
terminar: jr $ra