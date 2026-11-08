#!/bin/sh
# Kaantaa TikZ-kuvasarjan: ./build-sarja.sh nimi askelia  -> nimi-1.pdf ... nimi-N.pdf
cd "$(dirname "$0")"
n=1
while [ $n -le "$2" ]; do
  echo "\\def\\step{$n}\\input{$1.tex}" > "$1-$n.tex"
  tectonic "$1-$n.tex" >/dev/null 2>&1 || echo "virhe: $1 askel $n"
  rm "$1-$n.tex"
  n=$((n+1))
done
