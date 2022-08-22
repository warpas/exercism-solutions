// @ts-check

/**
 * Calculates the sum of the two input arrays.
 *
 * @param {number[]} array1
 * @param {number[]} array2
 * @returns {number} sum of the two arrays
 */
export function twoSum(array1, array2) {
  const sum1 = array1.reduce((sum, x) => 10 * sum + x)
  const sum2 = array2.reduce((sum, x) => 10 * sum + x)
  return sum1 + sum2
}

/**
 * Checks whether a number is a palindrome.
 *
 * @param {number} value
 * @returns {boolean}  whether the number is a palindrome or not
 */
export function luckyNumber(value) {
  const stringifiedValue = value.toString()
  const digitCount = stringifiedValue.length
  for (let i = 0; i <= digitCount / 2; i++) {
    if(stringifiedValue[i] !== stringifiedValue[digitCount - i - 1]) { return false }
  }
  return true
}

/**
 * Determines the error message that should be shown to the user
 * for the given input value.
 *
 * @param {string|null|undefined} input
 * @returns {string} error message
 */
export function errorMessage(input) {
  if(input === '' || input === null || input === undefined) { return 'Required field' }
  // let sum = 1
  // const number = Array.from(input).reduce((sum, x) => 10 * sum + x)
  // console.log(number)
  if(input === '0') { return 'Must be a number besides 0' }
  return ''
}
