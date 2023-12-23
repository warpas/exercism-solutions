func dailyRateFrom(hourlyRate: Int) -> Double {
  Double(hourlyRate * 8)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  Double(dailyRateFrom(hourlyRate: hourlyRate) * 22 * (1 - discount * 0.01)).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  fatalError("Please implement the workdaysIn(budget:hourlyRate:withDiscount:) function")
}
