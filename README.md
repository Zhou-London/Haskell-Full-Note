# Haskell Learning Notes

Written by Zhou, UG CS Student at UCL
Reference: Miran Lipovaca, Learn you a Haskell for great good.

# 1.Principles

Haskell is a Parallel Computation Language which is widely used by FaceBook and Tesla.

## Environment/Code editor

install ghci

		sudo apt -install ghci
		//I don't really remember this

Professor uses vim

		sudo apt -install vim

Vscode as well

		sudo apt -install code
		//I don't really like it for haskell

## Compile/Run

		ghci //Enter ghci
		ghci> :l your_program_name //Load the source file
		ghci> your_program_name parameter //Play with the function you have written in source file
		:quit //Leave ghci

## Basic

Parenthesis doesn't mean the parameter but the priority of execution of functions

		function (x+y)*z

To call function: Function name + space + parameter

		sum [1,2,3,4,5]

If-sentence: "else" is mandatory. Can use "()" in a long expression

		bomb xs = [if x > 2 then "bomb" else "boom" | x <-xs]

Function can not start with uppercase

		Hello xs = ... //Not allowed
		hello xs = ... //Fine

Function can be declared

		addThree :: Int -> Int -> Int -> Int //The former three stands for x,y,z and the last one stands for the result
		addThree x y z = x + y + z

## Pattern Matching

In C, if we want to check whether the input number is 7

		int check(int a){
			if(a == 7){
				return 1;
			}
			return 0;
		}

In Haskell, we use Pattern Matching to do that

		check :: (Integral a) => a -> String //This is a typeclass thing, see section Type for more.
		check 7 = "That is!" //specify what would happen at 7
		check x = "No"

You can consider it as a case sentence as well

		sayyou :: (Integral a) => a -> String //See section Type you will then understand this line
		sayyou 1 = "sayme" //specify what would happen at 1
		sayyou 2 = "say it always"
		sayyou 3 = "the way it should be"
		sayyou x = "sayme"

The "else" pattern must be at the bottom

		sayyou x = "sayme" //Don't put it to the top because the function would return immediately

The Pattern Matching is, to specify the part of the function we want and use it.

The Pattern Matching in tuples

		third :: (a,b,c) -> c
		third (_,_,c) -> c //Use _ means we don't care and won't use that parameter
		//We want c, so only specify c and then use it

		addTwo :: (Integral a) => (a,a) -> (a,a) -> (a,a) //See section Type you will then understand this line
		addTwo (x,y) (x2,y2) = (x+x2, y+y2)
		//We want the individual value so specify them

The Pattern Matching in List Comprehension

		//See section List before reading this part
		findSum xs = [a+b | (a,b) <- xs] //We want the individual value of a and b so specify them

		ghci> findSum [(1,2), (3,4)]
		[3,7]

The Pattern Matching in List Operation

		//See section List before reading this part
		head' :: [a] -> [a]
		head' [a:_] = [a] //Specify the first element and leave the rest elements unspecified

		ghci> head' "Hello"
		"H"

		tell :: [a] -> (Show a) => [a] -> String
		tell [] = "No element" //Specify there is only one element which is a "\0"
		tell (a:[]) = "One element" //Specify there are two elements, a value and then a "\0"
		tell (a:b:[]) = "Two element" //Specify there are three elememnts, two value and then a "\0"
		tell (a:b:_) = "More than 3 element" //Only specify the first two elements and leaves the rest unspecified 

		ghci> tell [1,2]
		"Two element"


## Recursion

Recursion can be implemented through Pattern Matching

		factorial :: (Integral a) => a -> a
		factorial 0 = 1 //base case
		factorial x = x * factorial (x-1) //general case

# 2.Lists

Lists in Haskell

## 2.(1)Features and Operations:

Store the same type(for all dimensions)

	ghci> let ls = [1,2,3,4]

Use ":" to extend a string

	ghci> 1:[2,3]
	[1,2,3]

Just like C, String is ended with a "\0", written as "[]"

	ghci> 1:2:3:[]
	[1,2,3]

Lists can be compared between the first different element

	ghci> [1,2,3] < [2,3,4] 
	True

Float is not precise in a range

	ghci> [1.1,1.2..10]

Use "!!" to index

	ghci> [1,2,3] !! 0
	1

Use "++" to fix two lists or strings

	ghci> [1,2,3] ++ [4,5,6]
	[1,2,3,4,5,6]

![alt text](image.png)

Mutiple dimensions array

	ghci> [[1,2,3], [4,5,6]]

	ghci> [[6,6],[1,2,3,4],[99]]


Use Range to generate value quickly

	ghci> [2,4..20]
	[2,4,6,8,10..20]

	ghci> [20,18..1]
	[20,18,16,14,12,10...]

Use take to cut a list

	ghci> take 2 [2,4..20]
	[2,4]

### 2.(2)List comprehension:

Basic principle

	ghci> [x|x <- [50..100], x `mod` 7 == 3]
	[52,59,66,73,80,87,84]

Can be combined with function

	function_name xs = [...|x <- xs]

For two lists

	[x operator y| x <-[...], y<-[...]]

Multiple constriants

	ghci> let function xs = [x | x <-xs, x `elem`['a'..'z']]
	ghci> let "abcDEF"
	"abc"

Nested List Comprehension

	ghci> 



### Tuples in list:

Fromed by "()", (1,2)...

	ghci> [(x,y) | x <-[1,2,3], y <- [1,2,3]]
	[(1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3)]

Tuples and Tripes can NOT be existed in one list

	[(1,2), (2,3,4)] //Error
	[(1,2),(3,4)] //Compiled

Tuples are much more rigid because each different size of tuple is its own type

	[[1,2],[3,4]] //less rigid
	[(1,2),(3,4)] //More rigid
		   	   
Elements in Tuples can be heterogenous

	ghci> ("Hi",1,2)
	("Hi",1,2)

# 3. Command/Function/Operator:

Useful command, functions and operators in Haskell

## 3.(1) General

let: define functions in GHCI rather than in the source file

	ghci> let x = [1,2,3]

:t : takes a value, returns the type

	ghci> :t 1
	1 :: Num p => p

"++": Connnects two lists or strings

	ghci> "hello" ++ "world"
	"helloworld"

":": Prepends one element to a string or list

	ghci> 3:[4,5]
	[3,4,5]

"!!": Find the element at this indice

	ghci> "hello" !! 1
	"e"

"/=": Not equal to

	ghci> 1 /= 2
	True

read: takes a string, returns any possible type of value

	ghci> read "1" + 2
	3

fromIntegral: takes a int, returns a int/float/double value

	ghci> fromIntegral (length [1,2,3,4]) + 3.2
	7.2 //because 3.2 is float

## 3.(2) List/String/Tuples

head: takes a list, returns the first element of a list

	ghci> head [1,2,3]
	1

tail: takes a list, return the rest elements of a list

	ghci> head [1,2,3]
	[2,3]

last: takes a list, return the last element of a list

	ghci> last [1,2,3]
	3

init: takes a list, return every element but the last element of a list

	ghci> init [1,2,3,4,5]
	[1,2,3,4]

length: takes a list, return the length of a list

	ghci> length [1,2,3]
	3

null: takes a list, check whether a list is empty

	ghci> null [1,2,3]
	ghci> True

reverse: takes list, returns a reversed list

	ghci> reverse [1,2,3]
	ghci> [3,2,1]

take: takes an int and a list, return the first int element of a list

	ghci> take 10 [1..10]
	1,2,3,4,5,6,7,8,9,10

drop: takes an int and a list, return except the first int element of a list

	ghci> drop 5 [1..10]
	6,7,8,9,10

cycle: takes a list and repeat it, combined with take
	
	ghci> take 10(cycle [1,2,3])
	[1,2,3,1,2,3,1,2,3,1]

repeat: Same as cycle but only takes one element

	ghci> take 10 (repeat 1)
	[1,1,1,1,1,1,1,1,1,1]

maximum/minimum: takes a list, return the max or min value in a list

	ghci> maximum [2,3,4]
	4

sum: takes a list, return the sum of a list

	ghci> sum [1,2,3]
	6

product: takes a list, return the product of a list

	ghci> product [10,10,10]
	1000

elem: takes a value, check whether the element is inside the array

	ghci> 4 `elem` [3,4,5,6]
	True

fst: takes a tuple, return the first element

	ghci> fst (2,3)
	2

snd: takes a tuple, return the second element

	ghci> snd (2,3)
	3

zip: takes two lists, join them together as one list of tuples

	ghci> zip [1..]["Orange", "Apple", "Banana"]
	[(1,"Orange"),(2,"Apple"),(3,"Banana")]


# 4.Type

int and integer are different data types

Integer can store really big number

	2147483647 //Maximum of int
	? //Maximum of integer

## Type variables

Type can be ignored when declaring the function

	head [a] -> a
	//Takes a list and returns the same type as the element in the list

## Type class

Not like the class in OOP

	//Not like this...
	class Cat{
	private:
		name;
	public:
		Cat(string n): name(n) {}
		string print_name(){
			std::cout << name << "\n";
		}
	};

More like a big dictionary, kind of a constriant on the parameter

	ghci> :t (==)
	(==) :: (Eq a) => a -> a -> Bool

	// "(Eq a) =>" means it can be any type but in the Eq class
	//a is type variable
	//takes two parameter in Eq class and returns a Boolean value

Alongside Eq, Ord is another type class

	ghci> :t (>)
	(>) :: (Eq a) => a -> a -> Bool

Read class

	ghci> :t read
	read :: (Read a) => string -> a
	//Takes a string and return the corresponding type in Read class

Enum class contains all the type that can be ranged

	['A'..'D'] //character is in Enum class
	[1..10] //int is in Enum class

Num class

	[1..10] //int
	[1.1,1.2,10] //float

## Type annotations

Declare the type of the return value

	//read takes a string and returns any possible type
	ghci> read "5" :: int
	5
	ghci> read "5" :: float
	5.0


