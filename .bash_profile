export EDITOR=vim
export TMP=$HOME/.tmp

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

alias so=source
alias v=vim
alias vd='vim -d'
