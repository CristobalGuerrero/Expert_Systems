;Cristobal Guerrero, Diego Galvan
(deftemplate plant
	(slot stunted)
	(slot paleyellow)
	(slot reddish-brown)
	(slot root)
	(slot stalk)
	(slot purplish)
	(slot delayed)
	(slot leaves)
	(slot weak)
	(slot shriveled)
	(slot nitrogen)
	(slot phosphorus)
	(slot potassium)
	(slot allanswered)
)

(deffacts initial
	(plant ( stunted " " )
	( paleyellow " " )
	( reddish-brown " " )
	( root " " )
	( stalk " " )
	( purplish " " )
	( delayed " " )
	( leaves " " )
	( weak " " )
	( shriveled " " )
	( nitrogen n )
	( phosphorus n )
	( potassium n )
	( allanswered n ))
)

(defrule stunted-growth
	(plant ( stunted " "))
	?phase <- (plant ( stunted " " ))
	=>
	(printout t "Does your tree have stunted growth? ")
	(bind ?answer (read))
	(modify ?phase ( stunted ?answer))
)

(defrule pale-yellow
	(plant ( paleyellow " "))
	?phase <- (plant ( paleyellow " " ))
	=>
	(printout t "Does your tree have pale yellow leaves? ")
	(bind ?answer (read))
	(modify ?phase ( paleyellow ?answer))
)

(defrule reddish
	(plant ( reddish-brown " "))
	?phase <- (plant ( reddish-brown " " ))
	=>
	(printout t "Does your tree have reddish brown leaves? ")
	(bind ?answer (read))
	(modify ?phase ( reddish-brown ?answer))
)

(defrule spindly
	(plant ( stalk " "))
	?phase <- (plant ( stalk " " ))
	=>
	(printout t "Does your tree have a spindly stalk? ")
	(bind ?answer (read))
	(modify ?phase ( stalk ?answer))
)

(defrule stunted-root
	(plant ( root " "))
	?phase <- (plant ( root " " ))
	=>
	(printout t "Does your tree have stunted root growth? ")
	(bind ?answer (read))
	(modify ?phase ( root ?answer))
)

(defrule purplish-leaves
	(plant ( purplish " "))
	?phase <- (plant ( purplish " " ))
	=>
	(printout t "Does your tree have purplish leaves? ")
	(bind ?answer (read))
	(modify ?phase ( purplish ?answer))
)

(defrule delayed-growth
	(plant ( delayed " "))
	?phase <- (plant ( delayed " " ))
	=>
	(printout t "Does your tree have delayed growth? ")
	(bind ?answer (read))
	(modify ?phase ( delayed ?answer))
)

(defrule leaves-growth
	(plant ( leaves " "))
	?phase <- (plant ( leaves " " ))
	=>
	(printout t "Does your tree have scorched leaf edges? ")
	(bind ?answer (read))
	(modify ?phase ( leaves ?answer))
)

(defrule weakend
	(plant ( weak " "))
	?phase <- (plant ( weak " " ))
	=>
	(printout t "Does your tree have weakened stems? ")
	(bind ?answer (read))
	(modify ?phase ( weak ?answer))
)

(defrule shriveledseeds
	(plant ( shriveled " "))
	?phase <- (plant ( shriveled " " ))
	=>
	(printout t "Does your tree have shriveled seeds or fruit? ")
	(bind ?answer (read))
	(modify ?phase ( shriveled ?answer))
)

(defrule lacknitro1
	(plant ( stunted y )( paleyellow y|n)( reddish-brown y|n ))
	?phase <- ( plant ( nitrogen n ))
	=>
	(modify ?phase ( nitrogen y ))
	(printout t "Your plant has a nitrogen deficiency" crlf )
)

(defrule lacknitro1.1
	(plant ( stunted y|n )( paleyellow y )( reddish-brown y|n ))
	?phase <- ( plant ( nitrogen n ))
	=>
	(modify ?phase ( nitrogen y ))
	(printout t "Your plant has a nitrogen deficiency" crlf )
)

(defrule lacknitro1.2
	(plant ( stunted y|n )( paleyellow y|n)( reddish-brown y ))
	?phase <- ( plant ( nitrogen n ))
	=>
	(modify ?phase ( nitrogen y ))
	(printout t "Your plant has a nitrogen deficiency" crlf )
)

(defrule lackphosph1
	(plant ( root y )( stalk y|n)( purplish y|n )( delayed y|n ))
	?phase <- ( plant ( phosphorus n ))
	=>
	(modify ?phase ( phosphorus y ))
	(printout t "Your plant has a phosphorus deficiency" crlf )
)

(defrule lackphosph1.1
	(plant ( root y|n )( stalk y)( purplish y|n )( delayed y|n ))
	?phase <- ( plant ( phosphorus n ))
	=>
	(modify ?phase ( phosphorus y ))
	(printout t "Your plant has a phosphorus deficiency" crlf )
)

(defrule lackphosph1.2
	(plant ( root y|n )( stalk y|n)( purplish y )( delayed y|n ))
	?phase <- ( plant ( phosphorus n ))
	=>
	(modify ?phase ( phosphorus y ))
	(printout t "Your plant has a phosphorus deficiency" crlf )
)

(defrule lackphosph1.3
	(plant ( root y|n )( stalk y|n)( purplish y|n )( delayed y ))
	?phase <- ( plant ( phosphorus n ))
	=>
	(modify ?phase ( phosphorus y ))
	(printout t "Your plant has a phosphorus deficiency" crlf )
)

(defrule lackpotas1
	(plant ( leaves y )( weak y|n)( shriveled y|n ))
	?phase <- ( plant ( potassium n ))
	=>
	(modify ?phase ( potassium y ))
	(printout t "Your plant has a potassium deficiency" crlf )
)

(defrule lackpotas1.2
	(plant ( leaves y|n )( weak y)( shriveled y|n ))
	?phase <- ( plant ( potassium n ))
	=>
	(modify ?phase ( potassium y ))
	(printout t "Your plant has a potassium deficiency" crlf )
)

(defrule lackpotas1.3
	(plant ( leaves y|n )( weak y|n)( shriveled y ))
	?phase <- ( plant ( potassium n ))
	=>
	(modify ?phase ( potassium y ))
	(printout t "Your plant has a potassium deficiency" crlf )
)