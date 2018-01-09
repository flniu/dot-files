export PATH="$(brew --prefix homebrew/php/php71)/bin:/usr/local/sbin:$PATH"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export TMP=$HOME/.tmp

if [ -f "$HOME/.envvar" ]; then
  source $HOME/.envvar
fi

if [ -d "$HOME/.linuxbrew" ]; then
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
  export XDG_DATA_DIRS="$HOME/.linuxbrew/share:$XDG_DATA_DIRS"
fi

export PYTHONPATH=.

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export JAVA_HOME=$(/usr/libexec/java_home)

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

export HOMEBREW_GITHUB_API_TOKEN=b032c1f4399bb1e862e7a560e4f5ecba14bd9334
