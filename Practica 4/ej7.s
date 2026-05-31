        .data
TABLA:  .word 5, 4, 76, 88, 13, 22, 55, 1, 43, 344
X:      .word 50
CANT:   .word 0
RES:    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
 
        .code
        dadd r1, r0, r0  ; offset
        daddi r2, r0, 10 ; cant numeros tabla 
        ld r3, X(r0)     ; numero al que tienen que ser mayor
        daddi r4, r0, 0
        daddi r7, r0, 1

loop:   ld r5, TABLA(r1)

        slt r6, r3, r5   ; guarda 1 en r6 si el valor en tabla es mayor a el valor en r3 o 0 si en menor o igual
        sd r6, RES(r1)
        dadd r4, r4, r6       
        
        daddi r1, r1, 8
        daddi r2, r2, -1  
        bnez r2, loop

        sd r4, CANT(r0) 
        halt