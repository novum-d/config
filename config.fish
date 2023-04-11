if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"
fish_add_path $HOME/Library/Application Support/JetBrains/Toolbox/scripts
fish_add_path $HOME/Library/Android/sdk/platform-tools
fish_add_path $HOME/.cargo/bin

source /opt/homebrew/opt/asdf/libexec/asdf.fish
