use time::PrimitiveDateTime as DateTime;
use time::Date;
use time::Time;
use time::macros::{date, datetime, offset};
use time::Duration;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    let giga: Duration = Duration::seconds(1_000_000_000);
    // let after = start + giga;
    println!("start {:?}, giga {:?}", start, giga);
    // println!("{:?}", after);
    // DateTime::new(
    //     Date::from_calendar_date(2043, time::Month::January, 1).unwrap(),
    //     Time::from_hms(1, 46, 40).unwrap(),
    // )
    // PrimitiveDateTime::new(date!(2043-01-01), time!(0:00))
    // datetime!(2019-01-01 0:00)
    let date_something = start.checked_add(giga);
    println!("{:?}", date_something);
    let date_output =
        match start.checked_add(giga) {
            Some(x) => x,
            None => todo!(),
        };
    date_output

    // datetime!(2043-01-01 1:46:40)
    // use checked_add function

}
