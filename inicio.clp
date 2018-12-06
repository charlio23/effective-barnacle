; Thu Dec 06 17:25:29 CET 2018
; 
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
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
		(create-accessor read-write))
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Peso
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Ejercicio
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

(defclass Aerobico
	(is-a Ejercicio)
	(role concrete))

(defclass Musculacion
	(is-a Ejercicio)
	(role concrete))

(defclass Equilibrio
	(is-a Ejercicio)
	(role concrete))

(defclass Flexibilidad
	(is-a Ejercicio)
	(role concrete))
	
	
(definstances instancies
; Thu Dec 06 17:25:29 CET 2018
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

([Anciano_Class27] of  Aerobico

	(Duracion 10)
	(Intensidad facil)
	(Nombre "Correr"))

([Anciano_Class28] of  Aerobico

	(Duracion 20)
	(Intensidad medio)
	(Nombre "Correr"))

([Anciano_Class29] of  Aerobico

	(Duracion 30)
	(Intensidad dificil)
	(Nombre "Correr"))
)

;;; Preliminary Modules, by subproblem detection:

(defmodule MAIN (export ?ALL))
;;; Module for user information recopilation and characterisation. 1st module after main
(defmodule characterisation
	(import MAIN ?ALL)
	(export ?ALL)
)
;;; Module for ejercicio/stay punctuation from Characterisation
(defmodule processing
	(import MAIN ?ALL)
	(import characterisation ?ALL)
	(export ?ALL)
)
;;; Module for solution construction
(defmodule construction
	(import MAIN ?ALL)
	(import characterisation ?ALL)
	(import processing ?ALL)
	(export ?ALL)
)
;;; Module for printing solution
(defmodule printmod
	(import MAIN ?ALL)
	(import construction ?ALL)
	(import characterisation ?ALL)
	(export ?ALL)
)




;;; Useful functions for characterisation:
;;; Each of these define a question input, with allowed kinds of values.
(deffunction MAIN::general-question (?question)
    (format t "%s " ?question)
	(bind ?answer (read))
	(while (not (lexemep ?answer)) do ;;; checks if input is string or symbol, else reject
		(format t "%s " ?question)
		(bind ?answer (read))
    )
	?answer
)
(deffunction MAIN::multioption (?question $?allowed-values)
   (format t "%s "?question)
   (progn$ (?curr-value $?allowed-values)
		(format t "(%s)" ?curr-value)
	)
   (printout t ": ")
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer))) ;;; put to lowercase, no need to check since it will be done next:
   (while (not (member$ ?answer ?allowed-values)) do
      (format t "%s "?question)
	  (progn$ (?curr-value $?allowed-values)
		(format t "[%s]" ?curr-value)
	  )
	  (printout t ": ")
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer
)

(deffunction MAIN::yes-no-question (?question)
   (bind ?response (multioption ?question si no))
   (if (eq ?response si)
       then TRUE 
       else FALSE)
)

(deffunction MAIN::num-question (?question ?min ?max)
	(format t "%s [entre %d y %d] " ?question ?min ?max)
	(bind ?answer (read))
	(while (not (and (>= ?answer ?min) (<= ?answer ?max)) ) do
		(format t "%s [entre %d y %d] " ?question ?min ?max)
		(bind ?answer (read))
	)
	?answer
)

(deffunction MAIN::min-num-question (?question ?min)
	(format t "%s [mayor que %d] " ?question ?min)
	(bind ?answer (read))
	(while (not (>= ?answer ?min) ) do
		(format t "%s [mayor que %d] " ?question ?min)
		(bind ?answer (read))
	)
	?answer
)

;This function is useful for getting the best option from a list.
(deffunction MAIN::maximum-score ($?lista)
	(bind ?maximum -1)
	(bind ?element nil)
	(progn$ (?curr-element $?lista)
		(bind ?curr-sc (send ?curr-element get-Score))
		(if (> ?curr-sc ?maximum)
			then 
			(bind ?maximum ?curr-sc)
			(bind ?element ?curr-element)
		)
	)
	?element
)

;;; Rules for main and characterisation

(defrule MAIN::system-banner "First rule of program"
	(declare (salience 10))
	=>
    (printout t crlf crlf)
	(printout t "Sistema de Recomendacion de Rutina de Ejercicios")
    (printout t crlf crlf)
	(printout t "Por favor, responda a las siguientes preguntas:" crlf)
	(focus characterisation)
)

;;; Here go all the rules for question asking:

(defrule characterisation::edad "Pregunta por edad"
	(declare (salience 10))
	(not (edad ?))
	=>
	(assert (edad (min-num-question "¿Cual es su edad? " 65)))
)
(defrule characterisation::Event "Asks dificultad"
	(declare (salience 3))
	(not (dificultad ?))
	=>
	(assert (dificultad (multioption "Dificultad?" facil medio dificil)))
)

(defrule characterisation::toProcessing "Switches focus to processing after nothing else to do"
	(declare(salience -20))
	=>
	(printout t "Processing..." crlf)
	(focus processing)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Processing code

; template for the list of ejercicios
(deftemplate processing::ejercicioList
	(multislot ejercicios (type INSTANCE))
)

; initial assert to create lists we'll use later
(defrule processing::initial-asserts "Creating the lists used in processing"
    (declare (salience 20))
    (not (ejercicioList))
    =>
    (assert (ejercicioList))
)

; Adding all the ejercicios to their list and initializing the score to 0
(defrule processing::addEjercicios "Add all ejercicios, score afterwards"
    (declare (salience 10))
    ?ejer <- (object (is-a Ejercicio))
	?fact <- (ejercicioList (ejercicios $?list))
	(test (not (member$ ?ejer $?list)))
	=>
	(bind $?list (insert$ $?list (+ (length$ $?list) 1) ?ejer))
	(modify ?fact (ejercicios $?list))
    (send ?ejer put-Score 0)
)

(defrule processing::scoreEjercicios "modify the score of each ejercicio"
    (declare (salience 9)) ; higher salience as this sets their base score
    (objective ?obj) ; this is the what the user is interested in
    ?fact <- (ejercicioList (ejercicios $?list))
    =>
    (progn$ (?curr-ejercicio $?list)
        (bind $?list2 (send ?curr-ejercicio get-Intensidad))
        (progn$ (?curr-intensidad $?list2)
            ; if an interest in a ejercicio is of the same kind as what the user is interested in, the base score of the ejercicio is higher
            (if (dificultad (lowcase ?curr-intensidad))
                then
                (send ?curr-ejercicio put-Score 100) 
            )
        )
	)
)


(defrule processing::toConstruction "Switches to construction"
	(declare (salience -20))
	=>
	(printout t "Building travel 1..." crlf)
	(focus construction)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule construction::toPrint "Switches to printing"
	(declare (salience -20))
	=>
	(printout t "Printing..." crlf)
	(focus printmod)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;










