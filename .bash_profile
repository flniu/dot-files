export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH=$PATH:/usr/local/sbin:$HOME/.local/arcanist/bin:$HOME/.bin:$HOME/.cabal/bin:$HOME/.local/confluent/bin

if [ -f "$HOME/.envvar" ]; then
  source $HOME/.envvar
fi

# Python
export PYTHONPATH=.
export BENCH_PATH=./bench

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/bin/virtualenvwrapper.sh

#pyenv settings
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#pyenv-virtualenv settings
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# for pyenv install
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/sqlite/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/sqlite/lib/pkgconfig"

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Ruby
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

# Vim
alias v=vim
alias vd='vim -d'

# Git
alias gc1='git clone --depth=1'
alias gn='git number'
alias gna='git number add'
alias gnd='git number diff'
alias gnv='git number -c vim'
alias gngv='git number -c gvim'
alias gll='git log --pretty=format:"%Cred%h %C(bold blue)<%an> %Cgreen(%ar) %C(auto)%d %Creset%s" --graph'
alias glla='git log --pretty=format:"%Cred%h %C(bold blue)<%an> %Cgreen(%ar) %C(auto)%d %Creset%s" --graph --all'
alias glld='git log --pretty=format:"%Cred%h %C(bold blue)<%an> %Cgreen(%ai) %C(auto)%d %Creset%s" --graph'
alias gllda='git log --pretty=format:"%Cred%h %C(bold blue)<%an> %Cgreen(%ai) %C(auto)%d %Creset%s" --graph --all'

# JS
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

# Misc
export VAULT_ADDR=https://vault.roomis.com.cn

#for lms worker
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
