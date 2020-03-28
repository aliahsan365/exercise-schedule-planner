(define (domain planificador_ejercicios)

  (:requirements
    :strips
    :equality
    :typing
    :adl
  )

  (:types
    ejercicio dia nivel - object
  )

  (:predicates
    (estamos_dia ?dia - dia)
    (dia_siguiente ?dia1 ?dia2 - dia)
    (hecho_ejercicio ?ej - ejercicio ?dia - dia)
    (ejercicio_nivel ?ej - ejercicio ?nivel - nivel)
    (ejercicio_preparable ?ej - ejercicio)
    (ejercicio_preparado ?ej - ejercicio ?dia - dia)
    ;el ejercicio preparador de ?ej es ?preparador
    (ejercicio_preparador ?ej ?preparador - ejercicio)
    (nivel_siguiente ?nivel - nivel ?nivel_siguiente - nivel)
  )

  (:action cambiar_Dia
    :parameters (?x - dia ?y - dia)
    :precondition (and
      (estamos_dia ?x)
      (dia_siguiente ?x ?y)
    )
    :effect (and
      (not (estamos_dia ?x))
      (estamos_dia ?y)
    )
  )

  (:action hacer_Ejercicio
    :parameters (?ej - ejercicio ?hoy - dia ?nivel_anterior ?nivel - nivel)
    :precondition (and
      (estamos_dia ?hoy)
      (not (hecho_ejercicio ?ej ?hoy))
      (ejercicio_nivel ?ej ?nivel_anterior)
      (or (not (ejercicio_preparable ?ej)) (ejercicio_preparado ?ej ?hoy))
      (nivel_siguiente ?nivel_anterior ?nivel)
    )
    :effect (and
      (hecho_ejercicio ?ej ?hoy)
      (ejercicio_nivel ?ej ?nivel)
    )
  )

  (:action preparar_Ejercicio
    :parameters (?ej ?preparador - ejercicio ?hoy - dia)
    :precondition (and
      (estamos_dia ?hoy)
      (ejercicio_preparable ?ej)
      (not (ejercicio_preparado ?ej ?hoy))
      (forall (?preparador - ejercicio) (or
          (not (ejercicio_preparador ?ej ?preparador))
          (hecho_ejercicio ?preparador ?hoy)
        )
      )
    )
    :effect (ejercicio_preparado ?ej ?hoy)
  )
)
