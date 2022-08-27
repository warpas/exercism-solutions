/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Says whether or not the lasagna is ready to take out of the oven.
 *
 * @param {number} timer
 * @returns {string} status message
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

/**
 * What does it do?
 *
 * @param {string[]} layers
 * @param {number} timePerLayer
 * @returns {number}
 */
export function preparationTime(layers, timePerLayer) {
  const multiplier = timePerLayer === undefined ? 2 : timePerLayer
  return layers.length * multiplier
}
