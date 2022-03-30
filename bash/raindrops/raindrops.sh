main() {
  local Var1=$(($1 % 3))
  # echo "${Var1}"

  if [ $1 == 1 ]; then
    echo '1'
  fi

  if [ $Var1 == 0 ]; then
    echo 'Pling'
  fi

  if [ $1 == 5 ]; then
    echo 'Plang'
  fi

  if [ $1 == 7 ]; then
    echo 'Plong'
  fi
}

main "$@"
