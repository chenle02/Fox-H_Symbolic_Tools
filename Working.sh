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

./FoxH.wls FoxH32-21.wls
./FoxH.wls FoxH32-21-Y.wls
./FoxH.wls FoxH32-21-Z-Star.wls
./FoxH.wls FoxH32-21-Z.wls
./FoxH.wls FoxH-Cos.wls
./FoxH.wls FoxH-Mittag-Leffler.wls
./FoxH.wls FoxH-Sin.wls
cd refs
lualatex --shell-escape --interaction=nonstopmode FoxH-Parametration
bibtex FoxH-Parametration
lualatex --shell-escape --interaction=nonstopmode FoxH-Parametration
cd ..
