(defglobal ?*scoreBase* = 500)
(defglobal ?*plus* = 50)
(defglobal ?*penal* = -100)
(defglobal ?*aburrido* = -10)
(defglobal ?*intMov* = -100)

(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(multislot MusculosTrabajados
;+		(comment "Trabaja")
		(type INSTANCE)
;+		(allowed-classes Parte)
		(create-accessor read-write))
	(multislot Beneficia
		(type INSTANCE)
;+		(allowed-classes Problemas)
		(create-accessor read-write))
	(single-slot Duracion
;+		(comment "Minutos")
		(type INTEGER)
		(range 0 90)
		(default 30)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot IntensidadMinima
		(type INTEGER)
		(range 0 10)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Porcentaje+del+Maximo
		(type INTEGER)
		(range 0 100)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Tipo
		(type SYMBOL)
		(allowed-values Calentamiento Estiramiento Rutina Ejercicio)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Grupo+muscular
		(type SYMBOL)
		(allowed-values Grande Pequeno)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot IntensidadMaxima
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Ejercicios
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(multislot Perjudica
		(type INSTANCE)
;+		(allowed-classes Problemas)
		(create-accessor read-write))
	(single-slot Score
		(type INTEGER)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Ejercicio
	(is-a USER)
	(role concrete)
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Duracion
;+		(comment "Minutos")
		(type INTEGER)
		(range 0 90)
		(default 30)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Aerobico
	(is-a Ejercicio)
	(role concrete))

(defclass Musculacion
	(is-a Ejercicio)
	(role concrete)
	(single-slot Porcentaje+del+Maximo
		(type INTEGER)
		(range 0 100)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Equilibrio
	(is-a Ejercicio)
	(role concrete))

(defclass Flexibilidad
	(is-a Ejercicio)
	(role concrete))

(defclass Problemas
	(is-a USER)
	(role concrete)
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Parte
	(is-a USER)
	(role concrete)
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Rutina
	(is-a USER)
	(role concrete)
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot MusculosTrabajados
;+		(comment "Trabaja")
		(type INSTANCE)
;+		(allowed-classes Parte)
		(create-accessor read-write))
	(single-slot IntensidadMaxima
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Beneficia
		(type INSTANCE)
;+		(allowed-classes Problemas)
		(create-accessor read-write))
	(multislot Ejercicios
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(multislot Perjudica
		(type INSTANCE)
;+		(allowed-classes Problemas)
		(create-accessor read-write))
	(single-slot Score
		(type INTEGER)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Duracion
;+		(comment "Minutos")
		(type INTEGER)
		(range 0 90)
		(default 30)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot IntensidadMinima
		(type INTEGER)
		(range 0 10)
;+		(cardinality 1 1)
		(create-accessor read-write)))



(definstances instancies 
([Anciano_Class0] of  Problemas

	(Nombre "Caridiovascular"))

([Anciano_Class10001] of  Parte

	(Nombre "Cadera"))

([Anciano_Class10003] of  Problemas

	(Nombre "Musculo esqueletico"))

([Anciano_Class10004] of  Problemas

	(Nombre "Artritis"))

([Anciano_Class10007] of  Aerobico

	(Duracion 60)
	(Nombre "Andar"))

([Anciano_Class10008] of  Aerobico

	(Duracion 30)
	(Nombre "Correr"))

([Anciano_Class10009] of  Aerobico

	(Duracion 30)
	(Nombre "Nadar"))

([Anciano_Class10010] of  Aerobico

	(Duracion 30)
	(Nombre "Bicicleta"))

([Anciano_Class10011] of  Aerobico

	(Duracion 30)
	(Nombre "Andar"))

([Anciano_Class10012] of  Aerobico

	(Duracion 45)
	(Nombre "Bicicleta"))

([Anciano_Class10013] of  Aerobico

	(Duracion 45)
	(Nombre "Nadar"))

([Anciano_Class10015] of  Problemas

	(Nombre "Obesidad"))

([Anciano_Class10017] of  Problemas

	(Nombre "Diabetes Tipo 2"))

([Anciano_Class10018] of  Problemas

	(Nombre "Pulmonar"))

([Anciano_Class20003] of  Parte

	(Nombre "Espalda"))

([Anciano_Class20004] of  Parte

	(Nombre "Piernas"))

([Anciano_Class20006] of  Parte

	(Nombre "Hombros"))

([Anciano_Class20007] of  Parte

	(Nombre "Pectoral"))

([Anciano_Class20008] of  Parte

	(Nombre "Cardio"))

([Anciano_Class20015] of  Aerobico

	(Duracion 60)
	(Nombre "BodyCombat"))

([Anciano_Class20016] of  Aerobico

	(Duracion 45)
	(Nombre "Baile"))

([Anciano_Class20017] of  Aerobico

	(Duracion 45)
	(Nombre "Padel"))

([Anciano_Class20018] of  Aerobico

	(Duracion 30)
	(Nombre "Remo"))

([Anciano_Class20019] of  Aerobico

	(Duracion 45)
	(Nombre "Remo"))

([Anciano_Class20020] of  Equilibrio

	(Duracion 5)
	(Nombre "Pararse Sobre un Pie"))

([Anciano_Class20021] of  Equilibrio

	(Duracion 5)
	(Nombre "Caminar de talón a dedos"))

([Anciano_Class20022] of  Equilibrio

	(Duracion 5)
	(Nombre "Flexion Plantar"))

([Anciano_Class20023] of  Equilibrio

	(Duracion 5)
	(Nombre "Flexion de Rodilla"))

([Anciano_Class20024] of  Equilibrio

	(Duracion 5)
	(Nombre "Flexion de Cadera"))

([Anciano_Class20025] of  Equilibrio

	(Duracion 5)
	(Nombre "Extension de Cadera"))

([Anciano_Class20026] of  Equilibrio

	(Duracion 5)
	(Nombre "Levantamiento Lateral de la Pierna"))

([Anciano_Class20027] of  Flexibilidad

	(Duracion 2)
	(Nombre "Estiramiento de Espalda"))

([Anciano_Class20028] of  Flexibilidad

	(Duracion 2)
	(Nombre "Estiramiento de Cuadriceps"))

([Anciano_Class20029] of  Flexibilidad

	(Duracion 2)
	(Nombre "Estiramiento de Gluteos"))

([Anciano_Class20030] of  Flexibilidad

	(Duracion 2)
	(Nombre "Estiramiento de Cadera"))

([Anciano_Class20031] of  Flexibilidad

	(Duracion 2)
	(Nombre "Estiramiento de Gemelos"))

([Anciano_Class20032] of  Flexibilidad

	(Duracion 2)
	(Nombre "Estiramiento de Rodillas"))

([Anciano_Class20034] of  Flexibilidad

	(Duracion 2)
	(Nombre "Estiramiento de Musculos Isquio-Tibiales"))

([Anciano_Class20035] of  Flexibilidad

	(Duracion 5)
	(Nombre "Estiramiento de Brazos"))

([Anciano_Class20036] of  Musculacion

	(Duracion 20)
	(Nombre "Sentadillas")
	(Porcentaje+del+Maximo 30))

([Anciano_Class20037] of  Musculacion

	(Duracion 20)
	(Nombre "Sentadillas")
	(Porcentaje+del+Maximo 45))

([Anciano_Class20038] of  Musculacion

	(Duracion 20)
	(Nombre "Sentadillas")
	(Porcentaje+del+Maximo 60))

([Anciano_Class20039] of  Musculacion

	(Duracion 20)
	(Nombre "Press de Banca")
	(Porcentaje+del+Maximo 60))

([Anciano_Class20040] of  Musculacion

	(Duracion 20)
	(Nombre "Press de Banca")
	(Porcentaje+del+Maximo 45))

([Anciano_Class20041] of  Musculacion

	(Duracion 20)
	(Nombre "Press de Banca")
	(Porcentaje+del+Maximo 30))

([Anciano_Class20042] of  Musculacion

	(Duracion 20)
	(Nombre "Peso Muerto")
	(Porcentaje+del+Maximo 30))

([Anciano_Class20043] of  Musculacion

	(Duracion 20)
	(Nombre "Peso Muerto")
	(Porcentaje+del+Maximo 45))

([Anciano_Class20044] of  Musculacion

	(Duracion 20)
	(Nombre "Peso Muerto")
	(Porcentaje+del+Maximo 60))

([Anciano_Class20046] of  Musculacion

	(Duracion 20)
	(Nombre "Press Militar")
	(Porcentaje+del+Maximo 30))

([Anciano_Class20047] of  Musculacion

	(Duracion 20)
	(Nombre "Press Militar")
	(Porcentaje+del+Maximo 60))

([Anciano_Class20048] of  Musculacion

	(Duracion 20)
	(Nombre "Press Militar")
	(Porcentaje+del+Maximo 45))

([Anciano_Class20049] of  Aerobico

	(Duracion 60)
	(Nombre "Aquagym"))

([Anciano_Class20051] of  Rutina

	(Beneficia
		[Anciano_Class10004]
		[Anciano_Class0]
		[Anciano_Class10018]
		[Anciano_Class10015]
		[Anciano_Class10017]
		[Anciano_Class5])
	(Duracion 80)
	(Ejercicios
		[Anciano_Class20034]
		[Anciano_Class20031]
		[Anciano_Class20030]
		[Anciano_Class20032]
		[Anciano_Class10007]
		[Anciano_Class20031]
		[Anciano_Class20028]
		[Anciano_Class20030]
		[Anciano_Class20034])
	(IntensidadMaxima 3)
	(IntensidadMinima 2)
	(Nombre "Rutina1")
	(Score 0))

([Anciano_Class20055] of  Parte

	(Nombre "Rodilla"))

([Anciano_Class5] of  Problemas

(Nombre "Hipertension"))
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
(deffunction MAIN::general-num-question (?question)
    (format t "%s " ?question)
	(bind ?answer (read))
	(while (not (integerp ?answer)) do ;;; checks if input is integer, else reject
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
	(while (or (not (integerp ?answer)) (not (and (>= ?answer ?min) (<= ?answer ?max))) ) do
		(format t "%s [entre %d y %d] " ?question ?min ?max)
		(bind ?answer (read))
	)
	?answer
)

(deffunction MAIN::min-num-question (?question ?min)
	(format t "%s [mayor que %d] " ?question ?min)
	(bind ?answer (read))
	(while (or (not (integerp ?answer)) (not (>= ?answer ?min)) ) do
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

(defrule characterisation::nombre "Pregunta por nombre"
	(declare (salience 10))
	(not (nombre ?))
	=>
	(assert (nombre (general-question "Como se llama? ")))
)
(defrule characterisation::edad "Pregunta por edad"
	(declare (salience 10))
	(not (edad ?))
	=>
	(assert (edad (min-num-question "Cual es su edad? " 65)))
)
(defrule characterisation::sexo "Pregunta por sexo"
	(declare (salience 10))
	(not (sexo ?))
	=>
	(assert (sexo (multioption "Es hombre o mujer?" hombre mujer)))
)

(defrule characterisation::peso "Pregunta por peso"
	(declare (salience 10))
	(not (peso ?))
	=>
	(assert (peso (general-num-question "Cual es su peso? (Kg)")))
)

(defrule characterisation::altura "Pregunta por altura"
	(declare (salience 10))
	(not (altura ?))
	=>
	(assert (altura (general-num-question "Cual es su altura? (cm)")))
)

(defrule characterisation::cantEjercicio "Asks for cantEjercicio"
	(declare (salience 5))
	(not (cantEjercicio ?))
	=>
	(assert (cantEjercicio (num-question "Cuantos dias de ejercicio a la semana? " 0 7))) ;; TODO: change random values
)


(defrule characterisation::movilidad "Pregunta por movilidad"
	(declare (salience 5))
	(not (probMov ?))
	=>
	(assert (probMov (yes-no-question "Tiene problemas de movilidad? ")))
)

(defrule characterisation::zonaAfectada "Pregunta por zona afectada"
	(declare (salience 5))
	(probMov TRUE)
	=>
	(assert (zonaAfectada (multioption "Cual es la zona afectada?" piernas brazos ambas)))
)g

(defrule characterisation::caidas "Pregunta por caidas"
	(declare (salience 5))
	(not (caidas ?))
	(probMov TRUE)
	(zonaAfectada piernas)
	=>
	(assert (caidas (yes-no-question "Ha tenido caidas recientemente? ")))
)

(defrule characterisation::musculoesqueleticos "Pregunta por problemas musculoesqueleticos"
	(declare (salience 5))
	(not (musculoesqueleticos ?))
	=>
	(assert (musculoesqueleticos (yes-no-question "Tiene problemas musculoesqueleticos? ")))
)

(defrule characterisation::artritis "Pregunta por problemas artritis"
	(declare (salience 5))
	(not (artritis ?))
	=>
	(assert (artritis (yes-no-question "Tiene artritis? ")))
)

(defrule characterisation::hipertension "Pregunta por hipertension"
	(declare (salience 5))
	(not (hipertension ?))
	=>
	(assert (hipertension (yes-no-question "Sufre usted de hipertension arterial? ")))
)

(defrule characterisation::osteoporosis "Pregunta por osteoporosis"
	(declare (salience 1))
	(not (osteoporosis ?))
	=>
	(assert (osteoporosis (yes-no-question "Tiene problemas de osteoporosis? ")))
)

(defrule characterisation::cardiaco "Pregunta por cardiaco"
	(declare (salience 1))
	(not (cardiaco ?))
	=>
	(assert (cardiaco (yes-no-question "Tiene problemas cardiovasculares? ")))
)

(defrule characterisation::pulmonar "Pregunta por pulmon"
	(declare (salience 1))
	(not (pulmonar ?))
	=>
	(assert (pulmonar (yes-no-question "Tiene problemas respiratorios o pulmonares? ")))
)

(defrule characterisation::diabetes "Pregunta por diabetes"
	(declare (salience 1))
	(not (diabetes ?))
	=>
	(assert (diabetes (yes-no-question "Sufre usted de diabetes tipo II? ")))
)

(defrule characterisation::estado "Pregunta por estado fisico"
	(declare (salience 1))
	(not (nivel ?))
	=>
	(assert (nivel (num-question "Podria dar una puntuacion aproximada de su fisico?" 1 10)))
)

(defrule characterisation::actividad "Pregunta por actividad"
	(declare (salience 1))
	(not (activo ?))
	=>
	(assert (activo (yes-no-question "Realiza ejercicio con regularidad? ")))
)


;;;;;;;; Deducciones
(defrule characterisation::mujerImpliesOsteo "Si es mujer, mirar osteoporosis"
	(declare (salience 10))
	(sexo mujer)
	=>
	(assert (osteoporosis TRUE))
)

(defrule characterisation::caidaImpliesMov "Si tiene caidas, tiene problemas de movilidad"
	(declare (salience 10))
	(caidas TRUE)
	=>
	(assert (probMov TRUE))
	(assert (zonaAfectada piernas))
)

(defrule characterisation::enfermedadesImpliesBajaDif "Si tiene enfermedades, la dificultad sera baja"
	(or (or (osteoporosis TRUE) (cardiaco TRUE)) (movilidad TRUE))
	(cantEjercicio ?x)
	(not (dificultad facil))
	?f1<-(dificultad ?dif)
	=>
	(retract ?f1)
	(if (> ?x 3)
		then
		(assert (dificultad media))
	)
	(if (> ?x 2)
		then
		(assert (dificultad facil))
	)
)

(deffunction characterisation::imc (?alt ?pes)
    (bind ?im (/ ?pes (* (/ ?alt 100) (/ ?alt 100))))
	?im
)

;calcul del IMC per veure si hi ha sobrepes
(defrule characterisation::sobrepes "Mirar si te sobrepes"
	(declare (salience 10))
	(peso ?pe)
	(altura ?alt)
	=>
	(bind ?im (imc ?alt ?pe))
	(assert (imc ?im))
	(if (> ?im 30)
		then
		(assert (obesidad TRUE))
		else
		(assert (obesidad FALSE))
	)
	(printout t ?im crlf)
)

(defrule characterisation::toProcessing "Switches focus to processing after nothing else to do"
	(declare(salience -20))
	=>
	(printout t "Processing..." crlf)
	(focus processing)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; template for the list of ejercicios
(deftemplate processing::rutinaList
	(multislot rutinas (type INSTANCE))
)

; initial assert to create lists we'll use later
(defrule processing::initial-asserts "Creating the lists used in processing"
    (declare (salience 20))
    (not (rutinaList))
    =>
    (assert (rutinaList))
)


; Adding all the rutinas to their list and initializing the score to 0
(defrule processing::addRutinas "Add all rutinas, score afterwards"
    (declare (salience 10))
    ?rut <- (object (is-a Rutina))
    ?fact <- (rutinaList (rutinas $?list))
	(test (not (member$ ?rut $?list)))
	=>
	(bind $?list (insert$ $?list (+ (length$ $?list) 1) ?rut))
	(modify ?fact (rutinas $?list))
    (send ?rut put-Score 0)
    (printout t Rutinas)
)

(defrule processing::scoreRutinas "modify the score of each rutina"
    (declare (salience 9)) ; higher salience as this sets their base score
    (nivel ?niv) ; this is the what the user is interested in
    ?fact <- (rutinaList (rutinas $?list))
    =>
    (progn$ (?curr-rutina $?list)
		(if (and (<= (send ?curr-rutina get-IntensidadMaxima) ?niv) (<= ?niv (send ?curr-rutina get-IntensidadMinima)))
			then 
            (send ?curr-rutina put-Score ?*scoreBase*)
            (printout t Rutina aceptada)
        )
	)
)

(defrule processing::penalRutinasEnfer "modify the score of each rutina"
    (nivel ?niv) ; this is the what the user is interested in
    ?fact <- (rutinaList (rutinas $?list))
    (musculoesqueleticos ?mus)
    (artritis ?art)
    (hipertension ?hip)
    (osteoporosis ?ost)
    (cardiaco ?car)
    (pulmonar ?pul)
    (diabetes ?dia)
    (obesidad ?obe)
    =>
    (progn$ (?curr-rutina $?list)
        (bind $?list2 (send ?curr-rutina get-Perjudica))
        (progn$ (?curr-problema $?list2)
            (if (and (eq ?mus TRUE) (eq (send ?curr-problema get-Nombre) "Musculo esqueletico"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*penal*))
            )      
            (if (and (eq ?hip TRUE) (eq (send ?curr-problema get-Nombre) "Hipertension"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*penal*))
            )
            (if (and (eq ?car TRUE) (eq (send ?curr-problema get-Nombre) "Cardiovascular"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*penal*))
            )      
            (if (and (eq ?pul TRUE) (eq (send ?curr-problema get-Nombre) "Pulmonar"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*penal*))
            )
            (if (and (eq ?car TRUE) (eq (send ?curr-problema get-Nombre) "Diabetes Tipo 2"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*penal*))
            )      
            (if (and (eq ?pul TRUE) (eq (send ?curr-problema get-Nombre) "Obesidad"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*penal*))
            )
            (if (and (eq ?pul TRUE) (eq (send ?curr-problema get-Nombre) "Artritis"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*penal*))
            )  
        )
	)
)

(defrule processing::benRutinasEnfer "modify the score of each rutina"
    (nivel ?niv) ; this is the what the user is interested in
    ?fact <- (rutinaList (rutinas $?list))
    (musculoesqueleticos ?mus)
    (artritis ?art)
    (hipertension ?hip)
    (osteoporosis ?ost)
    (cardiaco ?car)
    (pulmonar ?pul)
    (diabetes ?dia)
    (obesidad ?obe)
    =>
    (progn$ (?curr-rutina $?list)
        (bind $?list2 (send ?curr-rutina get-Beneficia))
        (progn$ (?curr-problema $?list2)
            (if (and (eq ?mus TRUE) (eq (send ?curr-problema get-Nombre) "Musculo esqueletico"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*plus*))
            )      
            (if (and (eq ?hip TRUE) (eq (send ?curr-problema get-Nombre) "Hipertension"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*plus*))
            )
            (if (and (eq ?car TRUE) (eq (send ?curr-problema get-Nombre) "Cardiovascular"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*plus*))
            )      
            (if (and (eq ?pul TRUE) (eq (send ?curr-problema get-Nombre) "Pulmonar"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*plus*))
            )
            (if (and (eq ?car TRUE) (eq (send ?curr-problema get-Nombre) "Diabetes Tipo 2"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*plus*))
            )      
            (if (and (eq ?pul TRUE) (eq (send ?curr-problema get-Nombre) "Obesidad"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*plus*))
            )
            (if (and (eq ?pul TRUE) (eq (send ?curr-problema get-Nombre) "Artritis"))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*plus*))
            )  
        )
	)
)


(defrule processing::penalRutinasMov "modify the score of each rutina"
    (nivel ?niv) ; this is the what the user is interested in
    ?fact <- (rutinaList (rutinas $?list))
	(probMov TRUE)
    (zonaAfectada ?za)
    =>
    (progn$ (?curr-rutina $?list)
        (bind $?list2 (send ?curr-rutina get-MusculosTrabajados))
        (progn$ (?curr-parte $?list2)
            (if (and (and (or (eq ?za piernas) (eq ?za ambos)) (eq (send ?curr-parte get-Nombre) "Cadera")) (<= (send ?curr-rutina get-IntensidadMaxima) ?*intMov*))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*penal*))
            )       
            (if (and (and (or (eq ?za piernas) (eq ?za ambos)) (eq (send ?curr-parte get-Nombre) "Piernas")) (<= (send ?curr-rutina get-IntensidadMaxima) ?*intMov*))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*penal*))
            )       
            (if (and (and (or (eq ?za piernas) (eq ?za ambos)) (eq (send ?curr-parte get-Nombre) "Rodilla")) (<= (send ?curr-rutina get-IntensidadMaxima) ?*intMov*))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*penal*))
            )       
            (if (and (and (or (eq ?za brazos) (eq ?za ambos)) (eq (send ?curr-parte get-Nombre) "Hombros")) (<= (send ?curr-rutina get-IntensidadMaxima) ?*intMov*))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*penal*))
            )       
            (if (and (and (or (eq ?za brazos) (eq ?za ambos)) (eq (send ?curr-parte get-Nombre) "Pectoral")) (<= (send ?curr-rutina get-IntensidadMaxima) ?*intMov*))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*penal*))
            )       
            (if (and (and (or (eq ?za brazos) (eq ?za ambos)) (eq (send ?curr-parte get-Nombre) "Espalda")) (<= (send ?curr-rutina get-IntensidadMaxima) ?*intMov*))
                then
                (send ?curr-rutina put-Score (+ (send ?curr-rutina get-Score) ?*penal*))
            )       
        )
	)
    
)

(defrule processing::toConstruction "Switches to construction"
	(declare (salience -20))
	=>
	(printout t "Building rutina 1..." crlf)
	(focus construction)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule construction::StartDias "Inicia numero de dias de ejercicio"
	(declare (salience 20))
	(cantEjercicio ?x)
	=>
	(if (< ?x 3)
		then (assert (dias 3))
		else (if (< ?x 7)
				then (assert (dias (+ ?x 1)))
				else (assert (dias 7))
			  )
	)
)


; First solution generation, minimal cost with all other restrictions.
(defrule construction::Start "Initializes the solution with minimum requirements"
	(edad ?)
	(dias ?d)
	(rutinaList)
	=>
	(bind $?Unorderedlist (find-all-instances ((?inst Rutina)) (> ?inst:Score 0)))
	
    ;Preliminar selection of rutinas
    
	(bind $?result (create$ ))
	(while (and (not (eq (length$ $?Unorderedlist) 0)) (< (length$ $?result) ?d))  do ;; pairing it with comment below, should get more cities!
		(bind ?curr-rec (maximum-score $?Unorderedlist))
		(bind $?result (insert$ $?result (+ (length$ $?result) 1) ?curr-rec))
		(send ?curr-rec put-Score (* (send ?curr-rec get-Score) 0.7))
	)
	
	(assert (resultado $?result))
)

(defrule construction::toPrint "Switches to printing"
	(declare (salience -20))
	=>
	(printout t "Printing..." crlf)
	(focus printmod)
	(assert (oneDone TRUE))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deffunction printmod::Myprint (?n $?list)
	(printout t crlf crlf)
	(printout t "Programa Personalizado de Ejercicios para " ?n crlf)
	(printout t crlf)
	(loop-for-count (?i 1 (length$ $?list))
		(bind ?duracion (send (nth$ ?i ?list) get-Duracion))
		(printout t "Dia " ?i ": Rutina de " ?duracion " minutos." crlf)
		(bind ?nombre (send (nth$ ?i ?list) get-Nombre))
		(printout t "Esta formada por los siguientes ejercicios: " crlf)
		(bind $?list2 (send (nth$ ?i ?list) get-Ejercicios))
        (progn$ (?curr-ejer $?list2)
			(bind ?nombre ?curr-ejer get-Nombre)
			(bind ?duracion ?curr-ejer get-Duracion)
			(printout t ?nombre " durante " ?duracion " minutos")
			(printout t crlf)
        )		


	)
	(printout t crlf crlf)


)



(defrule printmod::printer2 ""
	(oneDone TRUE)
	(nombre ?n)
	(resultado $?result)
	=>
	(Myprint ?n $?result)
)



