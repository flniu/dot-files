export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export PATH=$PATH:$HOME/.local/arcanist/bin

if [ -f "$HOME/.envvar" ]; then
  source $HOME/.envvar
fi

export PYTHONPATH=.

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/bin/virtualenvwrapper.sh

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

#export JAVA_HOME=$(/usr/libexec/java_home)

alias v=vim
alias vd='vim -d'

alias gc1='git clone --depth=1'
alias gn='git number'
alias gna='git number add'
alias gnv='git number -c vim'
alias gll='git log --pretty=format:"%C(yellow)%h %C(bold blue)<%an>%x09 %Cgreen(%ar) %C(auto)%d %Creset%s" --graph'
alias glla='git log --pretty=format:"%C(yellow)%h %C(bold blue)<%an>%x09 %Cgreen(%ar) %C(auto)%d %Creset%s" --graph --all'

alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

export VAULT_ADDR=https://vault.roomis.com.cn
