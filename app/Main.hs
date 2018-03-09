{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}
module Main where

import Network.Wai (Application, responseLBS)
import Network.HTTP.Types (status200)
import Network.Wai.Handler.Warp (run)
import System.Environment (lookupEnv)
import Text.Read (readMaybe)
import Data.Monoid ((<>))

-- import Args (getArgs)

app :: Application
app _ respond = do
  putStrLn "Hi!"
  respond $ responseLBS
    status200
    [("Content-Type", "text/plain")]
    "Hello, Web!" <> "\n It's working."

main :: IO ()
main = do
  envPort <- lookupEnv "PORT"
  putStrLn $ "env[PORT]:" <> (show envPort)
  herokuPort <- (>>= readMaybe) <$> lookupEnv "PORT"
  let port = maybe 8080 id $ herokuPort
  putStrLn $ "Listening on port " <> (show port)
  run port app
