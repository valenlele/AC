; definir un vector de 5 numeros V
; calcular la suma de los numeros del vector utilizando saltos
; utilizar un registro como puntero (no desplazamiento) para acceder a los elementos del vector
; guardar el resultado en una variable C

.data
  V: .word 4, -10, 512, 8, 16
  C: .word 0

.code  
  ; r1 = desplazamiento
  ; r2 = dato del vector
  ; r3 = total
  : r4 = contador

  daddi r3, r0, 0
  daddi r4, r0, 5
  
  loop: ld r2, V(r1)
  	dadd r3, r3, r2
  	daddi r1, r1, 8
  	daddi r4, r0, -1
  	bnez loop

  sd r3, C(r0)

  halt