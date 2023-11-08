#!/usr/bin/env sh

# --csl=./Journal_of_Math_Physics.csl
pandoc --citeproc ./refs.md --bibliography=refs.bib  -o citations.md -t markdown-citations
sed -i 's/::.*$//g' citations.md
