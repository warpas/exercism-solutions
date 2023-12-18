local Character = {}

local function ability(scores)
  min = 20
  sum = 0

  for i = 1, 4 do
    current = scores[i]
    if (min > current) then
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

function Character:new(name)
  constitution_value = ability(roll_dice())
  characterObject = {
    name = name,
    strength = ability(roll_dice()),
    dexterity = ability(roll_dice()),
    constitution = constitution_value,
    intelligence = ability(roll_dice()),
    wisdom = ability(roll_dice()),
    charisma = ability(roll_dice()),
    hitpoints = 10 + modifier(constitution_value)
  }
  return characterObject
end

return {
  Character = Character,
  ability = ability,
  roll_dice = roll_dice,
  modifier = modifier
}
