type PlanetRatio = {
  planet_name: string;
  ratio: number;
}

export function age(planet: string, seconds: number): number {
  const earth_year_in_seconds: number = 31_557_600;
  const planet_year_to_earth_ratio: PlanetRatio[] = [
    {planet_name: 'earth', ratio: 1},
    {planet_name: 'mercury', ratio: 0.2408467},
    {planet_name: 'venus', ratio: 0.61519726},
    {planet_name: 'mars', ratio: 1.8808158},
    {planet_name: 'jupiter', ratio: 11.862615},
    {planet_name: 'saturn', ratio: 29.447498},
    {planet_name: 'uranus', ratio: 84.016846},
    {planet_name: 'neptune', ratio: 164.79132},
  ]

  const planet_ratio: number = planet_year_to_earth_ratio.find((elem) => elem.planet_name === planet)?.ratio || 1
  const unrounded_result = seconds / (earth_year_in_seconds * planet_ratio);
  return Number(unrounded_result.toFixed(2));
}
