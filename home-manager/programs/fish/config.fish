if status is-interactive
    # Commands to run in interactive sessions can go here
end


if test (uname -s) = Darwin
    fish_add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
    fish_add_path $HOME/Library/Android/sdk/platform-tools
    eval (/opt/homebrew/bin/brew shellenv)
else
end

fish_add_path $HOME/.cargo/bin
set -g theme_nerd_fonts yes


set RUST_BACKTRACE 1
set ZELLIJ_CONFIG_FILE $HOME/config/zellij/config.kdl


cp -rf ~/repos/config/nvim ~/.config
cp -rf ~/repos/config/.wezterm.lua ~/

zoxide init fish | source

# template
alias lg='lazygit'
alias zl="zellij --config $ZELLIJ_CONFIG_FILE"
alias ll='ls -al'
alias dcp='docker compose'
alias g='git'
alias n='nvim'
alias m="nvim ~/repos/md/buf"
# ~/config/git/git_startup

# create file
alias txt='touch ~/Desktop/memo.txt'
alias md='touch ~/Desktop/README.md'
alias ct="cat $1 | pbcopy"

function ghq_fzf_repo -d 'Repository search'
    ghq list --full-path | fzf --reverse --height=100% | read select
    [ -n "$select" ]; and cd "$select"
    echo " $select "
    commandline -f repaint
end

# fish key bindings
function fish_user_key_bindings
    bind \cg ghq_fzf_repo
end
