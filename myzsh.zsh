alias print="import ./media/Screenshot.png"

Screenshot() {
  local filename=$1
  if [[ -z $filename ]]; then
    filename="0"  # Default filename if none is provided
  fi
  import "./media/Screenshot_${filename}.png"
}
