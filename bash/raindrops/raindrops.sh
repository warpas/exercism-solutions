main() {
  local DivisibleBy3=$(($1 % 3))
  local DivisibleBy5=$(($1 % 5))

  if [ $DivisibleBy3 == 0 ]; then
    echo 'Pling'
  elif [ $DivisibleBy5 == 0 ]; then
    echo 'Plang'
  elif [ $1 == 7 ]; then
    echo 'Plong'
  else echo "$1"
  fi
}

main "$@"
