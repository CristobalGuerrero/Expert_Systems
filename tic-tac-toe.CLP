;Cristobal Guerrero, Diego Galvan

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					       ;
;Demplate definitions for each area in the grid;
;					       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deftemplate ul (slot state))
(deftemplate ml (slot state))
(deftemplate ll (slot state))
(deftemplate um (slot state))
(deftemplate mm (slot state))
(deftemplate lm (slot state))
(deftemplate ur (slot state))
(deftemplate mr (slot state))
(deftemplate lr (slot state))
(deftemplate turn (slot state))
(deftemplate position (slot pos))

(deffacts initial-state
 	(ul (state nothing))
	(ml (state nothing))
	(ll (state nothing))
	(um (state nothing))
	(mm (state nothing))
	(lm (state nothing))
	(ur (state nothing))
	(mr (state nothing))
	(lr (state nothing))
	(turn(state choice))
	(position(pos none))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					;
;	Set up for who goes first	;
;					;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule initial-set-up
	(turn(state choice))
	=>
	(printout t "Who moves first? (Computer: O, Human: X) ")
	(bind ?turn (read))
	(assert (turn (state ?turn)))
)

;optional blocking
(defrule option1
	(mm(state O))
	(ur(state X))
	(ll(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ll(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-left of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule option1.1
	(mm(state O|X))
	(ul(state X))
	(lr(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (lr(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-left of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule option1.2
	(mm(state O))
	(ll(state X))
	(ur(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ur(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-left of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule option1.3
	(mm(state O))
	(lr(state X))
	(ul(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ul(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-left of the board " crlf 
		"The computer blocked you" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The clips program should check if there is two in a row       ;
;first before placing any pieces down. This should be repeated ;
;to block the opponent. This should be repeated for each       ;
;instance. This portion is for the middle instance being filled;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule two-in-row1
	(mm(state O))
	(um(state O))
	(lm(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (lm(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-middle of the board " crlf 
		"The computer wins" crlf)
)

(defrule two-in-row1.1
	(mm(state O))
	(ur(state O))
	(ll(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ll(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-left of the board " crlf 
		"The computer wins" crlf)
)

(defrule two-in-row1.2
	(mm(state O))
	(mr(state O))
	(ml(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ml(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-left of the board " crlf 
		"The computer wins" crlf)
)

(defrule two-in-row1.3
	(mm(state O))
	(lr(state O))
	(ur(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ur(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the upper-right of the board " crlf 
		"The computer wins" crlf)
)

(defrule two-in-row1.4
	(mm(state O))
	(lm(state O))
	(um(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (um(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the upper-middle of the board " crlf 
		"The computer wins" crlf)
)

(defrule two-in-row1.5
	(mm(state O))
	(ll(state O))
	(ur(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ur(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the upper-right of the board " crlf 
		"The computer wins" crlf)
)

(defrule two-in-row1.6
	(mm(state O))
	(ml(state O))
	(mr(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (mr(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-right of the board " crlf 
		"The computer wins" crlf)
)

(defrule two-in-row1.7
	(mm(state O))
	(ul(state O))
	(lr(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (lr(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-right of the board " crlf 
		"The computer wins" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The clips program should check if there is two in a row       ;
;first before placing any pieces down. This should be repeated ;
;to block the opponent. This should be repeated for each       ;
;instance. This portion is for the upper-left instance being   ;
;filled							       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule upper-left-in-row1
	(ul(state O))
	(ml(state O))
	(ll(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ll(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-left of the board " crlf 
		"The computer wins" crlf)
)

(defrule upper-left-in-row1.2
	(ul(state O))
	(ll(state O))
	(ml(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ml(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-left of the board " crlf 
		"The computer wins" crlf)
)

(defrule upper-left-in-row1.3
	(ul(state O))
	(lr(state O))
	(mm(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (mm(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-middle of the board " crlf 
		"The computer wins" crlf)
)

(defrule upper-left-in-row1.4
	(ul(state O))
	(um(state O))
	(ur(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ur(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the upper-right of the board " crlf 
		"The computer wins" crlf)
)

(defrule upper-left-in-row1.5
	(ul(state O))
	(ur(state O))
	(um(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (um(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the upper-middle of the board " crlf 
		"The computer wins" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The clips program should check if there is two in a row       ;
;first before placing any pieces down. This should be repeated ;
;to block the opponent. This should be repeated for each       ;
;instance. This portion is for the upper-middle instance being ;
;filled							       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule upper-middle-in-row1
	(um(state O))
	(ur(state O))
	(ul(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ul(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the upper-left of the board " crlf 
		"The computer wins" crlf)
)

(defrule upper-middle-in-row1.2
	(um(state O))
	(lm(state O))
	(mm(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (mm(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-middle of the board " crlf 
		"The computer wins" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The clips program should check if there is two in a row       ;
;first before placing any pieces down. This should be repeated ;
;to block the opponent. This should be repeated for each       ;
;instance. This portion is for the upper-right instance being  ;
;filled							       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule upper-right-in-row1
	(ur(state O))
	(ll(state O))
	(mm(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (mm(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-middle of the board " crlf 
		"The computer wins" crlf)
)

(defrule upper-right-in-row1.2
	(ur(state O))
	(mr(state O))
	(lr(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (lr(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-right of the board " crlf 
		"The computer wins" crlf)
)

(defrule upper-middle-in-row1.3
	(ur(state O))
	(lr(state O))
	(mr(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (mr(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-right of the board " crlf 
		"The computer wins" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The clips program should check if there is two in a row       ;
;first before placing any pieces down. This should be repeated ;
;to block the opponent. This should be repeated for each       ;
;instance. This portion is for the lower-left instance being   ;
;filled							       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule lower-left-in-row1
	(ll(state O))
	(lm(state O))
	(lr(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (lr(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-right of the board " crlf 
		"The computer wins" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The clips program should check if there is two in a row       ;
;first before placing any pieces down. This should be repeated ;
;to block the opponent. This should be repeated for each       ;
;instance. This portion is for the lower-middle instance being ;
;filled							       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule lower-middle-in-row1
	(ll(state O))
	(lm(state O))
	(lr(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (lr(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-right of the board " crlf 
		"The computer wins" crlf)
)
;start blocking
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The clips program should check if there is two in a row       ;
;first before placing any pieces down. This should be repeated ;
;to block the opponent. This should be repeated for each       ;
;instance. This portion is for the middle instance being filled;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule block-two-in-row1
	(mm(state X))
	(um(state X))
	(lm(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (lm(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-middle of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-two-in-row1.1
	(mm(state X))
	(ur(state X))
	(ll(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ll(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-left of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-two-in-row1.2
	(mm(state X))
	(mr(state X))
	(ml(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ml(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-left of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-two-in-row1.3
	(mm(state X))
	(lr(state X))
	(ul(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ul(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the upper-right of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-two-in-row1.4
	(mm(state X))
	(lm(state X))
	(um(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (um(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the upper-middle of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-two-in-row1.5
	(mm(state X))
	(ll(state X))
	(ur(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ur(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the upper-right of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-two-in-row1.6
	(mm(state X))
	(ml(state X))
	(mr(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (mr(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-right of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-two-in-row1.7
	(mm(state X))
	(ul(state X))
	(lr(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (lr(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-right of the board " crlf 
		"The computer blocked you" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The clips program should check if there is two in a row       ;
;first before placing any pieces down. This should be repeated ;
;to block the opponent. This should be repeated for each       ;
;instance. This portion is for the upper-left instance being   ;
;filled							       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule block-upper-left-in-row1
	(ul(state X))
	(ml(state X))
	(ll(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ll(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-left of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-upper-left-in-row1.2
	(ul(state X))
	(ll(state X))
	(ml(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ml(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-left of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-upper-left-in-row1.3
	(ul(state X))
	(lr(state X))
	(mm(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (mm(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-middle of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-upper-left-in-row1.4
	(ul(state X))
	(um(state X))
	(ur(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ur(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the upper-right of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-upper-left-in-row1.5
	(ul(state X))
	(ur(state X))
	(um(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (um(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the upper-middle of the board " crlf 
		"The computer blocked you" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The clips program should check if there is two in a row       ;
;first before placing any pieces down. This should be repeated ;
;to block the opponent. This should be repeated for each       ;
;instance. This portion is for the upper-middle instance being ;
;filled							       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule block-upper-middle-in-row1
	(um(state X))
	(ur(state X))
	(ul(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (ul(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the upper-left of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-upper-middle-in-row1.2
	(um(state X))
	(lm(state X))
	(mm(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (mm(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-middle of the board " crlf 
		"The computer blocked you" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The clips program should check if there is two in a row       ;
;first before placing any pieces down. This should be repeated ;
;to block the opponent. This should be repeated for each       ;
;instance. This portion is for the upper-right instance being  ;
;filled							       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule block-upper-right-in-row1
	(ur(state X))
	(ll(state X))
	(mm(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (mm(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-middle of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-upper-right-in-row1.2
	(ur(state X))
	(mr(state X))
	(lr(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (lr(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-right of the board " crlf 
		"The computer blocked you" crlf)
)

(defrule block-upper-middle-in-row1.3
	(ur(state X))
	(lr(state X))
	(mr(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (mr(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-right of the board " crlf 
		"The computer blocked you" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The clips program should check if there is two in a row       ;
;first before placing any pieces down. This should be repeated ;
;to block the opponent. This should be repeated for each       ;
;instance. This portion is for the lower-left instance being   ;
;filled							       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule block-lower-left-in-row1
	(ll(state X))
	(lm(state X))
	(lr(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (lr(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-right of the board " crlf 
		"The computer blocked you" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The clips program should check if there is two in a row       ;
;first before placing any pieces down. This should be repeated ;
;to block the opponent. This should be repeated for each       ;
;instance. This portion is for the lower-middle instance being ;
;filled							       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule block-lower-middle-in-row1
	(ll(state X))
	(lr(state X))
	(lm(state nothing))
	(turn (state O))
	?turn  <- (turn(state O)) 
	?phase <- (lm(state nothing)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-right of the board " crlf 
		"The computer blocked you" crlf)
)
;end blocking

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;This part of the program chooses the place where the piece ;
;will be placed. Now this can be reordered in order for it  ;
;to be favorable for the computer.                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule empty-board
	(mm (state nothing))
	(turn (state O))
	?phase <- (mm(state nothing))
	?turn  <- (turn(state O)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t crlf "O placed in the middle of the board " crlf )
)

(defrule one-piece1.1
	(ur (state nothing))
	(mm (state O|X))
	(turn (state O))
	?phase <- (ur(state nothing))
	?turn  <- (turn(state O)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t crlf"O placed in the upper-right of the board " crlf )
)

(defrule one-piece1.2
	(lr (state nothing))
	(mm (state O|X))
	(turn (state O))
	?phase <- (lr(state nothing))
	?turn  <- (turn(state O))  
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-right of the board " crlf )
)

(defrule one-piece1.3
	(ll (state nothing))
	(mm (state O|X))
	(turn (state O))
	?phase <- (ll(state nothing))
	?turn  <- (turn(state O))  
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-left of the board " crlf )
)

(defrule one-piece1.4
	(ul (state nothing))
	(mm (state O|X))
	(turn (state O))
	?phase <- (ul(state nothing))
	?turn  <- (turn(state O))  
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))	
	(printout t ?phase " placed in the middle-left of the board " crlf )
)

(defrule one-piece1.5
	(um (state nothing))
	(mm (state O|X))
	(turn(state O))
	?phase <- (um(state nothing))
	?turn  <- (turn(state O)) 
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase crlf"O placed in the upper-middle of the board " crlf )
)

(defrule one-piece1.6
	(mr (state nothing))
	(mm (state O|X))
	(turn (state O))
	?phase <- (mr(state nothing))
	?turn  <- (turn(state O))  
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t crlf "O placed in the middle-right of the board " crlf )
)

(defrule one-piece1.7
	(lm (state nothing))
	(mm (state O|X))
	(turn (state O))
	?phase <- (lm(state nothing))
	?turn  <- (turn(state O))  
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the lower-middle of the board " crlf )
)

(defrule one-piece1.8
	(ml (state nothing))
	(mm (state O|X))
	(turn (state O))
	?phase <- (ml(state nothing))
	?turn  <- (turn(state O))  
	=>
	(modify ?phase(state O))
	(modify ?turn (state X))
	(printout t ?phase " placed in the middle-left of the board " crlf )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;						;
;		Human Turn			;
;						;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule human_turn
	(turn (state X))
	?posi <- (position (pos none))
	=>
	(printout t "Where would you like to place your piece? ")
	(bind ?block (read))
	(modify ?posi (pos ?block))
	(printout t "Switching back to the computer." crlf)
)

(defrule placehuman1
	(turn (state X))
	(position ( pos ur ))
	?spot <- ( ur (state nothing))
	?turn <- (turn (state X))
	?posi <- (position (pos ur))
	=>
	(modify ?spot (state X))
	(modify ?turn (state O))
	(modify ?posi (pos none))
	(retract ?posi)
)

(defrule placehuman1.1
	(turn (state X))
	(position ( pos ul ))
	?spot <- ( ul (state nothing))
	?turn <- (turn (state X))
	?posi <- (position (pos ul))
	=>
	(modify ?spot (state X))
	(modify ?turn (state O))
	(modify ?posi (pos none))
	(retract ?posi)
)

(defrule placehuman1.2
	(turn (state X))
	(position ( pos um ))
	?spot <- ( um (state nothing))
	?turn <- (turn (state X))
	?posi <- (position (pos um))
	=>
	(modify ?spot (state X))
	(modify ?turn (state O))
	(modify ?posi (pos none))
	(retract ?posi)
)

(defrule placehuman1.3
	(turn (state X))
	(position ( pos mr ))
	?spot <- ( mr (state nothing))
	?turn <- (turn (state X))
	?posi <- (position (pos mr))
	=>
	(modify ?spot (state X))
	(modify ?turn (state O))
	(modify ?posi (pos none))
	(retract ?posi)
)

(defrule placehuman1.4
	(turn (state X))
	(position ( pos lr ))
	?spot <- ( lr (state nothing))
	?turn <- (turn (state X))
	?posi <- (position (pos lr))
	=>
	(modify ?spot (state X))
	(modify ?turn (state O))
	(modify ?posi (pos none))
	(retract ?posi)
)

(defrule placehuman1.5
	(turn (state X))
	(position ( pos lm ))
	?spot <- ( lm (state nothing))
	?turn <- (turn (state X))
	?posi <- (position (pos lm))
	=>
	(modify ?spot (state X))
	(modify ?turn (state O))
	(modify ?posi (pos none))
	(retract ?posi)
)

(defrule placehuman1.6
	(turn (state X))
	(position ( pos ll ))
	?spot <- ( ll (state nothing))
	?turn <- (turn (state X))
	?posi <- (position (pos ll))
	=>
	(modify ?spot (state X))
	(modify ?turn (state O))
	(modify ?posi (pos none))
	(retract ?posi)
)

(defrule placehuman1.7
	(turn (state X))
	(position ( pos ml ))
	?spot <- ( ml (state nothing))
	?turn <- (turn (state X))
	?posi <- (position (pos ml))
	=>
	(modify ?spot (state X))
	(modify ?turn (state O))
	(modify ?posi (pos none))
	(retract ?posi)
)

(defrule placehuman1.8
	(turn (state X))
	(position ( pos mm ))
	?spot <- ( mm (state nothing))
	?turn <- (turn (state X))
	?posi <- (position (pos mm))
	=>
	(modify ?spot (state X))
	(modify ?turn (state O))
	(modify ?posi (pos none))
	(retract ?posi)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;						;
;		Grid Print			;
;						;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
