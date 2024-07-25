abbr -a abl 'abbr -l'
abbr -a yc 'cal -y'
abbr -a e lvim
abbr -a vim nvim
abbr -a v 'NVIM_APPNAME=nvchad nvim'
abbr -a g git
abbr -a gc 'git checkout'
abbr -a ga 'git add '
abbr -a gs 'git status'
abbr -a gsu 'git status -u'
abbr -a vimdiff 'lvim -d'
abbr -a amz 'env AWS_SECRET_ACCESS_KEY=(pass www/aws-secret-key | head -n1)'
abbr -a ssh 'TERM=xterm-256color ssh'
abbr -a ppath 'string split " " $PATH'
abbr -a ppaths 'string split " " $PATH | fzf'

abbr -a awspg11 'TERM=xterm-256color ssh -i /Users/andras/.ssh/shiftcare-andras.pem ec2-user@ec2-13-211-14-61.ap-southeast-2.compute.amazonaws.com'


abbr -a tma 'tmux attach-session -t '
abbr -a tmc 'tmux new -s '
abbr -a tml 'tmux ls'
abbr -a tmk 'tmux kill-session -t '


abbr -a cdw 'cd ~/work'
abbr -a du1 'du -d 1 -h '
abbr -a du2 'du -d 2 -h '
abbr -a du3 'du -d 3 -h '
abbr -a envs 'env | sort'
abbr -a envf 'env | fzf'
abbr -a tree1 'tree --dirsfirst -ChFL 1'
abbr -a tree2 'tree --dirsfirst -ChFL 2'
abbr -a tree3 'tree --dirsfirst -ChFL 3'

# brew
abbr -a brewlistdependencies 'brew leaves | xargs brew deps --formula --for-each | sed "s/^.*:/$(tput setaf 4)&$(tput sgr0)/"'
abbr -a brewo 'brew outdated'
abbr -a brewu 'brew upgrade'

# alias grep='grep --color=auto'
# alias fgrep='fgrep --color=auto'
# alias egrep='egrep --color=auto'

if command -v eza > /dev/null
  abbr -a l 'eza'
  abbr -a lg 'eza --long --header --icons --git'
  abbr -a ls 'eza'
  abbr -a ll 'eza -l'
  abbr -a lll 'eza -la'
else
  abbr -a l 'ls'
  abbr -a ll 'ls -l'
  abbr -a lll 'ls -la'
end

if command -v fd > /dev/null
  abbr -a find "fd"
end

if command -v rg > /dev/null
  abbr -a grep "rg"
end

function cds; cd (fd -t f | fzf | xargs dirname); end


abbr -a mprocs-db 'mprocs --config ~/work/sc/mprocs-database-tunnels.yaml'


# alias h="history"
# alias vim=nvim

# # Print each PATH entry on a separate line
# alias ppath='echo -e ${PATH//:/\\n}'

# alias billion='ssh admin@192.168.1.13'
# alias cs='clear'
# alias grep='grep --color'
# alias pgrep='ps aux | grep -i '

# #node stuff
# alias urlencode='node -e "console.log(encodeURIComponent(process.argv[1]))"'
# alias urldecode='node -e "console.log(decodeURIComponent(process.argv[1]))"'
# alias pp_json='xargs -0 node -e "console.log(JSON.stringify(JSON.parse(process.argv[1]), null, 4));"'

# alias genpwd="openssl rand 10 -base64"

# alias gitundo='git reset --soft HEAD~'
# alias g='git'
# alias gs='git status'
# alias gss='git status -sb'

# #IP addresses
# alias ipp='echo `wget -qO- ipinfo.io/ip`'
# alias ipl="ifconfig -a | perl -nle'/(\\d+\\.\\d+\\.\\d+\\.\\d+)/ && print $1'"

# # sort env
# alias envs='env | sort'

# #fun
# alias weather='curl -4 http://wttr.in/Brisbane'
# alias yolo='curl -s http://whatthecommit.com/index.txt'

# alias mongostart="brew services start mongodb; echo \"log: /usr/local/var/log/mongodb/mongo.log\""
# alias mongostop="brew services stop mongodb"
# alias mongostatus="brew services list mongodb"

# alias memcachedstart='brew services start memcached'
# alias memcachedstop='brew services stop memcached'

# alias postgresstart='brew services start postgresql'
# alias postgresstop='brew services stop postgresql'
