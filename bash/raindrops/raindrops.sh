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

  if ! [[ $DivisibleBy3 != 0 && $DivisibleBy5 != 0 && $DivisibleBy7 != 0 ]]; then
    echo "${Pling}${Plang}${Plong}"
  else echo "$1"
  fi
}

main "$@"
