#!/usr/bin/env bash
# #!/bin/bash

rm -f *.aux *.log *.out *.bbl *.bcf *.blg *.toc *.lof *.lot *.run.xml
rm Fox-H_biber.bib
lualatex --shell-escape ./Fox-H.tex
biber --output_format=bibtex --output_resolve Fox-H.bcf
biber Fox-H
lualatex --shell-escape ./Fox-H.tex
bibtex-tidy -m ./Fox-H_biber.bib
rm -f *.aux *.log *.out *.bbl *.bcf *.blg *.toc *.lof *.lot *.run.xml

