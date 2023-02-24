defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([_ | tail]), do: tail

  def first([head | _]), do: head

  def count(list), do: count(list, 0)

  defp count([], counter), do: counter
  defp count([_ | tail], counter) do
    count(tail, counter + 1)
  end

  def functional_list?([]), do: false
  def functional_list?(["Elixir" | _tail]), do: true
  def functional_list?([_head | tail]), do: functional_list?(tail)
end
