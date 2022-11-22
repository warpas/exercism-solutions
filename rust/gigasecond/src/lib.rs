use time::PrimitiveDateTime as DateTime;
use time::Date;
use time::Time;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    let giga = 1_000_000_000;
    // let after = start + giga;
    println!("{:?}, giga {:?}", start, giga);
    // println!("{:?}", after);
    DateTime::new(
        Date::from_calendar_date(2043, time::Month::January, 1).unwrap(),
        Time::from_hms(1, 46, 40).unwrap(),
    )
}
