defmodule Bob do
  @moduledoc """
  Implementation of the Bob exercise in Elixir track on Exercism.
  """
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    cond do
      shouting?(input) and question?(input) -> "Calm down, I know what I'm doing!"
      silence?(input) -> "Fine. Be that way!"
      shouting?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp shouting?(sentence) do
    sentence == String.upcase(sentence) and sentence != String.downcase(sentence)
  end

  defp question?(sentence) do
    sentence
    |> String.trim()
    |> String.ends_with?("?")
  end

  defp silence?(sentence) do
    String.trim(sentence) == ""
  end
end
