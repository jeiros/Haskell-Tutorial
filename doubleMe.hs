doubleMe x = x*2

doubleSmallNumber x = if x > 100
	then x
	else doubleMe x