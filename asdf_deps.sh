# utils

## github-cli
asdf plugin-add github-cli https://github.com/bartlomiejdanek/asdf-github-cli.git
asdf install github-cli latest
asdf global github-cli latest


# package tools

## node
NODE_VERSION=18.13.0
asdf plugin add nodejs
asdf install nodejs $NODE_VERSION
asdf global nodejs $NODE_VERSION

# programming language

## erlang
ERLANG_VERSION=25.2
asdf plugin add erlang
asdf install erlang $ERLANG_VERSION
asdf global install erlang $ERLANG_VERSION
asdf global erlang 25.2

## elixir 
ELIXIR_VERSION=1.14.2-otp-25
asdf plugin add elixir
asdf install elixir $ELIXIR_VERSION
asdf global elixir $ELIXIR_VERSION

# phoenix
mix local.hex --force
mix archive.install hex phx_new --force


