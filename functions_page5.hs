-- Functions from http://learnyouahaskell.com/higher-order-functions

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

multTwoWithNine :: (Num a) => a -> a -> a
multTwoWithNine = multThree 9

multWithEighteen :: (Num a) => a -> a
multWithEighteen = multTwoWithNine 2
