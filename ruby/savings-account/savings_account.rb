# frozen_string_literal: true

# Implementation of the Savings Account exercise in Ruby track on Exercism.
module SavingsAccount
  class << self
    # @param balance [Float]
    # @return [Float]
    def interest_rate(balance)
      return 3.213 if balance.negative?
      return 0.5 if balance < 1000
      return 1.621 if balance < 5000

      2.475
    end

    # @param balance [Float]
    # @return [Float]
    def annual_balance_update(balance)
      interest = balance.abs * interest_rate(balance) * 0.01
      return balance + interest if balance.positive?

      balance - interest
    end

    # @param current_balance [Float]
    # @param desired_balance [Float]
    # @return [Integer] years it would take for current balance to accumulate enough interest to reach desired balance
    def years_before_desired_balance(current_balance, desired_balance)
      years = 0
      while desired_balance > current_balance
        years += 1
        current_balance = annual_balance_update(current_balance)
      end
      years
    end
  end
end
