# template
alias ll='ls -al'
alias end='sudo shutdown -h now'

# create file
alias txt='touch ~/Desktop/memo.txt'
alias md='touch ~/Desktop/README.md'

# edit config
alias vpr='vim ~/config/linux/.zprofile'
alias vrc='vim ~/config/linux/.zshrc'
alias spr='source ~/.zprofile'
alias src='source ~/.zshrc'

alias g='git'


# oracle
alias sqlp='sqlplus hamadatomoki@\"localhost:1521/orcldb\"'
alias sqlp2='sqlplus system@\"localhost:1521/orcldb\"'


# masterブランチからのコミット履歴を再帰的にたどるglgpコマンド
# 使い方：glgp masterブランチからの履歴
# 例) glgp develop develop2
alias glgp='git log --graph --pretty=format:"%h %s" master'

alias gitini='git init . && git add .&& git commit --allow-empty -m "Initial commit" && hub create && git push -u origin main'
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
clear
