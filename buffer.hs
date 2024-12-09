import System.IO

main = do
    withFile "sample.txt" ReadMode (\handle -> do
        hSetBuffering handle $ BlockBuffering $ Just 2048
        contents <- hGetContents handle
        putStr contents)