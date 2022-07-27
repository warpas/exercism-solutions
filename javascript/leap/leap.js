// @ts-check

/**
 * Determines whether or not a given year is a leap year.
 *
 * @param {number} year
 * @returns {boolean} whether a year is a leap year
 */
export const isLeap = (year) => {
  const divisibleBy4 = year % 4 === 0
  const notDivisibleBy100 = year % 100 !== 0
  const divisibleBy400 = year % 400 === 0
  return divisibleBy400 || (divisibleBy4 && notDivisibleBy100)
};
