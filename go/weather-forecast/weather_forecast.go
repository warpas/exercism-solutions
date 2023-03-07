// Package weather is a limited implementation formatting weather forcasts.
package weather

// CurrentCondition variable represents the current condition as a string.
var CurrentCondition string

// CurrentLocation variable represents the current location as a string.
var CurrentLocation string

// Forecast function takes a city and condition and formats them as a string on the output.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
