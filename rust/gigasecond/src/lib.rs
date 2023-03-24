use time::PrimitiveDateTime as DateTime;
use time::Duration;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    let giga: Duration = Duration::seconds(1_000_000_000);
    let date_output =
        match start.checked_add(giga) {
            Some(x) => x,
            None => todo!(),
        };
    date_output
}
