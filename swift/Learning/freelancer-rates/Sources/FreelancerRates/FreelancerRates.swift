func dailyRateFrom(hourlyRate: Int) -> Double {
    return Double(hourlyRate) * 8.0
}
func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
    let disc = 1.0 - (discount/100.0)
    return (dailyRateFrom(hourlyRate: hourlyRate) * 22.0 * disc).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
    let day = dailyRateFrom(hourlyRate: hourlyRate)
    let disc = 1.0 - (discount/100.0)   
    let dayDiscount =  day * disc
    return (budget / dayDiscount).rounded(.down)
}
