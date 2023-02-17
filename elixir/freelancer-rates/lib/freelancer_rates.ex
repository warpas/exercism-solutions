defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    discounted_price_percentage = (1.0 - discount * 0.01)
    before_discount * discounted_price_percentage
  end

  def monthly_rate(hourly_rate, discount) do
    rate_without_discount = daily_rate(hourly_rate) * 22
    apply_discount(rate_without_discount, discount)
    |> Kernel.ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
  end
end
