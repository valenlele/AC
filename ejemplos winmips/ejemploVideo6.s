; definir un vector de 5 numeros V
; calcular la suma de los numeros del vector utilizando saltos
; guardar el resultado en una variable C

.data
  V: .word 4, -10, 512, 8, 16
  C: .word 0

.code
  daddi r1, r0, 0 ; r1 = desplazamiento
  daddi r3, r0, 0 ; r3 = total
  daddi r4, r0, 5 ; r4 = cantidad ciclos loop

  loop: ld r2, V(r1)
        dadd r3, r3, r2
        daddi r1, r1, 8
        daddi r4, r4, -1
        bnez r4, loop
  
  sd r3, C(r0)
  
  halt