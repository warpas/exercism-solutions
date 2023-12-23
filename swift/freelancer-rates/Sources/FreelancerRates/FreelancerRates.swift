func dailyRateFrom(hourlyRate: Int) -> Double {
  Double(hourlyRate * 8)
}

func discountedDailyRate(_ hourlyRate: Int, _ discount: Double) -> Double {
  dailyRateFrom(hourlyRate: hourlyRate) * (1 - discount * 0.01)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  let discountedRate = discountedDailyRate(hourlyRate, discount)
  let workdaysDuringMonth: Double = 22

  return Double(discountedRate * workdaysDuringMonth).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let discountedRate = discountedDailyRate(hourlyRate, discount)

  return Double(budget / discountedRate).rounded(.down)
}
