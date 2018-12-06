; Thu Dec 06 17:15:43 CET 2018
; 
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(multislot Ejercicio
		(type INSTANCE)
;+		(allowed-classes Ejercicios)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot Intensidad
		(type SYMBOL)
		(allowed-values Facil Medio Dificil)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Sets
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Duracion
;+		(comment "Minutos")
		(type INTEGER)
		(range 0 90)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Programacion
		(type INSTANCE)
;+		(allowed-classes)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Mediante
		(type INSTANCE)
;+		(allowed-classes Ejercicios)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Peso
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Sexo
		(type SYMBOL)
		(allowed-values Masculino Femenino)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Mejoras
		(type INSTANCE)
;+		(allowed-classes)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Edad
		(type INTEGER)
		(range 0 150)
		(default 65)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Repeticiones
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Ejercicios
	(is-a USER)
	(role concrete)
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Intensidad
		(type SYMBOL)
		(allowed-values Facil Medio Dificil)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Duracion
;+		(comment "Minutos")
		(type INTEGER)
		(range 0 90)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Aerobicos
	(is-a Ejercicios)
	(role concrete))

(defclass Musculacion
	(is-a Ejercicios)
	(role concrete))

(defclass Equilibrio
	(is-a Ejercicios)
	(role concrete))

(defclass Flexibilidad
	(is-a Ejercicios)
	(role concrete))

(definstances instancies
; Thu Dec 06 17:15:43 CET 2018
; 
;+ (version "3.5")
;+ (build "Build 663")

([Anciano_Class18] of  Musculacion

	(Duracion 10)
	(Intensidad Facil)
	(Nombre "Levantar los Brazos"))

([Anciano_Class19] of  Musculacion

	(Duracion 20)
	(Intensidad Medio)
	(Nombre "Levantar los Brazos"))

([Anciano_Class20] of  Musculacion

	(Duracion 30)
	(Intensidad Dificil)
	(Nombre "Levantar los Brazos"))

([Anciano_Class21] of  Equilibrio

	(Duracion 10)
	(Intensidad Facil)
	(Nombre "Flexion de Rodilla"))

([Anciano_Class22] of  Equilibrio

	(Duracion 20)
	(Intensidad Medio)
	(Nombre "Flexion de Rodilla"))

([Anciano_Class23] of  Equilibrio

	(Duracion 30)
	(Intensidad Dificil)
	(Nombre "Flexion de Rodilla"))

([Anciano_Class24] of  Flexibilidad

	(Duracion 5)
	(Intensidad Facil)
	(Nombre "Rotacion de hombros"))

([Anciano_Class25] of  Flexibilidad

	(Duracion 10)
	(Intensidad Medio)
	(Nombre "Rotacion de hombros"))

([Anciano_Class26] of  Flexibilidad

	(Duracion 15)
	(Intensidad Dificil)
	(Nombre "Rotacion de hombros"))

([Anciano_Class27] of  Aerobicos

	(Duracion 10)
	(Intensidad Facil)
	(Nombre "Correr"))

([Anciano_Class28] of  Aerobicos

	(Duracion 20)
	(Intensidad Medio)
	(Nombre "Correr"))

([Anciano_Class29] of  Aerobicos

	(Duracion 30)
	(Intensidad Dificil)
	(Nombre "Correr"))

)