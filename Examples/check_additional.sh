#!/usr/bin/env bash
# #!/bin/bash
# Run this script without the .tex extension

rm -f *.aux *.log *.out *.bbl *.bcf *.blg *.toc *.lof *.lot *.run.xml *.bib

mv $1.tex save.tex
echo """
\\documentclass[preview]{standalone}
\\input{../latex_sources/preamble.tex}
\\addbibresource{../latex_sources/Fox-H_biber.bib}
\\begin{document}
""" > $1.tex
cat save.tex >> $1.tex

echo """
\\printbibliography[title={References}]
\\end{document}
""" >> $1.tex


lualatex --shell-escape $1
# biber --output_format=bibtex --output_resolve Fox-H.bcf
biber $1
lualatex --shell-escape $1
rm -f *.aux *.log *.out *.bbl *.bcf *.blg *.toc *.lof *.lot *.run.xml
mv save.tex $1.tex

