module LuciansLusciousLasagna (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes) where

expectedMinutesInOven :: Integer
expectedMinutesInOven = 40

preparationTimeInMinutes :: Integer -> Integer
preparationTimeInMinutes x = 2 * x

elapsedTimeInMinutes :: Integer -> Integer -> Integer
elapsedTimeInMinutes layers timeInOven = preparationTimeInMinutes layers + timeInOven
