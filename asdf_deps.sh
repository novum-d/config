# utils
## fzf
asdf plugin add fzf https://github.com/kompiro/asdf-fzf.git
asdf install fzf latest
asdf global fzf latest

## zoxide
asdf plugin add zoxide https://github.com/nyrst/asdf-zoxide.git
asdf install zoxide latest
asdf global zoxide latest

## zellij
asdf plugin add zellij https://github.com/chessmango/asdf-zellij.git
asdf install zellij latest
asdf global zellij latest

## fd
asdf plugin add fd
asdf install fd latest
asdf global fd latest
fd --type f .conf /etc

## lazygit
asdf plugin add lazygit https://github.com/nklmilojevic/asdf-lazygit.git
asdf install lazygit latest
asdf global lazygit latest

## rigrep
asdf plugin add ripgrep
asdf install ripgrep latest
asdf global ripgrep latest
rg

## ghq
asdf plugin-add ghq https://github.com/kajisha/asdf-ghq
asdf install ghq latest
asdf global ghq latest

## github-cli
asdf plugin-add github-cli https://github.com/bartlomiejdanek/asdf-github-cli.git
asdf install github-cli 2.27.0
asdf global github-cli 2.27.0

# package tools

## node
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

# programming language

## java
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java openjdk-17
asdf global java openjdk-17

## erlang
# sudo apt -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk
asdf plugin add erlang
asdf install erlang latest
asdf global erlang latest

## elixir
asdf plugin add elixir
asdf install elixir latest
asdf global elixir latest

# phoenix
mix local.hex --force
mix archive.install hex phx_new --force
