# cn = cargo new <app-name>
cn() { cargo new --bin "$@" && cd "$@"; }
