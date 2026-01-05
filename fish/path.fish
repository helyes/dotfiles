
if status is-interactive
 # echo "is-interactive"
 # echo "Managing path..."
 #gpg
 set PATH $PATH /usr/local/opt/gnupg@1.4/libexec/gpgbin

 set PATH $PATH $HOME/Script

 # Google depot tools
 # https://commondatastorage.googleapis.com/chrome-infra-docs/flat/depot_tools/docs/html/depot_tools_tutorial.html#_setting_up
 fish_add_path -aP ~/work/tools/depot_tools

 # Flutter
 set -gx FLUTTER_HOME $HOME/Applications/flutter
 fish_add_path -aP $FLUTTER_HOME/bin

 # Android sdk home
 set -gx ANDROID_HOME $HOME/Library/Android/sdk
 fish_add_path -aP $ANDROID_HOME/emulator
 fish_add_path -aP $ANDROID_HOME/tools

 # aws eb cli
 fish_add_path -aP $HOME/.local/bin

 # Dart stagehand
 fish_add_path -aP $HOME/.pub-cache/bin

 # Rust
 set -gx CARGO_HOME $HOME/Applications/.cargo
 fish_add_path -P $CARGO_HOME/bin

 # LM Studio CLI (lms)
 fish_add_path set -aP /Users/andras/.lmstudio/bin

 # Neovim (nvim)
 #export PATH="$PATH:${HOME}/work/.config/rbenv/versions/2.3.8/lib/ruby/gems/2.3.0/"

 # fix it, 
 # fish_add_path -mP $HOME/.nvm/versions/node/v14.18.3/bin
 

 # homebrew - leave it last to have the below two at the front of path
 fish_add_path -mP /usr/local/sbin
 fish_add_path -mP /usr/local/bin

 # string split " " $PATH
end

if status is-login
 # echo "is-login..."
end

