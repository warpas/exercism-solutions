main() {
  local DivisibleBy3=$(($1 % 3))
  local DivisibleBy5=$(($1 % 5))
  local DivisibleBy7=$(($1 % 7))

  local Pling=""
  if [ $DivisibleBy3 == 0 ]; then
    Pling='Pling'
  fi
  local Plang=""
  if [ $DivisibleBy5 == 0 ]; then
    Plang='Plang'
  fi
  local Plong=""
  if [ $DivisibleBy7 == 0 ]; then
    Plong='Plong'
  fi

  local result="${Pling}${Plang}${Plong}"

  if [[ -n "$result" ]]; then
    echo "$result"
  else echo "$1"
  fi
}

main "$@"
