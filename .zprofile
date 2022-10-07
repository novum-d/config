export GOPATH=$HOME
export MY_COMMANDS=~/config/bin
export git='git@github.com:HamadaTomoki'
export RUST_PATH=~/.cargo/bin
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

PATH=$PATH:$GOPATH/bin:$MY_COMMANDS:$RUST_PATH

source $MY_COMMANDS/z.sh
