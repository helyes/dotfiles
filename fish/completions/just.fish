# brew completitions installed here: exa -l  /usr/local/share/fish/vendor_completions.d

function __fish_just_complete_recipes
    # requires gsed (gnu sed)
    # https://github.com/casey/just/issues/1703
    just --list 2> /dev/null | gsed -e '1d; s/^\s*\([^[:space:]]*\)[^#]*$/\1/' -e 's/^\s*\([^[:space:]]*\)[^#]*# \(.*\)$/\1\t\2/'
end

# don't suggest files right off
complete -c just -n "__fish_is_first_arg" --no-files

# complete recipes
complete -c just -a '(__fish_just_complete_recipes)'

# autogenerated completions
complete -c just -n "__fish_use_subcommand" -l chooser -d 'Override binary invoked by `--choose`'
complete -c just -n "__fish_use_subcommand" -l color -d 'Print colorful output' -r -f -a "auto always never"
complete -c just -n "__fish_use_subcommand" -l command-color -d 'Echo recipe lines in <COMMAND-COLOR>' -r -f -a "black blue cyan green purple red yellow"
complete -c just -n "__fish_use_subcommand" -l dump-format -d 'Dump justfile as <FORMAT>' -r -f -a "just json"
complete -c just -n "__fish_use_subcommand" -l list-heading -d 'Print <TEXT> before list'
complete -c just -n "__fish_use_subcommand" -l list-prefix -d 'Print <TEXT> before each list item'
complete -c just -n "__fish_use_subcommand" -s f -l justfile -d 'Use <JUSTFILE> as justfile'
complete -c just -n "__fish_use_subcommand" -l set -d 'Override <VARIABLE> with <VALUE>'
complete -c just -n "__fish_use_subcommand" -l shell -d 'Invoke <SHELL> to run recipes'
complete -c just -n "__fish_use_subcommand" -l shell-arg -d 'Invoke shell with <SHELL-ARG> as an argument'
complete -c just -n "__fish_use_subcommand" -s d -l working-directory -d 'Use <WORKING-DIRECTORY> as working directory. --justfile must also be set'
complete -c just -n "__fish_use_subcommand" -s c -l command -d 'Run an arbitrary command with the working directory, `.env`, overrides, and exports set'
complete -c just -n "__fish_use_subcommand" -l completions -d 'Print shell completion script for <SHELL>' -r -f -a "zsh bash fish powershell elvish"
complete -c just -n "__fish_use_subcommand" -s s -l show -d 'Show information about <RECIPE>'
complete -c just -n "__fish_use_subcommand" -l dotenv-filename -d 'Search for environment file named <DOTENV-FILENAME> instead of `.env`'
complete -c just -n "__fish_use_subcommand" -l dotenv-path -d 'Load environment file at <DOTENV-PATH> instead of searching for one'
complete -c just -n "__fish_use_subcommand" -l check -d 'Run `--fmt` in \'check\' mode. Exits with 0 if justfile is formatted correctly. Exits with 1 and prints a diff if formatting is required.'
complete -c just -n "__fish_use_subcommand" -s n -l dry-run -d 'Print what just would do without doing it'
complete -c just -n "__fish_use_subcommand" -l highlight -d 'Highlight echoed recipe lines in bold'
complete -c just -n "__fish_use_subcommand" -l no-dotenv -d 'Don\'t load `.env` file'
complete -c just -n "__fish_use_subcommand" -l no-highlight -d 'Don\'t highlight echoed recipe lines in bold'
complete -c just -n "__fish_use_subcommand" -s q -l quiet -d 'Suppress all output'
complete -c just -n "__fish_use_subcommand" -l shell-command -d 'Invoke <COMMAND> with the shell used to run recipe lines and backticks'
complete -c just -n "__fish_use_subcommand" -l clear-shell-args -d 'Clear shell arguments'
complete -c just -n "__fish_use_subcommand" -s u -l unsorted -d 'Return list and summary entries in source order'
complete -c just -n "__fish_use_subcommand" -l unstable -d 'Enable unstable features'
complete -c just -n "__fish_use_subcommand" -s v -l verbose -d 'Use verbose output'
complete -c just -n "__fish_use_subcommand" -l changelog -d 'Print changelog'
complete -c just -n "__fish_use_subcommand" -l choose -d 'Select one or more recipes to run using a binary. If `--chooser` is not passed the chooser defaults to the value of $JUST_CHOOSER, falling back to `fzf`'
complete -c just -n "__fish_use_subcommand" -l dump -d 'Print justfile'
complete -c just -n "__fish_use_subcommand" -s e -l edit -d 'Edit justfile with editor given by $VISUAL or $EDITOR, falling back to `vim`'
complete -c just -n "__fish_use_subcommand" -l evaluate -d 'Evaluate and print all variables. If a variable name is given as an argument, only print that variable\'s value.'
complete -c just -n "__fish_use_subcommand" -l fmt -d 'Format and overwrite justfile'
complete -c just -n "__fish_use_subcommand" -l init -d 'Initialize new justfile in project root'
complete -c just -n "__fish_use_subcommand" -s l -l list -d 'List available recipes and their arguments'
complete -c just -n "__fish_use_subcommand" -l summary -d 'List names of available recipes'
complete -c just -n "__fish_use_subcommand" -l variables -d 'List names of variables'
complete -c just -n "__fish_use_subcommand" -s h -l help -d 'Print help information'
complete -c just -n "__fish_use_subcommand" -s V -l version -d 'Print version information'

