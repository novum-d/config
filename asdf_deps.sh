# utils

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

## peco
asdf plugin add peco https://github.com/asdf-community/asdf-peco.git
asdf install peco latest
asdf global peco latest

## ghq
asdf plugin-add ghq https://github.com/kajisha/asdf-ghq
asdf install ghq latest
asdf global ghq latest

## github-cli
asdf plugin-add github-cli https://github.com/bartlomiejdanek/asdf-github-cli.git
asdf install github-cli latest
asdf global github-cli latest


# package tools

## node
# NODE_VERSION=18.13.0
# asdf plugin add nodejs
# asdf install nodejs $NODE_VERSION
# asdf global nodejs $NODE_VERSION

# programming language

## erlang
ERLANG_VERSION=25.2
asdf plugin add erlang
asdf install erlang $ERLANG_VERSION
asdf global erlang $ERLANG_VERSION

## elixir 
ELIXIR_VERSION=1.14.2-otp-25
asdf plugin add elixir
asdf install elixir $ELIXIR_VERSION
asdf global elixir $ELIXIR_VERSION

# phoenix
PHOENIX_VERSION=1.7.0-rc.2
mix local.hex --force
mix archive.install hex phx_new 1.7.0-rc.2 --force


