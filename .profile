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
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/opt/qt5/bin:$PATH
export PATH=$HOME/.roswell/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export TERMINAL=sakura
if [[ $platform == 'linux' ]]; then
   export TERMINAL=sakura
elif [[ $platform == 'freebsd' ]]; then
   export TERMINAL=xterm
fi

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
export ALTERNATE_EDITOR="vim"
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
alias ws='python3 -m http.server 9000'
alias mutt='neomutt'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Set up Node Version Manager
if [[ $platform == 'linux' ]]; then
  source /usr/share/nvm/init-nvm.sh
fi

export SBCL_HOME=/usr/local/lib/sbcl
export GOPHERUSCOLOR="022020202002020220" 

# Remember bash history forever
# http://jesrui.sdf-eu.org/remember-all-your-bash-history-forever.html
HISTTIMEFORMAT='%F %T '
HISTFILESIZE=-1
HISTSIZE=-1
HISTCONTROL=ignoredups
HISTIGNORE=?:??
# append to history, don't overwrite it
shopt -s histappend                 
# attempt to save all lines of a multiple-line command in the same history entry
shopt -s cmdhist
# save multi-line commands to the history with embedded newlines
shopt -s lithist

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###-tns-completion-start-###
if [ -f /home/jans/.tnsrc ]; then 
    source /home/jans/.tnsrc 
fi
###-tns-completion-end-###

