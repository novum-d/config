if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"
fish_add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
fish_add_path $HOME/Library/Android/sdk/platform-tools
fish_add_path $HOME/.cargo/bin

source /opt/homebrew/opt/asdf/libexec/asdf.fish


set RUST_BACKTRACE 1


cp -rf ~/config/nvim ~/.config
cp -rf ~/config/.wezterm.lua ~/


# template
alias ll='ls -al'
alias dcp='docker compose'
alias g='git'
alias n='nvim'
# ~/config/git/git_startup

# create file
alias txt='touch ~/Desktop/memo.txt'
alias md='touch ~/Desktop/README.md'

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
