// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
  const juices = {
    'Pure Strawberry Joy': 0.5,
    'Energizer': 1.5,
    'Green Garden': 1.5,
    'Tropical Island': 3,
    'All or Nothing': 5,
    'default': 2.5
  }
  return juices[name] || juices['default']
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
export function limesToCut(wedgesNeeded, limes) {
  const lime_sizes = {
    'small': 6,
    'medium': 8,
    'large': 10
  }
  let sum = 0
  let count = 0
  for(const elem of limes) {
    if(sum >= wedgesNeeded) break
    sum += lime_sizes[elem]
    count += 1
  }
  return count
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
  let remainingTime = timeLeft
  let i = 0;
  while(remainingTime >= 0 && i < orders.length) {
    remainingTime -= timeToMixJuice(orders[i])
    i++
  }
  console.log(i)
  return orders.slice(i)
}
