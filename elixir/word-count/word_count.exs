defmodule Words do
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
    forbidden_characters_regex = ~r/[^\p{L}\p{Nd}\p{Pd}]/u
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
