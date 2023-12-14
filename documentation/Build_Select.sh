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


# Array of filenames
files=(
    "FoxH32-21_output.tex"
    "FoxH32-21-Y_output.tex"
    "FoxH32-21-Z-Star_output.tex"
    "FoxH32-21-Z_output.tex"
    "FoxH-Cos_output.tex"
    "FoxH-Mittag-Leffler_output.tex"
    "FoxH-Sin_output.tex"
    "FoxH-2_9_4_output.tex"
    "FoxH-Bessel-J_2_9_18_output.tex"
)

echo "" > "Examples.tex"

# Loop over each file
for file in "${files[@]}"; do
    # Apply the sed command to transform the first line
    sed '1s/\[11pt\]{article}/\[preview\]{standalone}/' "../Examples/${file}" > "${file}"

    # Apply the sed command to modify {text}{
    sed -i 's/{text}{/{text}{..\/Examples\//g' "${file}"

    # Change section to subsection
    sed -i 's/section/subsection/g' "${file}"

    # Extract the base name without the extension
    base_name=$(basename "$file" .tex)

    # Append the input command to the file
    echo "\input{$base_name}" >> "Examples.tex"
done

lualatex --shell-escape --interaction=nonstopmode FoxH-Parametration
bibtex FoxH-Parametration
lualatex --shell-escape --interaction=nonstopmode FoxH-Parametration

# FoxH32-21_output.tex
# FoxH32-21_output.tex
# FoxH32-21-Y_output.tex
# FoxH32-21-Z-Star_output.tex
# FoxH32-21-Z_output.tex
# FoxH-Cos_output.tex
# FoxH-Mittag-Leffler_output.tex
# FoxH-Sin_output.tex

rm *.aux
rm *.log
rm *.out
rm -r _minted*
