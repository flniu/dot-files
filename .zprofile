# Common
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export PATH=/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH:$HOME/bin

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
#if [[ "$(uname -s)" == "Linux" ]]; then BREW_TYPE="linuxbrew"; else BREW_TYPE="homebrew"; fi
#export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
#export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/${BREW_TYPE}-core.git"
#export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/${BREW_TYPE}-bottles"

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
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
export NVM_IOJS_ORG_MIRROR=http://npm.taobao.org/mirrors/iojs
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

# Python
if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Java
jdk() {
    version=$1
    export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
    java -version
}
export JODCONVERTER_LOCAL_OFFICEHOME=/Applications/LibreOffice.app/Contents
