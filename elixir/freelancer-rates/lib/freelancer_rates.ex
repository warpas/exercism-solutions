defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    discount_price = before_discount * (discount * 0.01)
    before_discount - discount_price
  end

  def monthly_rate(hourly_rate, discount) do
    # Please implement the monthly_rate/2 function
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
  end
end
