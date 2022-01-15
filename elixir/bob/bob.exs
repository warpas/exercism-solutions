defmodule Bob do
  def hey(input) do
    cond do
      shouting?(input) and question?(input) -> "Calm down, I know what I'm doing!"
      silence?(input) -> "Fine. Be that way!"
      shouting?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  def shouting?(sentence) do
    sentence == String.upcase(sentence) and sentence != String.downcase(sentence)
  end

  def question?(sentence) do
    String.last(sentence) == "?"
  end

  def silence?(sentence) do
    String.trim(sentence) == ""
  end
end
