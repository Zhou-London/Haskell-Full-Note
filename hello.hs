main = do 
    putStrLn "hello, what's your name"
    name <- getLine
    putStrLn $ "Hello " ++ name ++ " you rock!"