# gm - go mod init <module-name>
gm() { mkdir "$@" && cd "$@" && go mod init github.com/sciencefidelity/"$@"; }
