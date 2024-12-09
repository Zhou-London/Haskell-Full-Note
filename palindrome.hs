import Control.Monad
import Distribution.Simple.Command (OptDescr(BoolOpt))

palindrome = unlines . map (\line -> if isPalindrome line then "Palindrome" else "Not palindrome") . lines
    where
        isPalindrome :: String -> Bool
        isPalindrome xs = xs == reverse xs

main = interact palindrome