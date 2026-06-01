        .data
cadena: .asciiz "adbdcdedfdgdhdid"
car:    .asciiz "d"
cant:   .word 0

        .code
        dadd r2, r0, r0 ; offset
        dadd r3, r0, r0 ; contador
        lbu r4, car(r0)

loop:   lbu r1, cadena(r2)
        beqz r1, fin
        bne r1, r4, seguir
        daddi r3, r3, 1

seguir: daddi r2, r2, 1 ; los caract ASCCI ocupan 1 byte
        j loop

fin:    sd r3, cant(r0)

        halt