# NixOS notes

### Create a config
delta

### Missing tree-sitter languages
clojure
dart
dockerfile
elixir
elm
gomod
graphql
ocaml
ocaml_interface
ocamllex
scss
vue

#### Can't be installed
elixir
ocamllex

### Missing node modules (for global use)
`@angular/cli`
`@angular/language-server`
`@sanity/cli`
`stylelint-lsp`

To install global node modules create a `.npmrc` with the line

```shell
prefix=~/.npm-globals
```

Run this in the shell when needed

```shell
export PATH="$HOME/.npm-globals/bin:$PATH"
```

### Won't compile
`nodePackages.esy`

### Scaffold with pnpm

```shell
pnpx create-vite <my-app>
pnpx create-nuxt-app <my-app>
pnpx create-react-app <my-app>
pnpx create-next-app <my-app>
pnpx create-strapi-app <my-app>
pnpx degit solidjs/templates/ts <my-app>
```

```shell
pnpm init astro <my-app>
pnpm init svelte@next <my-app>
```

```shell
pnpm add --save-dev snowpack
```

```shell
npm init
npm install --save @assemblyscript/loader
npm install --save-dev assemblyscript
```

### Not available on aarch64
clojure-lsp

### Existing but not installed
`hugo`
`sass` (is it dart or ruby?)
`nodePackages.eslint`
`nodePackages.prettier`
