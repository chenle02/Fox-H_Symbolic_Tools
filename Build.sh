#!/usr/bin/env bash
if [[ $# -eq 0 ]] || [[ "" == "--help" ]]
then
  echo ""
  echo ""
  echo "Usage: $0 "
  echo "Work under working directory."
  echo "by Le CHEN, (chenle02@gmail.com)"
  echo "Fri Nov 17 09:19:32 AM EST 2023"
  echo ""
  echo ""
  exit 1
fi

cd Examples
./Build.sh
cd -

cd ./documentation
./Build.sh Yes
