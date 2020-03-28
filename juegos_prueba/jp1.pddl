(define (problem jp1)
(:domain planificador_ejercicios)
(:objects
  ejercicio1 - ejercicio
  ejercicio2 - ejercicio
  ejercicio3 - ejercicio
  ejercicio4 - ejercicio
  ejercicio5 - ejercicio
  ejercicio6 - ejercicio
  ejercicio7 - ejercicio
  ejercicio8 - ejercicio
  ejercicio9 - ejercicio
  dia1 - dia
  dia2 - dia
  dia3 - dia
  dia4 - dia
  dia5 - dia
  dia6 - dia
  dia7 - dia
  dia8 - dia
  dia9 - dia
  dia10 - dia
  dia11 - dia
  dia12 - dia
  dia13 - dia
  dia14 - dia
  dia15 - dia
  nivel0 - nivel
  nivel1 - nivel
  nivel2 - nivel
  nivel3 - nivel
  nivel4 - nivel
  nivel5 - nivel
  nivel6 - nivel
  nivel7 - nivel
  nivel8 - nivel
  nivel9 - nivel
)
(:init
  (estamos_dia dia1)
  (dia_siguiente dia1 dia2)
  (dia_siguiente dia2 dia3)
  (dia_siguiente dia3 dia4)
  (dia_siguiente dia4 dia5)
  (dia_siguiente dia5 dia6)
  (dia_siguiente dia6 dia7)
  (dia_siguiente dia7 dia8)
  (dia_siguiente dia8 dia9)
  (dia_siguiente dia9 dia10)
  (dia_siguiente dia10 dia11)
  (dia_siguiente dia11 dia12)
  (dia_siguiente dia12 dia13)
  (dia_siguiente dia13 dia14)
  (dia_siguiente dia14 dia15)
  (nivel_siguiente nivel0 nivel1)
  (nivel_siguiente nivel1 nivel2)
  (nivel_siguiente nivel2 nivel3)
  (nivel_siguiente nivel3 nivel4)
  (nivel_siguiente nivel4 nivel5)
  (nivel_siguiente nivel5 nivel6)
  (nivel_siguiente nivel6 nivel7)
  (nivel_siguiente nivel7 nivel8)
  (nivel_siguiente nivel8 nivel9)
  (ejercicio_nivel ejercicio1 nivel0)
  (ejercicio_nivel ejercicio2 nivel0)
  (ejercicio_nivel ejercicio3 nivel0)
  (ejercicio_nivel ejercicio4 nivel0)
  (ejercicio_nivel ejercicio5 nivel0)
  (ejercicio_nivel ejercicio6 nivel0)
  (ejercicio_nivel ejercicio7 nivel0)
  (ejercicio_nivel ejercicio8 nivel0)
  (ejercicio_nivel ejercicio9 nivel0)
  (ejercicio_preparable ejercicio4)
  (ejercicio_preparador ejercicio4 ejercicio3)
  (ejercicio_preparador ejercicio4 ejercicio2)
  (ejercicio_preparador ejercicio4 ejercicio1)
  (ejercicio_preparable ejercicio8)
  (ejercicio_preparador ejercicio8 ejercicio4)
  (ejercicio_preparador ejercicio8 ejercicio5)
  (ejercicio_preparable ejercicio9)
  (ejercicio_preparador ejercicio9 ejercicio8)
  (ejercicio_preparador ejercicio9 ejercicio7)
  (ejercicio_preparador ejercicio9 ejercicio6)
  
)
(:goal 
  (ejercicio_nivel ejercicio9 nivel8)
)
)

