#!/usr/bin/env bash
# #!/bin/bash
# Run this script without the .tex extension

rm -f *.aux *.log *.out *.bbl *.bcf *.blg *.toc *.lof *.lot *.run.xml *.bib
lualatex --shell-escape $1
# biber --output_format=bibtex --output_resolve Fox-H.bcf
biber $1
lualatex --shell-escape $1 
rm -f *.aux *.log *.out *.bbl *.bcf *.blg *.toc *.lof *.lot *.run.xml
