#!/bin/bash

# Directory and pattern
dir="../Examples"
pattern="${dir}/*_output.tex"

echo "" > "Examples.tex"
# Check if files exist
if compgen -G "$pattern" > /dev/null; then
  # Files exist, iterate over them
  for path_file in $pattern; do
    file=$(basename "$path_file")
    echo "$file"

    # Apply the sed command to transform the first line
    sed '1s/\[11pt\]{article}/\[preview\]{standalone}/' "../Examples/${file}" > "${file}"

    # Apply the sed command to modify {text}{
    sed -i 's/{text}{/{text}{..\/Examples\//g' "${file}"

    # Change section to subsection
    sed -i 's/section/subsection/g' "${file}"
    sed -i '/^\\printbibliography\[title={References}\]/d' "${file}"

    # Extract the base name without the extension
    base_name=$(basename "$file" .tex)

    # Append the input command to the file
    echo "\newpage" >> "Examples.tex"
    echo "\input{$base_name}" >> "Examples.tex"
  done
else
    # No files found
    echo "No files matching the pattern were found in $dir"
fi

lualatex --shell-escape --interaction=nonstopmode FoxH-Parametration
biber FoxH-Parametration
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
