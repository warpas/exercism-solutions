func dailyRateFrom(hourlyRate: Int) -> Double {
  Double(hourlyRate * 8)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  Double(dailyRateFrom(hourlyRate: hourlyRate) * 22 * (1 - discount * 0.01)).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let discounted_daily_rate = dailyRateFrom(hourlyRate: hourlyRate) * (1 - discount * 0.01)

  return Double(budget / discounted_daily_rate).rounded(.down)
}
