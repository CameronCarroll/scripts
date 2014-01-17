#!/bin/zsh
echo "Building LaTeX files:"
for i in *.tex; do
  echo "  ${i}"
  for j in `seq 1 3`;
  do
    pdflatex "$i" >/dev/null
  done
done
