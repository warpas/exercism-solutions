// @ts-check

/**
 * Adds a gigasecond to a given date.
 *
 * @param {Date} date
 * @returns {Date} date after a gigasecond has passed
 */

export const gigasecond = (date) => {
  const gigasecondInMilliseconds = 1_000_000_000_000
  return new Date(date.getTime() + gigasecondInMilliseconds)
};
