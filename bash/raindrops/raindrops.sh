main() {
  local Var1=$(($1 % 3))
  # echo "${Var1}"

  if [ $1 == 1 ]; then
    echo '1'
  # fi

  elif [ $Var1 == 0 ]; then
    echo 'Pling'
  # fi

  elif [ $1 == 5 ]; then
    echo 'Plang'
  # fi

  elif [ $1 == 7 ]; then
    echo 'Plong'
  else echo "$1"
  fi
}

main "$@"
