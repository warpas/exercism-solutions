local TwoFer = {}

function TwoFer.two_fer(name)
  name = name or "you"
  return string.format("One for %s, one for me.", name)
end

return TwoFer
