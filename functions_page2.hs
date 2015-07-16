-- Functions from http://learnyouahaskell.com/types-and-typeclasses

-- Giving explicit type declaration
removeNonUppercase :: [Char] -> [Char]  
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
-- It maps from a string to a string (a string is a list of Characters)

-- Parameters are separated with -> and are not differentiated 
-- from the return type
addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z



-- Integer is the same type as Int but larger
-- (and less efficient)
factorial :: Integer -> Integer  
factorial n = product [1..n]

-- [1..0] is [] and product [] is 0 by definition


-- Float is a real floating point with single precision.
circumference :: Float -> Float  
circumference r = 2 * pi * r
--  ghci> circumference 4.0  
--  25.132742  

-- Double is a real floating point with double the precision!
circumference' :: Double -> Double  
circumference' r = 2 * pi * r  
--  ghci> circumference' 4.0  
--  25.132741228718345  

