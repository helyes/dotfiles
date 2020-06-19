# shellcheck shell=bash
DOTFILES_LOCATION=~/work/.config/user/home

SECRETS_FILE=.secrets
# shellcheck source=/dev/null

[ -r "$DOTFILES_LOCATION/$SECRETS_FILE" ] && [ -f "$DOTFILES_LOCATION/$SECRETS_FILE" ] && source "$DOTFILES_LOCATION/$SECRETS_FILE";


PATH_FILE=bash_path
# shellcheck source=/dev/null
[ -r "$DOTFILES_LOCATION/$PATH_FILE" ] && [ -f "$DOTFILES_LOCATION/$PATH_FILE" ] && source "$DOTFILES_LOCATION/$PATH_FILE";


EXPORTS_FILE=bash_exports
# shellcheck source=/dev/null
[ -r "$DOTFILES_LOCATION/$EXPORTS_FILE" ] && [ -f "$DOTFILES_LOCATION/$EXPORTS_FILE" ] && source "$DOTFILES_LOCATION/$EXPORTS_FILE";

ALIASES_FILES="bash_aliases*"
# shellcheck source=/dev/null
for file in $DOTFILES_LOCATION/$ALIASES_FILES; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

PROMPT_FILE=bash_prompt
# shellcheck source=/dev/null
[ -r "$DOTFILES_LOCATION/$PROMPT_FILE" ] && [ -f "$DOTFILES_LOCATION/$PROMPT_FILE" ] && source "$DOTFILES_LOCATION/$PROMPT_FILE";

COMPLETITION_FILES="bash_completition*"
# shellcheck source=/dev/null
for file in $DOTFILES_LOCATION/$COMPLETITION_FILES; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

FUNCTION_FILES="bash_function*"
# shellcheck source=/dev/null
for file in $DOTFILES_LOCATION/$FUNCTION_FILES; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
