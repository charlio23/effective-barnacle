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
	(assert (peso (general-question "Cual es su peso? (Kg)")))
)

(defrule characterisation::altura "Pregunta por altura"
	(declare (salience 10))
	(not (altura ?))
	=>
	(assert (altura (general-question "Cual es su altura? (cm)")))
)

(defrule characterisation::cantEjercicio "Asks for cantEjercicio"
	(declare (salience 5))
	(not (cantEjercicio ?))
	=>
	(assert (cantEjercicio (num-question "Cuantos dias de ejercicio a la semana? " 0 5))) ;; TODO: change random values
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
)

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

