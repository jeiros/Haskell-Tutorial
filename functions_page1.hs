-- Functions from http://learnyouahaskell.com/starting-out

doubleMe x = x*2

doubleUs x y = x*2 + y*2 
-- Could also be doubleUs x y = doubleMe x + doubleMe y



-- a function that multiplies a number by 2 but only if
-- that number is smaller than or equal to 100
doubleSmallNumber x = if x > 100
	then x
	else doubleMe x -- elses in Haskell are mandatory

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1
-- We usually use ' to either denote a strict version of
-- a function (one that isn't lazy) or a slightly modified
-- version of a function or a variable


-- Using list comprehension for functions

length' xs = sum [1 | _ <- xs] -- Modified version of length

-- _ means that we don't care what we'll draw from the list anyway
-- so instead of writing a variable name that we'll never use, we
--  just write _. This function replaces every element of a list
--  with 1 and then sums that up. This means that the resulting 
--  sum will be the length of our list.



removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

--a function that takes a string and removes everything except
--uppercase letters from it.


--Using list comprehensions to solve the following question

--which right triangle that has integers for all sides and 
--all sides equal to or smaller than 10 has a perimeter of 24?



-- All triangles that have sides equal or smaller than 10

triangles = [ (a,b,c) | a <- [1..10], b <- [1..10], c<- [1..10]]



-- Now make them to be right triangles (a^2 + b^2 = c^2)
-- Also let's force c to be the hypotenuse

rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2 ]


-- Finally, let's add the fact that the perimeter must be equal to 24

rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24 ]


-- The solution is [(6,8,10)]