# zi = zig init <app-name>
zi() { mkdir "$@" && cd "$@" && zig init; }
