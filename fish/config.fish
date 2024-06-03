# set -gx NVM_DIR $HOME/.nvm

switch $(uname -m)
case "arm*"
  set arch arm
case "x86*"
  set arch intel
case "*"
  # not setting arch -> will throw exception where it is being used
  echo "!!!!!!!!Unknown architecture: $(uname -m) May wan to check fish config"
end

# if test $arch = "intel"
#   echo "Arch is intel"
# end

# if test $arch = "arm"
#   echo "Arch is arm"
# end

# Arm only for now, BEFORE loading paths
if test $arch = "arm"
  eval $(/opt/homebrew/bin/brew shellenv)
end

source ~/.config/fish/path.fish
source ~/.config/fish/aliases.fish

# set -gx NVM_DIR $HOME/.nvm
# if test -f $NVM_DIR/nvm.sh
#   [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#   [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# end

# rbenv
# To check: curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
# Intel only for now
if test $arch = "intel"
  set -gx RBENV_ROOT $HOME/work/.config/rbenv
  eval "$(rbenv init -)"
end

# https://fishshell.com/docs/current/cmds/status.html
# status is-interactive: returns 0 if fish is interactive - that is, connected to a keyboard.
# status is-login: returns 0 if fish is a login shell - that is, if fish should perform login tasks such as setting up the PATH
# still don't know what's the real difference, physically with the pc "is-interactive" seems to work better.
# Based on my testing, you are safe to use "is-interactive" always. These are the casuistics:
# with GUI: login - no, interactive - yes
# terminal (ctrl + alt + f2): login - yes, interactive - yes
# ssh: login - yes, interactive - yes
# invoking child fish shells will only be "interactive"


# fzf install: /usr/local/opt/fzf/install - Use uninstall script to remove fzf.
# for fzf, create symlink:
# M1:    sudo ln -s /opt/homebrew/opt /usr/local/opt
# INTEL: sudo ln -s /usr/local/opt /opt/homebrew/opt


if status is-interactive
 # history only needed in interactive mode
  if command -v atuin > /dev/null
    atuin init fish | source
  else
    echo "!!!Install atuin: https://github.com/atuinsh/atuin#install"
  end
end

if command -v zoxide > /dev/null
  zoxide init --cmd cd fish | source
else
  echo "!!!Install zoxide: https://github.com/ajeetdsouza/zoxide"
end

if command -v starship > /dev/null
  starship init fish | source
else
  echo "!!!Install starship: https://starship.rs/"
end

if command -v mise > /dev/null
  # make sure mise is in path
  mise activate fish | source
else
  echo "!!!Install mise: https://github.com/jdx/mise"
end

# google sdk - disabled now
# source "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 40%'
