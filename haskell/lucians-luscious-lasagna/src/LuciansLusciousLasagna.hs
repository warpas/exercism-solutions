module LuciansLusciousLasagna (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes) where

expectedMinutesInOven :: Integer
expectedMinutesInOven = 40

layerPreparationInMinutes :: Integer
layerPreparationInMinutes = 2

preparationTimeInMinutes :: Integer -> Integer
preparationTimeInMinutes layers = layerPreparationInMinutes * layers

elapsedTimeInMinutes :: Integer -> Integer -> Integer
elapsedTimeInMinutes layers timeInOven = preparationTimeInMinutes layers + timeInOven
