# Dotfiles

## Symlinks

Symlink default files in home to the below ones in repo

```
~/.bash_profile -> bash_profile
~/.finicky.js -> finicky.js
~/.gitconfig -> gitconfig
ln -s ~/work/.config/user/home/hammerspoon ~/.hammerspoon
ln -s ~/work/.config/user/home/karabiner ~/.config/karabiner
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

# Finicky

Install: https://github.com/johnste/finicky

Symlink `~/.finicky.js` to point to `finicky.js` in the repo

# Hammerspoon
Samples: https://github.com/Hammerspoon/hammerspoon/wiki/Sample-Configurations
https://github.com/jkroes/oh-my-hammerspoon
https://github.com/digitalbase/hammerspoon/blob/master/init.lua

# Karabiner
https://karabiner-elements.pqrs.org/docs/
