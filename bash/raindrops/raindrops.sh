main() {
  local Var1=$(($1 % 3))

  if [ $Var1 == 0 ]; then
    echo 'Pling'
  elif [ $1 == 5 ]; then
    echo 'Plang'
  elif [ $1 == 7 ]; then
    echo 'Plong'
  else echo "$1"
  fi
}

main "$@"
