
# elixir 
asdf plugin add erlang
asdf plugin add elixir
asdf install erlang 25.2
asdf install elixir 1.14.2-otp-25
asdf global erlang 25.2
asdf global elixir 1.14.2-otp-25

# phoenix
mix local.hex
mix archive.install hex phx_new
