main() {
  local name="$1"

  if ! [[ $# == 1 ]] ; then
    echo "Usage: error_handling.sh <person>"
    exit 1
  fi
  echo "Hello, ${name}"
}

main "$@"
