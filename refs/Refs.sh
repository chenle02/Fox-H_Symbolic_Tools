#!/usr/bin/env sh

pandoc --citeproc ../readme.md --bibliography=refs.bib --csl=./Journal_of_Math_Physics.csl -t markdown-citations -o citations.md
