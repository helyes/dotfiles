# Dotfiles

## Symlinks

Symlink default files in home to the below ones in repo

```
~/.bash_profile -> bash_profile
~/.finicky.js -> finicky.js
~/.gitconfig -> gitconfig
```

## Loading order

Files are sourced in the below order

* .secrets
* bash_path
* bash_exports
* bash_aliases
* bash_aliases_mac
* bash_prompt
* bash_completition
* bash_function

### Multiple instances

Multiple instances of below files can be added. 

* bash_aliases
* bash_completition
* bash_function

As an example, if `bash_aliases`, `bash_aliases_2` and `bash_aliasesfoo` exist, all three will be sourced.
