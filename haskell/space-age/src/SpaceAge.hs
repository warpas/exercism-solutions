module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn Earth seconds = ageOnEarth seconds
ageOn Mercury seconds = (ageOnEarth seconds) / 0.2408467
ageOn Venus seconds = (ageOnEarth seconds) / 0.61519726
ageOn Mars seconds = (ageOnEarth seconds) / 1.8808158
ageOn Jupiter seconds = (ageOnEarth seconds) / 11.862615
ageOn Saturn seconds = (ageOnEarth seconds) / 29.447498
ageOn Uranus seconds = (ageOnEarth seconds) / 84.016846
ageOn Neptune seconds = (ageOnEarth seconds) / 164.79132

ageOnEarth :: Float -> Float
ageOnEarth seconds = seconds / 365.25 / 24 / 3600
