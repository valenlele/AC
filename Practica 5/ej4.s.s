.data
peso:   .double 65.4
altura: .double 1.76
IMC:    .double 0.00
estado: .word 0
valor1: .double 18.5
valor2: .double 25
valor3: .double 30

.code
l.d f1, peso(r0)
l.d f2, altura(r0)
l.d f3, IMC(r0)
l.d f4, valor1(r0)
l.d f5, valor2(r0)
l.d f6, valor3(r0)

mul.d f2, f2, f2
div.d f3, f1, f2

c.lt.d f3, f4 ; si IMC es < que 18.5, FP = 1
bc1t infrapeso

c.lt.d f3, f5
bc1t normal

c.lt.d f3, f6
bc1t sobrepeso

daddi r1, r0, 4
j fin

infrapeso: daddi r1, r0, 1
j fin

normal: daddi r1, r0, 2
j fin

sobrepeso: daddi r1, r0, 3

fin: sd r1, estado(r0) 
halt