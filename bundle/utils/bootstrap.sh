
source ~/.powerZsh/zsh-git-prompt/zshrc.sh

PROMPT='%B%m%~%b$(git_super_status) %# '
export PATH="${PATH}:~/bin"

export VISUAL=vim
export EDITOR="$VISUAL"

