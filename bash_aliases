# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# Defined aliases.
alias ll='ls -lh'
# List all files colorized including dot files
alias la="ls -lha ${colorflag}"
alias l="ls -lh ${colorflag}"
alias t='tree -C'
alias ll1="tree --dirsfirst -ChFL 1"
alias ll2="tree --dirsfirst -ChFL 2"
alias ll3="tree --dirsfirst -ChFL 3"
alias "cd.."="cd .."

alias du1='du -d 1 -h '
alias du2='du -d 2 -h '
alias du3='du -d 3 -h '
alias duf='du -sh * '
alias fd='find . -type d -name '
alias ff='find . -type f -name '

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias h="history"

# Print each PATH entry on a separate line
alias ppath='echo -e ${PATH//:/\\n}'

alias billion='ssh admin@192.168.1.13'
alias cs='clear'
alias grep='grep --color'
alias pgrep='ps aux | grep -i '

#node stuff
alias urlencode='node -e "console.log(encodeURIComponent(process.argv[1]))"'
alias urldecode='node -e "console.log(decodeURIComponent(process.argv[1]))"'
alias pp_json='xargs -0 node -e "console.log(JSON.stringify(JSON.parse(process.argv[1]), null, 4));"'

alias genpwd="openssl rand 10 -base64"

# Git
#git rm $(git ls-files -d) - remove all deleted files from working tree
alias cdw='cd ~/work'
alias gitundo='git reset --soft HEAD~'
alias g='git'
alias gs='git status'
alias gss='git status -sb'

#IP addresses
alias ipp='echo `wget -qO- ipinfo.io/ip`'
alias ipl="ifconfig -a | perl -nle'/(\\d+\\.\\d+\\.\\d+\\.\\d+)/ && print $1'"

# sort env
alias envs='env | sort'

#fun
alias weather='curl -4 http://wttr.in/Brisbane'
alias yolo='curl -s http://whatthecommit.com/index.txt'

alias mongostart="brew services start mongodb; echo \"log: /usr/local/var/log/mongodb/mongo.log\""
alias mongostop="brew services stop mongodb"
alias mongostatus="brew services list mongodb"

alias memcachedstart='brew services start memcached'
alias memcachedstop='brew services stop memcached'

alias postgresstart='brew services start postgresql'
alias postgresstop='brew services stop postgresql'
