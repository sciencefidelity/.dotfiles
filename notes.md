# NixOS notes

### Create a config
delta

### Missing node modules (for global use)
`@angular/cli`
`@angular/language-server`
`@sanity/cli`
`apollo`
`ember-cli`
`ghost-cli`
`stylelint-lsp`

### Won't install from npm
`purescript`

### Won't compile
`nodePackages.esy`

### Deleted Casks

- blender
- evernote
- fantastical
- logseq
- raycast
- rocket
- pdf-expert

### Deleted npm globals

- @microsoft/api-extractor
- @sanity/cli
- esy (nixpkgs not working)
- install-peerdeps
- lighthouse
- nativescript
- nodemon (nixpkgs)
- nvm
- stylelint-lsp

### Scaffold with pnpm

```shell
npx create-vite <my-app>
npx create-nuxt-app <my-app>
npx create-react-app <my-app>
npx create-next-app <my-app>
npx create-strapi-app <my-app>
npx degit solidjs/templates/ts <my-app>
```

```shell
npm init astro <my-app>
npm init svelte@next <my-app>
```

```shell
npm add --save-dev snowpack
```

```shell
npm init
npm install --save @assemblyscript/loader
npm install --save-dev assemblyscript
```

#### Remove all dependencies in `package.json` and reinstall (all versions become latest)

```shell
npx yarn-upgrade-all
```

### Not available on aarch64
clojure-lsp
purescript

### Existing but not installed
`hugo`
`sass` (is it dart or ruby?)
`nodePackages.eslint`
`nodePackages.prettier`
