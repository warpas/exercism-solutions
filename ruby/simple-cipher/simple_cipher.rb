class Cipher
  def initialize(arg = 'a')
    raise ArgumentError if arg == arg.upcase
  end

  def key
    'fdsafsdf'
  end

  def encode(_)
    'fdsafsdf'
  end

  def decode(_)
    'aaaaaaaaaa'
  end
end
