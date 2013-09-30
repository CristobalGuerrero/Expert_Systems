(deftemplate ako
	(slot parent)
	(multislot child)
)
(deffacts akof
	(ako (parent Aircraft)(child ballon propeller-driven jet))
	(ako (parent ballon)(child blimp))
	(ako (parent propeller-driven)(child blimp special DC-3))
	(ako (parent jet)(child DC-9 Concorde))
)

(deftemplate isa
	(slot parent)
	(multislot child)
)

(deffacts isainst
	(isa (parent blimp)(child Goodyear-blimp))
	(isa (parent Special)(child Spirit-of-St.-Louis))
	(isa (parent DC-9)(child Air-force-1))
)

(deftemplate shape
	(slot parent)
	(slot child)
)
(deffacts hasshape
	(shape (parent balloon)(child round))
	(shape (parent blimp)(child elipeodal))
)
