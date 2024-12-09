import System.IO
import System.Directory

import Data.List

main_ = do
    todoItem <- getLine
    appendFile "todo.txt" (todoItem ++ "\n")

main = do
    handle <- openFile "todo.txt" ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ "-" ++ line) [0..] todoTasks
    putStrLn "Your todo Item lists"
    putStr $ unlines numberedTasks
    putStrLn "Which to delete?"
    numberString <- getLine
    let number = read numberString
        newtodoItems = delete (todoTasks !! number) todoTasks
    hPutStr tempHandle $ unlines newtodoItems
    hClose handle
    hClose tempHandle
    removeFile "todo.txt"
    renameFile tempName "todo.txt"