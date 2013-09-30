;Cristobal Guerrero, Diego Galvan
(deftemplate fire
	( multislot TypeA)
	( multislot TypeB)
	( multislot TypeC)
	( multislot TypeD)
	( slot typeof )
)

(deffacts initial
	(fire (TypeA paper wood cloth )
	( TypeB oil grease )
	( TypeC electrical )
	( TypeD magnesium sodium potassium )
	( typeof " " ))
)

(defrule question
	(fire ( typeof " " ))
	?material <- (fire ( typeof " " ))
	=>
	(printout t "What type of fire do you have? ")
	(bind ?answer (read))
	(modify ?material ( typeof ?answer ))
)

(defrule TypeAfire
	(fire ( typeof paper|wood|cloth ))
	=>
	(printout t "You have a type A fire! Use a heat-absorbing extinguisher or water!" crlf)
)

(defrule TypeBfire
	(fire ( typeof liquids|oil|gas|grease ))
	=>
	(printout t "You have a type B fire! Use a dry chemical such as foam! " crlf)
)

(defrule TypeCfire
	(fire ( typeof electrical ))
	=>
	(printout t "You have a type C fire! Hurry cut the power and use dry chemicals! " crlf)
)

(defrule TypeDfire
	(fire ( typeof magnesium|sodium|potassium ))
	=>
	(printout t "You have a type D fire! Try smothering the fire! " crlf)
)

(defrule Typenofire
	(fire ( typeof none ))
	?material <- (fire ( typeof ? ))
	=>
	(modify ?material ( typeof " "))
	(printout t "There is no fire =)" crlf)
)

(defrule exiting
	(fire (typeof q|quit|exit))
	=>
	(printout t "exiting program" crlf )
)