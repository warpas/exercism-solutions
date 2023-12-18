export function isLeap(year: number) : boolean {
  const divisibleBy4 = year % 4 === 0
  const notDivisibleBy100 = year % 100 !== 0
  const divisibleBy400 = year % 400 === 0
  return divisibleBy400 || (divisibleBy4 && notDivisibleBy100)
}
