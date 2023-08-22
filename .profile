# Custom aliases
alias clock="tty-clock"
alias cls="clear"
alias df="duf"
alias fd="fdfind"
alias git-stat="git shortlog -s -n --all --no-merges"
alias ls="ls -lah --color=auto"
alias mv="mv -i"
alias nah="git reset --hard && git clean -df"
alias pg="ping google.com"
alias pip="pip3"
alias pls="sudo"
alias python="python3"
alias py="python3"
alias reload="exec $SHELL"
alias rm="rm -i"
alias rmf="/bin/rm"
alias tmux="tmux -u "
alias untar="tar -xvf"
alias vim="nvim"

# Config aliases
alias profileconfig="vi ~/.profile"
alias nvimconfig="nvim ~/.config/nvim/"
alias tmuxconfig="vim ~/.tmux.conf"
alias vimconfig="vi ~/.vimrc"
alias zshconfig="vi ~/.zshrc"

createdir() {
	mkdir $1 && cd $_
}
gacm() {
	ga $1 && gcmsg $2
} 
git-clean-branch() {
	git branch | grep -v "master\|develop" | xargs git branch -D
}
server() {
    local port="${1:-8000}"
    python -m SimpleHTTPServer "$port"
}
gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
vimdir() { (cd $1 && vim .) }

# Source specific OS profile
if [[ "$OSTYPE" == "darwin"* ]]; then
  # MacOS profile
  . $HOME/.mac_profile
elif [[ "$(uname -r)" == *"microsoft"* ]]; then
  # WSL profile
  . $HOME/.wsl_profile
fi


CUSTOM_PROFILE=$HOME/.custom_profile
if [[ -f "$CUSTOM_PROFILE" ]]; then
  . $CUSTOM_PROFILE
else
    echo "$CUSTOM_PROFILE doesnt exist"
fi
