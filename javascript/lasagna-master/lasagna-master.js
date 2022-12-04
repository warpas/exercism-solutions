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
  const multiplier = timePerLayer === undefined ? 2 : timePerLayer;
  return layers.length * multiplier;
}

export function quantities(layersArray) {
  const ingredients = {"noodles": 0, "sauce": 0};
  const noodle_multiplier = 50;
  const sauce_multiplier = 0.2;
  for (const ingredient in layersArray) {
    const element = layersArray[ingredient];
    if (element === "noodles") {
      ingredients["noodles"] += noodle_multiplier;
    };
    if (element === "sauce") {
      ingredients["sauce"] += sauce_multiplier;
    };
  };
  return ingredients;
}

export function addSecretIngredient(friendList, myList) {
  const secretIngredient = friendList[friendList.length-1]
  myList[myList.length] = secretIngredient
}
