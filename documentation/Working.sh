#!/usr/bin/env bash
# #!/bin/bash
if [[ $# -eq 0 ]] || [[ "" == "--help" ]]
then
  echo ""
  echo ""
  echo "Usage: $0 "
  echo "Work under working directory."
  echo "by Le CHEN, (chenle02@gmail.com)"
  echo "Fri Nov 10 08:46:48 AM EST 2023"
  echo ""
  echo ""
  exit 1
fi

sed '1s/\[11pt\]{article}/\[preview\]{standalone}/' ../Examples/FoxH32-21_output.tex           > FoxH32-21_output.tex
sed '1s/\[11pt\]{article}/\[preview\]{standalone}/' ../Examples/FoxH32-21-Y_output.tex         > FoxH32-21-Y_output.tex
sed '1s/\[11pt\]{article}/\[preview\]{standalone}/' ../Examples/FoxH32-21-Z-Star_output.tex    > FoxH32-21-Z-Star_output.tex
sed '1s/\[11pt\]{article}/\[preview\]{standalone}/' ../Examples/FoxH32-21-Z_output.tex         > FoxH32-21-Z_output.tex
sed '1s/\[11pt\]{article}/\[preview\]{standalone}/' ../Examples/FoxH-Cos_output.tex            > FoxH-Cos_output.tex
sed '1s/\[11pt\]{article}/\[preview\]{standalone}/' ../Examples/FoxH-Mittag-Leffler_output.tex > FoxH-Mittag-Leffler_output.tex
sed '1s/\[11pt\]{article}/\[preview\]{standalone}/' ../Examples/FoxH-Sin_output.tex            > FoxH-Sin_output.tex

sed -i 's/{text}{/{text}{..\/Examples\//g' FoxH32-21_output.tex
sed -i 's/{text}{/{text}{..\/Examples\//g' FoxH32-21_output.tex
sed -i 's/{text}{/{text}{..\/Examples\//g' FoxH32-21-Y_output.tex
sed -i 's/{text}{/{text}{..\/Examples\//g' FoxH32-21-Z-Star_output.tex
sed -i 's/{text}{/{text}{..\/Examples\//g' FoxH32-21-Z_output.tex
sed -i 's/{text}{/{text}{..\/Examples\//g' FoxH-Cos_output.tex
sed -i 's/{text}{/{text}{..\/Examples\//g' FoxH-Mittag-Leffler_output.tex
sed -i 's/{text}{/{text}{..\/Examples\//g' FoxH-Sin_output.tex

lualatex --shell-escape --interaction=nonstopmode FoxH-Parametration
bibtex FoxH-Parametration
lualatex --shell-escape --interaction=nonstopmode FoxH-Parametration

rm FoxH32-21_output.tex
rm FoxH32-21_output.tex
rm FoxH32-21-Y_output.tex
rm FoxH32-21-Z-Star_output.tex
rm FoxH32-21-Z_output.tex
rm FoxH-Cos_output.tex
rm FoxH-Mittag-Leffler_output.tex
rm FoxH-Sin_output.tex

rm *.aux
rm *.log
rm *.out
rm -r _minted*
