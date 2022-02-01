defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> separate_words()
    |> strip_empty_words()
    |> downcase_words()
    |> count_word_occurrences()
  end

  defp separate_words(sentence) do
    forbidden_characters_regex = ~r/[^\p{L}\p{Nd}\p{Pd}']/u # ~r/'\s/
    non_regex = [" "]
    String.split(sentence, forbidden_characters_regex)
  end

  defp strip_empty_words(word_list) do
    Enum.filter(word_list, &(&1 != ""))
  end

  defp downcase_words(word_list) do
    Enum.map(word_list, &String.downcase/1)
  end

  defp count_word_occurrences(word_list) do
    List.foldl(word_list, %{}, fn word, acc ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
# defmodule Lasagna do
#   @moduledoc """
#   Implementation of the Lasagna exercise in Elixir track on Exercism.
#   """
#   @spec expected_minutes_in_oven :: Integer.t()
#   def expected_minutes_in_oven do
#     40
#   end

#   @spec remaining_minutes_in_oven(Integer.t()) :: Integer.t()
#   def remaining_minutes_in_oven(elapsed) do
#     expected_minutes_in_oven() - elapsed
#   end

#   @spec preparation_time_in_minutes(Integer.t()) :: Integer.t()
#   def preparation_time_in_minutes(layers) do
#     layers * 2
#   end

#   @spec total_time_in_minutes(Integer.t(), Integer.t()) :: Integer.t()
#   def total_time_in_minutes(layers, minutes_in_oven) do
#     preparation_time_in_minutes(layers) + minutes_in_oven
#   end

#   @spec alarm :: String.t()
#   def alarm do
#     "Ding!"
#   end
# end
