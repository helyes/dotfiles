#!/bin/bash

#.bash_profile
## .profile
## .bashrc
 ## .bashrc_local -- missing
 ## .bash_aliases


# test -f ~/.bashrc && source ~/.bashrc
DOTFILES_LOCATION=/Users/andras/work/.config/user/home

SECRETS_FILE=.secrets
[ -r "$DOTFILES_LOCATION/$SECRETS_FILE" ] && [ -f "$DOTFILES_LOCATION/$SECRETS_FILE" ] && echo "$DOTFILES_LOCATION/$SECRETS_FILE";

PATH_FILES="bash_path*"
#[ -r "$SECRETS_FILE" ] && [ -f "$SECRETS_FILE" ] && echo "$SECRETS_FILE";
for file in $DOTFILES_LOCATION/$PATH_FILES; do
	[ -r "$file" ] && [ -f "$file" ] && echo "$file";
done;

ALIASES_FILES="bash_aliases*"
for file in $DOTFILES_LOCATION/$ALIASES_FILES; do
	[ -r "$file" ] && [ -f "$file" ] && echo "$file";
done;

# for file in ~/.bash_*; do
# 	[ -r "$file" ] && [ -f "$file" ] && echo "$file";
# done;

# for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
# 	[ -r "$file" ] && [ -f "$file" ] && echo "$file";
# done;
