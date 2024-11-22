import Data.Char
import Data.ByteString (count)
import GHC.Base (VecElem(Int16ElemRep))
import Text.Read (Lexeme(Char, String))
import Distribution.Parsec (CabalParsing)

inRange :: Int -> Int -> [Int] -> [Int]
inRange a b [] = []
inRange a b (x:xs) | x >= a && x <= b = x: inRange a b xs
                   | otherwise = inRange a b xs

countPositive :: [Int] -> Int
countPositive [] = 0
countPositive (x:xs) | x > 0 = 1 + countPositive xs
                     | otherwise = countPositive xs

capitalised :: String -> String
capitalised [] = []
capitalised (x:xs) = toUpper x : map toLower xs

title :: [String] -> [String]
title [] = []
title (x:xs) = capitalised x : continue xs
    where
        continue [] = []
        continue (y:ys) | length y > 3 = capitalised y : continue ys
                        | otherwise = map toLower y : continue ys

isort :: (Ord a) => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs)


insert :: (Ord a) => a -> [a] -> [a]
insert a [] = [a]
insert a (y:ys) | a<=y = a:y:ys
                | otherwise = y:insert a ys

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] [] = []
merge a [] = a
merge [] b = b
merge (x:xs) (y:ys) | x <= y = x : merge xs (y:ys)
                    | otherwise = y : merge (x:xs) ys

rotor :: Int -> String -> String
rotor a [] = []
rotor a xs | a < 0 || a >= length xs = error "No you can not do that"
           | otherwise = convert a xs
    where
        convert :: Int -> String -> String
        convert b [] = []
        convert b (x:xs) = chr(if ord x + b > 122 || ord x + b > 90 then ord x + b - 26 else ord x + b) : convert b xs

makeKey :: Int -> [(Char,Char)]
makeKey a = zip ['A'..'Z'] (rotor a ['A'..'Z'])

lookUp :: Char -> [(Char,Char)] -> Char
lookUp c [] = c
lookUp c ((a,b):xs) = if c == a then b else lookUp c xs

encipher :: Int -> Char -> Char
encipher a x | ord x + a > 122 || ord x + a > 90 = chr(ord x + a - 26)
             | otherwise = chr(ord x + a)

normalise :: String -> String
normalise [] = []
normalise (x:xs) | isLetter' x = toUpper x : normalise xs
                 | isNumber' x = x : normalise xs
                 | otherwise = normalise xs
    where
        isLetter' :: Char -> Bool
        isLetter' c | ord c > 64 && ord c < 91 = True
                    | ord c > 96 && ord c < 123 = True
                    | otherwise = False
        isNumber' :: Char -> Bool
        isNumber' c | ord c > 47 && ord c < 58 = True
                    | otherwise = False

encipherStr :: Int -> String -> String
encipherStr a xs = map (encipher a) (normalise xs)
