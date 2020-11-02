(define
	(domain sokoban)
	(:requirements :adl)
	(:predicates
		(robot ?x)
		(poziomo ?x ?y)
		(pionowo ?x ?y)
		(paczka ?x)
		(cel ?x)
	)
	; przesuń robota
	(:action idz
		:parameters (?x ?y)
		:precondition
		(or
			(and
				(not(paczka ?y))
				(not(= ?x ?y))
				(robot ?x)
				(poziomo ?x ?y))
			(and 
				(pionowo ?x ?y)
				(not(paczka ?y))
				(not(= ?x ?y))
				(robot ?x))
		)
		:effect
		(and
			(not (robot ?x))
			(robot ?y)
		)
	)
	; przesuń paczke
	(:action pchaj
		:parameters (?x ?y ?z)
		:precondition
	(or
		(and
			(paczka ?y)
			(robot ?x)
			(not(= ?x ?y))
			(not(= ?x ?z))
			(not(= ?z ?y))
			(poziomo ?x ?y)
			(poziomo ?y ?z)
			(not(paczka ?z)))
		(and
			(paczka ?y)
			(robot ?x)
			(not(= ?x ?y))
			(not(= ?x ?z))
			(not(= ?z ?y))
			(pionowo ?x ?y)
			(pionowo ?y ?z)
			(not(paczka ?z)))
	)
		:effect
		(and
			(paczka ?z)
			(not (paczka ?y))
			(not (robot ?x))
			(robot ?y)
		)
	)
)