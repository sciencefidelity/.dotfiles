# ln - lein new app <app-name>
ln() { lein new app "$@" && cd "$@"; }
