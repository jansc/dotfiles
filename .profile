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

# GIT bash completion
if [ -f /usr/share/git-core/git-completion.bash ] ; then
  . /usr/share/git-core/git-completion.bash
fi

alias ff='find . -name '
alias ws='python -m SimpleHTTPServer 9000'

if [[ $platform == 'osx' ]]; then
  alias updatedb='sudo /usr/libexec/locate.updatedb'
  export PGDATA=/usr/local/var/postgres
  PERL_MB_OPT="--install_base \"/Users/jans/perl5\""; export PERL_MB_OPT;
  PERL_MM_OPT="INSTALL_BASE=/Users/jans/perl5"; export PERL_MM_OPT;
  PERL5LIB="/Users/jans/perl5/lib/perl5/"; export PERL5LIB;
fi

if [[ $platform == 'linux' ]]; then
  # Workaround: make HipChat work
  # see http://notes.ericjiang.com/posts/803
  export LIBGL_ALWAYS_SOFTWARE=1
fi
export DISPLAY=:0.0
export IRCNICK=jansc
export IRCNAME="Jan Schreiber"
export PGHOST=127.0.0.1
export SAUCE_USERNAME=jans
source .saucekey
export CLICOLOR=1
export EDITOR=vim

# Git into the prompt:
# http://asemanfar.com/Current-Git-Branch-in-Bash-Prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
}

export PS1="\[\033[00m\]\u@\h\[\033[01;34m\] \w \[\033[31m\]\$(parse_git_branch) \[\033[00m\]$\[\033[00m\] "

# show list of shortcuts
# See http://zwischenzugs.tk/index.php/2015/07/01/bash-shortcuts-gem/
alias binds="bind -P | grep 'can be'"
