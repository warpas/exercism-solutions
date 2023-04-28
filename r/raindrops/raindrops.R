raindrops <- function(number) {
  if (number %% 3 == 0) {
      if ((number/3) %% 5 == 0) {
        if ((number/15) %% 7 == 0) {
          paste("PlingPlangPlong")
        } else {
          paste("PlingPlang")
        }
      } else {
        if ((number/3) %% 7 == 0) {
          paste("PlingPlong")
        } else {
          paste("Pling")
        }
      }
  } else {
    if (number %% 5 == 0) {
      if ((number/5) %% 7 == 0) {
        paste("PlangPlong")
      } else {
        paste("Plang")
      }
    } else {
      if (number %% 7 == 0) {
        paste("Plong")
      } else {
        paste(number)
      }
    }
  }
}
