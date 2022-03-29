main() {
  if [ $1 == 1 ]; then
    echo '1'
  fi

  if [ $1 == 3 ]; then
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
