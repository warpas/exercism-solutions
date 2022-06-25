module Temperature (tempToC, tempToF) where

{- Implement the function `tempToC` to convert
`  Fahrenheit to Celsius                    -}

tempToC :: Integer -> Float
tempToC tempFahrenheit = (fromIntegral tempFahrenheit - 32) / 1.8

{- Implement the function `tempToF` to convert
`  Celsius to Fahrenheit                    -}

tempToF :: Float -> Integer
tempToF tempCelsius = ceiling (tempCelsius * 1.8) + 32
