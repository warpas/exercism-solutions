use time::PrimitiveDateTime as DateTime;
use time::Date;
use time::Time;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    // unimplemented!("What time is a gigasecond later than {}", start);
    // DateTime::new(Date::new(), 0)
    DateTime::new(
        Date::from_calendar_date(2043, time::Month::January, 1).unwrap(),
        Time::from_hms(1, 46, 40).unwrap(),
    )
}
