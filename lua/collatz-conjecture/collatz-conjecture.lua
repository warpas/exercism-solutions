return function(n)
  if(n < 1)
  then
    error("Only positive numbers are allowed")
  end

  total_steps = 0
  while(n > 1)
  do
    number_even = (math.fmod(n, 2) == 0)
    if(number_even)
    then
      n = n / 2
    else
      n = (n * 3 + 1)
    end
    total_steps = total_steps + 1
  end
  return total_steps
end
