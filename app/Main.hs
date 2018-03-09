{-# LANGUAGE OverloadedStrings #-}
module Main where

import Network.Wai (Application, responseLBS)
import Network.HTTP.Types (status200)
import Network.Wai.Handler.Warp (run)

-- import Args (getArgs)

app :: Application
app _ respond = do
  putStrLn "Hi!"
  respond $ responseLBS
    status200
    [("Content-Type", "text/plain")]
    "Hello, Web!"

main :: IO ()
main = do
  putStrLn $ "Http Server has started on port 8080"
  run 80 app
