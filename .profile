platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
fi

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH:$HOME/bin"
export PATH=/usr/local/ravnutilities/bin:$PATH
export PATH=/usr/local/opt/qt5/bin:$PATH
export PATH=$HOME/.roswell/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export TERMINAL=sakura

# GIT bash completion
if [ -f /usr/share/git-core/git-completion.bash ] ; then
  . /usr/share/git-core/git-completion.bash
fi
if [ -f /etc/profile.d/bash_completion.sh ] ; then
  source /etc/profile.d/bash_completion.sh
fi


if [[ $platform == 'osx' ]]; then
  alias updatedb='sudo /usr/libexec/locate.updatedb'
  export PGDATA=/usr/local/var/postgres
  PERL_MB_OPT="--install_base \"/Users/jans/perl5\""; export PERL_MB_OPT;
  PERL_MM_OPT="INSTALL_BASE=/Users/jans/perl5"; export PERL_MM_OPT;
  PERL5LIB="/Users/jans/perl5/lib/perl5/"; export PERL5LIB;
fi

if [[ $platform == 'linux' ]]; then
  export DISPLAY=:0.0
fi

export IRCNICK=jansc
export IRCNAME="Jan Schreiber"
export PGHOST=127.0.0.1
export CLICOLOR=1
export EDITOR="emacsclient --no-wait"
alias e='emacsclient --no-wait'

# Git into the prompt:
# http://asemanfar.com/Current-Git-Branch-in-Bash-Prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
}

export PS1="\[\033[00m\]\u@\h\[\033[01;34m\] \w \[\033[31m\]\$(parse_git_branch) \[\033[00m\]$\[\033[00m\] "

# show list of shortcuts
# See http://zwischenzugs.tk/index.php/2015/07/01/bash-shortcuts-gem/
alias binds="bind -P | grep 'can be'"
alias prettyjson='python -m json.tool'  
alias ff='find . -name '
alias ws='python -m http.server 9000'
alias mutt='neomutt'

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Set up Node Version Manager
#source /usr/share/nvm/init-nvm.sh

export SBCL_HOME=/usr/local/lib/sbcl
export GOPHERUSCOLOR="022020202002020220" 

