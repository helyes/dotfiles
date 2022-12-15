# set -gx NVM_DIR $HOME/.nvm

source ~/.config/fish/path.fish
source ~/.config/fish/aliases.fish

# set -gx NVM_DIR $HOME/.nvm
# if test -f $NVM_DIR/nvm.sh  
#   [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#   [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# end

# rbenv
# To check: curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
set -gx RBENV_ROOT $HOME/work/.config/rbenv
eval "$(rbenv init -)"


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

if status is-interactive

end

if command -v zoxide > /dev/null
  zoxide init fish | source
else
  echo "Install zoxide: https://github.com/ajeetdsouza/zoxide"
end

if command -v starship > /dev/null
  starship init fish | source
else
  echo "Install starship: https://starship.rs/"
end

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