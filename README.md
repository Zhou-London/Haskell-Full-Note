# Haskell Learning Notes

Written by Zhou, UG CS Student at UCL
Reference: Miran Lipovaca, Learn you a Haskell for great good.

# 1.Principles

0. Compile/Run

		ghci //Enter ghci
		ghci> :l your_program_name //Load the source file
		ghci> your_program_name parameter //Play with the function you have written in source file
		:quit //Leave ghci

1. Parenthesis doesn't mean the parameter but the priority of execution of functions

2. To call function: Function name + space + parameter

		sum [1,2,3,4,5]

3. If-sentence: "else" is mandatory. Can use "()" in a long expression

4. Function can not start with uppercase

		Hello xs = ... //Not allowed
		hello xs = ... //Fine

5. What means "Definition"?: Function who does NOT take any parameter

# 2.Lists
## 2.(1)Lists-Feature:
Store the same type(for all dimensions)

Actually formed by using ":"

	[1,2,3] is 1:2:3:[]

Lists can be compared between the first different element

Float is not precise in a range

## 2.(2)List-Operation:
Mutiple dimensions array

	[[1,2,3], [4,5,6]]

Compare

	[3,2,1] > [3,1,1]

Range

	[2,4..20] //returns [2,4,6,8,10..20]
	[20,18..1] //returns [20,18,16,14,12,10...]

### 2.(3)List comprehension:
[x|x <- [50..100], x `mod` 7 == 3] returns [52,59,66,73,80,87,84]

Can be combined with function

	function_name xs = [...|x <- xs]

For two lists

	[x operator y| x <-[...], y<-[...]]

### List Tuples:
Fromed by "()", (1,2)...

	[(x,y) | x<-(1..10), y<-(1..10)>]

Tuples and Tripes can NOT be existed in one list

Tuples are much more rigid because each different size of tuple is its own type
		   	   

# 3. Command/Function/Operator:

## 3.(1) General
let: define functions in GHCI rather than in the source file

	let x = [1,2,3]

:t : takes a value, returns the type

	:t x //returns int

"++": Connnects two lists or strings

":": Prepends one element to a string or list

	3:[4,5] //return[3,4,5]

"!!": Find the element at this indice

"/=": Not equal to

## 3.(2) List/String/Tuples
head: takes a list, returns the first element of a list

	head x //returns 1

tail: takes a list, return the rest elements of a list

last: takes a list, return the last element of a list

init: takes a list, return every element but the last element of a list

length: takes a list, return the length of a list

null: takes a list, check whether a list is empty

	null x //returns false

reverse: takes list, returns a reversed list

take: takes an int and a list, return the first int element of a list

	take 10 [1..10] //returns 1,2,3,4,5,6,7,8,9,10

drop: takes an int and a list, return except the first int element of a list

	drop 5 [1..10] //6,7,8,9,10

cycle: takes a list and repeat it, combined with take
	
	take 10(cycle [1,2,3]) //returns [1,2,3,1,2,3,1,2,3,1]

repeat: Same as cycle but only takes one element

maximum/minimum: takes a list, return the max or min value in a list

sum: takes a list, return the sum of a list

product: takes a list, return the product of a list

elem: takes a value, check whether the element is inside the array

	4 `elem` [3,4,5,6] //returns True

fst: takes a tuple, return the first element

	fst (2,3) //returns 2

snd: takes a tuple, return the second element

zip: takes two lists, join them together as one list of tuples

	zip [1..]["Orange", "Apple", "Banana"]