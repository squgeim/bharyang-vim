# bharyang-vim
Plugin to sort imports in a JavaScript project for Vim/NeoVim

## Installation

bharyang-vim depends on [bharyang-cli](https://github.com/squgeim/bharyang-cli).

### Installation with [vim-plug](https://github.com/junegunn/vim-plug)

[vim-plug](https://github.com/junegunn/vim-plug) can install [bharyang-cli](https://github.com/squgeim/bharyang-cli) as a post-install hook, and lazy load this plugin for JavaScript projects.

```sh
Plug 'squgeim/bharyang-vim', { 'do': 'npm install -g bharyang-cli', 'for': ['javascript'] } 
```

For manual installations, install `bharyang-cli` from `npm`:
```sh
npm install -g bharyang-cli
```

## Usage

Select the import lines in visual mode. Use any of the following commands:

```
Bharyang
BharyangAsc
BharyangDesc
BharyangGroup
```
The `Bharyang` command uses a configuration value to determine default sort type. The value can be one of `asc`, `desc` or `group`. For example, to set it to `desc`:
```vim
let g:bharyang_default_sort_type="desc"
```

<img src="https://media.giphy.com/media/PR88YW3eX7Y4Rr6fkZ/giphy.gif" />

## Contribution

The code is quite straight forward, [bharyang-cli](https://github.com/squgeim/bharyang-cli) does all of the heavy lifting. Pull requests are always welcome.
