.data
cadena1: .asciiz "termita"
cadena2: .asciiz "termo"
pos: .word 0

.code
daddi $a0, $0, cadena1
daddi $a1, $0, cadena2
jal compararCadenas
sd $v0, pos($0)
halt

compararCadenas: daddi $v0, $0, 1
loop: lbu $t0, 0($a0)
lbu $t1, 0($a1)

bne $t0, $t1, noIguales ; si no son iguales termino. ya tengo la posición donde no lo son en $v0
beqz $t0, identicas ; si estoy aca es porque son iguales. si uno es 0, ambos son 0, entonces termine las cadenas y son identicas

daddi $a0, $a0, 1
daddi $a1, $a1, 1
daddi $v0, $v0, 1
j loop

identicas: daddi $v0, $0, -1

noIguales: jr $ra