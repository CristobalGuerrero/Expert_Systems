(deftemplate Family
	(slot name)
	(slot spouse)
	(multislot children)
	(multislot sibling)
	(multislot parent))


	(Family (name Ann)(spouse Bill)(children Susan)(sibling Carol)(parent None))
	(Family (name Bill)(spouse Ann)(children Susan)(sibling None)(parent None))
	(Family (name Susan)(spouse Tom)(children John)(sibling None)(parent Bill Ann))
	(Family (name John)(spouse None)(children None)(sibling None)(parent Susan Tom))
	(Family (name Tom)(spouse Susan)(children John)(sibling None)(parent David Carol))
	(Family (name David)(spouse Carol)(children Tom)(sibling None)(parent None))
	(Family (name Carol)(spouse David)(children Tom)(sibling Ann)(parent None))

	