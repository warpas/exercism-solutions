/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Implement the functions needed to solve the exercise here.
 * Do not forget to export them so they are available for the
 * tests. Here an example of the syntax as reminder:
 *
 * export function yourFunction(...) {
 *   ...
 * }
 */
export function cookingStatus(timer) {
  if(timer === undefined) {
    return "You forgot to set the timer."
  }
  if(timer === 0) {
    return "Lasagna is done."
  }
  return "Not done, please wait."
}
