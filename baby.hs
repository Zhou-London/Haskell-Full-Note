doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100 then x else doubleMe x

fuckYou xs = [if x `mod` 2 == 0 then "Fuck" else "You" | x <- xs]

length' xs = sum [1 |  _ <-xs]

removeLower xs = [x|x<-xs, x `elem` ['A'..'Z'] ]

findTriangle = [(a,b,c) | c <-[1..10], b<-[1..c], a<-[1..b], a^2 + b^2 == c^2, a+b+c == 24]