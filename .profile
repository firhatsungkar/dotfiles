# Custom aliases
alias bat="bat --color=always"
alias clock="tty-clock"
alias cls="clear"
alias df="duf"
alias dig="dog"
alias f="fzf"
alias fdir="find . -t d | f"
alias find="fd"
alias git-stat="git shortlog -s -n --all --no-merges"
alias http="xh"
alias l="exa -l --icons --git -a"
alias ls="ls -lah --color=auto"
alias lt="exa --tree --level=2 --long --icons --git"
alias mv="mv -i"
alias nah="git reset --hard && git clean -df"
alias peek="fzf --preview 'bat --color=always {}' --preview-window '~3'"
alias pg="ping google.com"
alias pip="pip3"
alias pls="sudo"
alias py="python3"
alias python="python3"
alias reload="exec $SHELL"
alias rm="rm -i"
alias rmf="/bin/rm"
alias untar="tar -xvf"
alias vim="nvim"

# Config aliases
alias profileconfig="vi ~/.profile"
alias nvimconfig="nvim ~/.config/nvim/"
alias tmuxconfig="vim ~/.config/tmux/tmux.conf"
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
    local port="${1:-80}"
    python -m http.server "$port"
}
gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
vimdir() { (cd $1 && vim .) }

# Fzf for tmux
if [ -n "$TMUX" ]; then
  alias f="fzf-tmux";
fi

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
