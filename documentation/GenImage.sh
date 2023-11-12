#!/usr/bin/env sh

pdflatex FoxH-Diagram.tex
convert -density 300 FoxH-Diagram.pdf -quality 90 -background white -alpha remove -alpha off ../media/FoxH-Diagram.png

