-- Functions from http://learnyouahaskell.com/syntax-in-functions


lucky :: (Integral a) => a -> String
lucky x = if x ==7
	then "LUCKY NUMBER SEVEN!"
	else "Sorry, out of luck"

-- Using pattern matching
lucky' :: (Integral a) => a -> String
lucky' 7 = "LUCKY NUMBER SEVEN"
lucky' x = "Sorry, out of	luck"


-- Defining the factorial recursively
factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1) 