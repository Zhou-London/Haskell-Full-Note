sqList :: [Integer] -> [Integer]
sqList = map (\x -> x*x)

sumSqList :: [Integer] -> Integer
sumSqList = foldr (+) 0 . sqList

posList :: [Integer] -> Bool
posList = foldr (&&) True . map(>0)