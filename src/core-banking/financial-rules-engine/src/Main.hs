{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Network.Wai.Handler.Warp (run)
import           Web.Scotty               (get, json, scottyApp, text)
import           System.Environment       (lookupEnv)
import           Data.Maybe               (fromMaybe)

main :: IO ()
main = do
  portStr <- lookupEnv "PORT"
  let port = read (fromMaybe "60026" portStr) :: Int
  app <- scottyApp $ do
    get "/healthz" $
      json $ object
        [ "status"  .= ("ok" :: String)
        , "service" .= ("financial-rules-engine" :: String)
        ]
  putStrLn $ "financial-rules-engine listening on :" ++ show port
  run port app
  where
    object = id
    (.=)  = (,)
