alias print="import ./media/Screenshot.png"

Screenshot() {
  local filename=$1
  if [[ -z $filename ]]; then
    filename="0"  # Default filename if none is provided
  fi
  import "./media/Screenshot_${filename}.png"
}

alias description="gh repo edit \
  --description 'Some symbolic tools for the Fox H-function (V1.42)'\
  --homepage 'https://doi.org/10.5281/zenodo.10149874' \
  --add-topic 'research' \
  --add-topic 'mathematics' \
  --add-topic 'mathematica' \
  --add-topic 'special-functions' \
  --add-topic 'software' \
  --add-topic 'cli' \
  "


# Build the documentation of the project
alias make='./Build.sh yes'

# Print help information.
alias help='cat ./myzsh.zsh'
