#!/usr/bin/env bash
set -Eeu

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' COLOR='\033[0;36m'
  else
    NOFORMAT='' COLOR=''
  fi
}

msg() {
  echo >&2 -e "${1-}"
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") FILE [SEARCH_QUERY]

Dislays the csv FILE.

Available options:

-h, --help      Print this help and exit
-v, --verbose   Print script debug info
--no-color      Disable colors
-c, --comma     Use comma ',' as a separator (default is semi-colon ';')
EOF
  exit
}

parse_params() {
  # default values of variables set from params
  separator=';'

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -v | --verbose) set -x ;;
    --no-color) NO_COLOR=1 ;;
    -c | --comma) separator=',' ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  args=("$@")
  # check required params and arguments
  [[ ${#args[@]} -eq 0 ]] && usage
  [[ ${#args[@]} -gt 2 ]] && usage

  return 0
}

cols() {
    sed "s/${separator}/${separator}│/g" "$1" | column -s"${separator}" -t -n
}

ccols() {
    c=$(echo -e "${COLOR}")
    n=$(echo -e "${NOFORMAT}")
    cols "$1" | sed "0~2s/.*/${c}&${n}/"
}

parse_params "$@"
setup_colors

file="${args[0]}"
query="${args[1]-}"

if [[ -n "${query}" ]]; then
    header="$(cols "${file}" | head -n 1)"
    echo "${header}"
    cols "${file}" | grep --text --color "${query}"
else
    ccols "${file}"
fi
