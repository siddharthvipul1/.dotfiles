export ZSH=/home/siddharthvipul/.oh-my-zsh

ZSH_THEME="robbyrussell"
export UPDATE_ZSH_DAYS=13

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
#set -o vi
#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#Paths
export PATH="/home/siddharthvipul/anaconda3/bin:$PATH"

#compdef dnf=yum
#echo -ne " Hello Vipul ... Its "; date '+%A,%-d %B %Y'""
source $HOME/.shells/alias
source $HOME/.shells/functions

PATH="/home/siddharthvipul/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/siddharthvipul/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/siddharthvipul/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/siddharthvipul/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/siddharthvipul/perl5"; export PERL_MM_OPT;
