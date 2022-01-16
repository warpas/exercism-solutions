defmodule Lasagna do
  @moduledoc """
  Implementation of the Lasagna exercise in Elixir track on Exercism.
  """
  @spec expected_minutes_in_oven :: Integer.t()
  def expected_minutes_in_oven do
    40
  end

  @spec remaining_minutes_in_oven(Integer.t()) :: Integer.t()
  def remaining_minutes_in_oven(elapsed) do
    expected_minutes_in_oven() - elapsed
  end

  @spec preparation_time_in_minutes(Integer.t()) :: Integer.t()
  def preparation_time_in_minutes(layers) do
    layers * 2
  end

  @spec total_time_in_minutes(Integer.t(), Integer.t()) :: Integer.t()
  def total_time_in_minutes(layers, minutes_in_oven) do
    preparation_time_in_minutes(layers) + minutes_in_oven
  end

  @spec alarm :: String.t()
  def alarm do
    "Ding!"
  end
end
