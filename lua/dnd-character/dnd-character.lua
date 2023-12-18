local Character = {}

local function ability(scores)
  min = 0
  sum = 0

  for i = 1, 4 do
    current = scores[i]
    if min < current then
      min = current
    end
    sum = sum + current
  end
  return sum - min
end

local function roll_dice()
  a = math.random(1,6)
  b = math.random(1,6)
  c = math.random(1,6)
  d = math.random(1,6)

  return {a, b, c, d}
end

local function modifier(input)
  return math.floor((input - 10) / 2)
end

return {
  Character = Character,
  ability = ability,
  roll_dice = roll_dice,
  modifier = modifier
}
