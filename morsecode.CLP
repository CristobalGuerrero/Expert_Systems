(deftemplate morse
	(slot begin (type INTEGER))
	(slot count (type INTEGER))
	(slot trace (type INTEGER))
	(slot input (type STRING))
)

(deffacts initial
	(morse (begin 0)
	(count 1)
	(trace 0)
	(input " "))
)

(defrule getinput
	(morse (input " "))
	?input <- (morse(input " "))
	=>
	(printout t "Enter in the code: " )
	(bind ?someinput (read))
	(modify ?input (input ?someinput))
)

(defrule lettera
	;gets the strings in each of the 
	;template slots and assigns them a var
	(morse(begin ?begin))
	(morse (input ?input))
	?begin2 <- (morse(begin ?begin))
	;?end <- (+ ?begin 1) want to replace the 2 with the end	
	?temp <- (sub-string ?begin 2 ?input)
	;(test (== ?temp ".-"))
	=>
	(modify ?begin2 (begin (+ ?begin 3)))
	(printout t "a")
)

