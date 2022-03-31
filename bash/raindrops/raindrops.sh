main() {
  local Div3Text=""
  if [ $(($1 % 3)) == 0 ]; then
    Div3Text='Pling'
  fi
  local Div5Text=""
  if [ $(($1 % 5)) == 0 ]; then
    Div5Text='Plang'
  fi
  local Div7Text=""
  if [ $(($1 % 7)) == 0 ]; then
    Div7Text='Plong'
  fi

  local result="${Div3Text}${Div5Text}${Div7Text}"

  if [[ -n "$result" ]]; then
    echo "$result"
  else echo "$1"
  fi
}

main "$@"
