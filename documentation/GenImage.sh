#!/usr/bin/env sh

# Define a list of two elements (Well-posedness and FoxH-Diagram) and iterate over it
for i in Well-posedness FoxH-Diagram
do
  # Compile the .tex file
  pdflatex $i.tex
  # Convert the .pdf file to .png
  convert -density 300 $i.pdf -quality 90 -background white -alpha remove -alpha off ../media/$i.png
done

# # Path: GenImage.sh
# #!/usr/bin/env sh
#
# # Compile the .tex file
#
# pdflatex FoxH-Diagram.tex
# convert -density 300 FoxH-Diagram.pdf -quality 90 -background white -alpha remove -alpha off ../media/FoxH-Diagram.png
#
# pdflatex Well-posedness.tex
# convert -density 300 FoxH-Diagram.pdf -quality 90 -background white -alpha remove -alpha off ../media/FoxH-Diagram.png
