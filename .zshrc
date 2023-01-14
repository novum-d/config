export RUST_BACKTRACE=1
# sync
\cp -f ~/config/.vimrc ~/
\cp -f ~/config/git/.gitemoji ~/
\cp -f ~/.vscode/.workspace ~/.vscode/


source ~/config/.zprofile

# template
alias ll='ls -al'
alias ed='sudo shutdown -h now'
alias pg='docker compose -f ~/repos/docker/postgres/docker-compose.yml up -d'

# create file
alias txt='touch ~/Desktop/memo.txt'
alias md='touch ~/Desktop/README.md'

# edit config
alias sz='source ~/.zshrc && source ~/.zprofile'

alias g='git'
alias dc='docker-compose'


# oracle
alias sqlp='sqlplus hamadatomoki@\"localhost:1521/orcldb\"'
alias sqlp2='sqlplus system@\"localhost:1521/orcldb\"'


# masterブランチからのコミット履歴を再帰的にたどるglgpコマンド
# 使い方：glgp masterブランチからの履歴
# 例) glgp develop develop2
alias glgp='git log --graph --pretty=format:"%h %s" master'

alias gitini='git init . && git add . && git commit --allow-empty -m "Initial commit" && hub create && git push -u origin main'
alias gitpull='for remote in `git branch -r`; do git branch --track ${remote#origin/} $remote; done & git fetch --all & git pull --all'
alias giton='git config --global http.proxy http://ohs90223:argon3-3@proxy01.osaka.hal.ac.jp:8080'
alias gitoff='git config --global --unset http.proxy'


function regex () {
	ls -al | egrep $1
}

function dzip () {
	current=$(pwd)
	name=$(basename -- "$1")
	filename="${name%.*}"
	# extension="${name##*.}"
	target=""

	if [[ -d $1 ]]; then
		cd $1
		cd ..
		target=${filename}
	fi
	if [[ -f $1 ]]; then
		cd $(dirname $1)
		target=${name}
	fi

	zip -r ~/Downloads/${filename} ${target}
	cd ${current}
	open ~/Downloads
}

function peco-src () {
local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
if [ -n "$selected_dir" ]; then
	BUFFER="cd ${selected_dir}"
	zle accept-line
fi
zle clear-screen
}
zle -N peco-src
bindkey '^G' peco-src

function gitRef() {
	git remote remove origin
	git remote add origin git@github.com:HamadaTomoki/$1.git
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/powerlevel10k/powerlevel10k.zsh-theme

clear
