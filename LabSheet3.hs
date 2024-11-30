import Distribution.SPDX (LicenseExceptionId(Bootloader_exception))
mult :: (Num a) => [a] -> a
mult = foldr (*) 1

posList :: (Ord a, Num a) => [a] -> [a]
posList = filter (>0) -- Function ">" only works on class Ord

trueList :: [Bool] -> Bool
trueList = foldr (&&) True

evenList :: (Integral a) => [a] -> Bool
evenList = foldr (&&) True . map (even) --function "even" only works on class Integral

maxList :: (Ord a) => [a] -> a
maxList = foldr1 (max)

inRange :: Int -> Int -> [Int] -> [Int]
inRange a b= filter (\x -> x >= a && x <= b)

countPos :: (Ord a, Num a) => [a] -> Int
countPos xs = length $ filter (>0) xs

myLength :: [a] -> Int
myLength = foldr (+)0 . map(\x -> 1)

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\x acc -> f x : acc) []

myLength' :: (Num a) => [a] -> Int
myLength' = foldr ((+) . (\x -> 1)) 0





--Tutor session
cubeList :: (Num a) => [a] -> a
cubeList = foldr ((+) . (\x -> x*x*x)) 0

sqrList :: Int
sqrList = head [x | x <- [1000001..], x `elem` map (\x -> x*x) [1000..1010]]

data Tree a = Leaf a | Node (Tree a) a (Tree a)