
# node
asdf plugin add nodejs
asdf install nodejs 14.0.0
asdf global nodejs 14.0.0

# erlang
asdf plugin add erlang
asdf install erlang 25.2
asdf global erlang 25.2

# elixir 
asdf plugin add elixir
asdf install elixir 1.14.2-otp-25
asdf global elixir 1.14.2-otp-25

# phoenix
mix local.hex
mix archive.install hex phx_new
