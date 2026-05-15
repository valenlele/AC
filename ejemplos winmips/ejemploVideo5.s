; definir un vector de 3 numeros V
; calcular la suma de los numeros del vector, sin utilizar saltos
; guardar el resultado en una variable C

.data
  V: .word 2, 4, 9
  C: .word 0

.code
  daddi r3, r0, 0 ; r3: total suma

  daddi r1, r0, 0 ; r1: valor desplazamiento
  ld r2, V(r1)  
  dadd r3, r2, r0

  daddi r1, r1, 8
  ld r2, V(r1)
  dadd r3, r2, r3

  daddi r1, r1, 8
  ld r2, V(r1)
  dadd r3, r2, r3

  sd r3, C(r0)

  halt