local Darts = {}

function Darts.score(x, y)
  boundary = x * x + y * y

  if(boundary > 100)
  then
    return 0
  end
  if(boundary > 25)
  then
    return 1
  end
  if(boundary > 1)
  then
    return 5
  end

  return 10
end

return Darts
