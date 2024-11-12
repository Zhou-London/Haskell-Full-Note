import Data.Char

square :: (Integral a) => a->a
square x = x * x

pyth :: (Integral a) => a->a->a
pyth a b = (square a ) + (square b)

isTriple :: (Integral a) => a->a->a->Bool
isTriple a b c = if (pyth a b) == (square c) then True else False

isTripleAny :: (Integral a) => a->a->a->Bool
isTripleAny a b c =
    if pyth a b == square c || pyth a c == square b || pyth b c == square a
        then True
        else False

halfEvens :: (Integral a) => [a] -> [a]
halfEvens xs = [if x `mod` 2 == 0 then div x 2 else x| x <- xs]

inRange :: (Integral a) => a->a->[a]->[a]
inRange st ed xs = [ x |(i,x) <- (zip [1..] xs), i>=st, i<=ed]

countPositives :: (Integral a) => [a]->a
countPositives xs = sum [1| x<- xs, x > 0]

capitalised :: String -> String
capitalised xs = [if xs !! 0 == x then toUpper x else toLower x | x<-xs]

title :: [String] -> [String]
title xs = [if ((length x) > 3 || xs !! 0 == x) then capitalised x else [toLower a| a<-x] | x<- xs]