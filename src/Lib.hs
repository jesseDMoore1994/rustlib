{-# LANGUAGE ForeignFunctionInterface #-}

module Lib where

import Curryrs.Types
import Foreign
import Foreign.C.Types
import Foreign.Ptr

type CData = Ptr ()

foreign import ccall "create_data_c" create_data_c :: IO CData
foreign import ccall "destroy_data_c" destroy_data_c :: CData -> IO ()
foreign import ccall "print_data_c" print_data_c :: CData -> IO ()
foreign import ccall "hello" hello :: ()
foreign import ccall "double" double :: I64 -> I64
foreign import ccall "square" square :: I64 -> I64
foreign import ccall "cube" cube :: I64 -> I64

squarePlus1 = (+) 1 $ square 2

someFunc :: IO ()
someFunc = do
  d <- create_data_c
  print_data_c d
  destroy_data_c d

-- someFunc :: IO ()
-- someFunc = putStrLn $ show squarePlus1
