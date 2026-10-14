#!/bin/sh
ignored=""

run() {
  if git check-ignore -q "$1"; then
    ignored="$ignored $1"
  fi
  make -f "$1"
}

run 1
run 2
run 3
run k

if [ -n "$ignored" ]; then
  printf '\n\033[1;37;41m%s\033[0m\n' "                                                  " >&2
  printf '\033[1;37;41m  !!! HUOM: IGNOROITU (.gitignore):%-15s \033[0m\n' "$ignored" >&2
  printf '\033[1;37;41m%s\033[0m\n\n' "                                                  " >&2
  printf '\a' >&2
fi
