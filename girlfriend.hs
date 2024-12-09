import System.IO
import Data.Char

main_1 = do
    handle <- openFile "girlfriend.txt" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle
    --Traditional way

main_2 = withFile "girlfriend.txt" ReadMode(\handle -> do
    contents <- hGetContents handle
    putStr contents)
    --using withFile, more elegant

main_3 = do
    contents <- readFile "girlfriend.txt"
    putStr contents
    --using readFile, only suitable for reading the file

main = do
    contents <- readFile "girlfriend.txt"
    writeFile "girlfriendcaps.txt" (map toUpper contents)