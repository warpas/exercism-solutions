export function hey(message: string): string {
  if(shouting(message) && question(message)) {
    return "Calm down, I know what I'm doing!"
  } else if(silence(message)) {
    return 'Fine. Be that way!'
  } else if(shouting(message)) {
    return 'Whoa, chill out!'
  } else if(question(message)) {
    return 'Sure.'
  }

  return 'Whatever.'
}

const question = (message: string): boolean => (
  message.trim().slice(-1) === "?"
)

const shouting = (message: string): boolean => (
  message === message.toUpperCase() && message !== message.toLowerCase()
)

const silence = (message: string): boolean => (
  !message.trim()
)
