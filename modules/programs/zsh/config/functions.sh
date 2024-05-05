# atouch - create file with a folder path
# atouch() {
#   for file_path_info in "$@"; do
#     mkdir -p -- "$(dirname -- "$file_path_info")"
#     touch -- "$file_path_info"
#   done
# }

# ext = archive extractor
ext() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjf $1;;
      *.tar.gz) tar xzf $1;;
      *.tar.xz) tar xJf $1;;
      *.bz2) bunzip2 $1;;
      *.rar) unrar x $1;;
      *.gz) gunzip $1 ;;
      *.tar) tar xf $1 ;;
      *.tbz2) tar xjf $1;;
      *.tgz) tar xzf $1;;
      *.zip) unzip $1;;
      *.Z) uncompress $1;;
      *.7z) 7z x $1;;
      *) echo "'$1' cannot be extracted via ex()";;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# lfcd - use lf to switch directories (bound to ctrl-o)
lfcd() {
  tmp="$(mktemp)"
  lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
  fi
}

# sc - svelte create <app-name>
sc() {
  npm init @svelte-add/kit@latest -y "$@" \
    -- --demos false \
    --with typescript+eslint+prettiercd
  cd "$@";
}
