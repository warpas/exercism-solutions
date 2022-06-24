module LuciansLusciousLasagna (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes) where

type Minutes = Integer
type Layers = Integer

expectedMinutesInOven :: Minutes
expectedMinutesInOven = 40

layerPreparationInMinutes :: Minutes
layerPreparationInMinutes = 2

preparationTimeInMinutes :: Layers -> Minutes
preparationTimeInMinutes = (* layerPreparationInMinutes)

elapsedTimeInMinutes :: Layers -> Minutes -> Minutes
elapsedTimeInMinutes layers timeInOven = preparationTimeInMinutes layers + timeInOven
