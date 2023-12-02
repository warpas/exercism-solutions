local function square_of_sum(n)
  sum = 0
  current = n
  while(current > 0)
  do
    sum = sum + current
    current = current - 1
  end
  return sum * sum
end

local function sum_of_squares(n)
  sum = 0
  current = n
  while(current > 0)
  do
    sum = sum + current * current
    current = current - 1
  end
  return sum
end

local function difference_of_squares(n)
  return square_of_sum(n) - sum_of_squares(n)
end

return {
  square_of_sum = square_of_sum,
  sum_of_squares = sum_of_squares,
  difference_of_squares = difference_of_squares
}
