-- Functions from http://learnyouahaskell.com/syntax-in-functions

lucky :: (Integral a) => a -> String
lucky x =
  if x == 7
    then "LUCKY NUMBER SEVEN!"
    else "Sorry, out of luck"

-- Using pattern matching
lucky' :: (Integral a) => a -> String
lucky' 7 = "LUCKY NUMBER SEVEN"
lucky' x = "Sorry, out of luck"

-- Defining the factorial recursively
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Adding 2D vectors using pair tuples
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- Creating the triple tuple versions of
-- fst and snd (those only work on pair tuples)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

-- Alternative implementation of the head function
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x : _) = x

-- trivial function that tells us some of the first
-- elements of the list in (in)convenient English form.
tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x : []) = "The list has one element: " ++ show x
tell (x : y : []) =
  "The list has two elements: " ++ show x
    ++ " and "
    ++ show y
tell (x : y : _) =
  "This list is long. The first two elements are: " ++ show x
    ++ " and "
    ++ show y

-- implementing length using pattern matching
-- and recursion
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_ : xs) = 1 + length' xs

-- implementing sum
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x : xs) = x + sum' xs

-- Using Guards
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
  | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
  | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
  | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"

-- implementing max using Guards
max' :: (Ord a) => a -> a -> a
max' a b
  | a > b = a
  | otherwise = b

-- Not only can we call functions as infix with backticks,
-- we can also define them using backticks. Sometimes it's
-- easier to read that way.
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a > b = GT
  | a == b = EQ
  | a < b = LT

-- Redefining bmiTell using a where binding
-- to not repeat ourselves
bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' weight height
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
  | bmi <= fat = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"
  where
    bmi = weight / height ^ 2
    (skinny, normal, fat) = (18.5, 25.0, 30.0)

-- You can also define new functions in the where blocks
-- This function takes a list of (weight, height) pair tuples
-- and returns a list with the bmis for each pair
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
  where
    bmi weight height = weight / height ^ 2

cylinderArea :: (RealFloat a) => a -> a -> a
cylinderArea r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r ^ 2
   in sideArea + 2 * topArea

-- Redefining calcBmis using let bindings
-- inside list comprehensions
calcBmis' :: (RealFloat a) => [(a, a)] -> [a]
calcBmis' xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

-- Case expressions
head'' :: [a] -> a
head'' xs = case xs of
  [] -> error "No head for empty lists!"
  (x : _) -> x

-- Case expressions can be used anywhere

describeList :: [a] -> String
describeList xs =
  "The list is "
    ++ case xs of
      [] -> "empty."
      [x] -> "a singleton list."
      xs -> "a longer list."

-- This could have also been
describeList' :: [a] -> String
describeList' xs = "The list is " ++ what xs
  where
    what [] = "empty."
    what [x] = "a singleton list."
    what xs = "a longer list."
