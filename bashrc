#!/bin/bash
# If not running interactively, don't do anything! 
[[ $- != *i* ]] && return

shopt -s checkwinsize

# Show date
DATE="$(tput setaf 1)[$(tput setaf 6)$(date)"
DATE="${DATE}$(tput setaf 1)]"
echo $DATE

# Show kernel info
KERNEL="$(tput setaf 1)[$(tput setaf 6)$(uname -srmn)"
KERNEL="${KERNEL}$(tput setaf 1)]"
echo "$KERNEL"$'\n'
# Reset colors
tput sgr0

#show calendar
ncal -B 1 -A 1;echo

# sanitize TERM:
safe_term=${TERM//[^[:alnum:]]/?}
match_lhs=""
 
[[ -f ~/.dir_colors ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs} ]] \
        && type -P dircolors >/dev/null \
        && match_lhs=$(dircolors --print-database)
 
if [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] ; then
 
        # Enable colors for ls, etc. Prefer ~/.dir_colors
        if type -P dircolors >/dev/null ; then
                if [[ -f ~/.dir_colors ]] ; then
                        eval $(dircolors -b ~/.dir_colors)
                elif [[ -f /etc/DIR_COLORS ]] ; then
                        eval $(dircolors -b /etc/DIR_COLORS)
                fi
        fi
 
        # -- CUSTOM PS1 String START --
 
        PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\076 \[\033[0m\]"
       
        alias ls="ls --color=auto"
        alias dir="dir --color=auto"
        alias grep="grep --colour=auto"
 
else
        # show root@
        PS1="\u@\h \w \$([[ \$? != 0 ]] && echo \":( \")\$ "
fi
 
PS2="> "
PS3="> "
PS4="+ "
 
# Try to keep environment pollution down, EPA loves us.
unset safe_term match_lhs

# ex - archive extractor
# usage: ex <file>
ex (){
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

man() {
  env LESS_TERMCAP_mb=$'\E[01;31m'   \
  LESS_TERMCAP_md=$'\E[01;38;5;74m'  \
  LESS_TERMCAP_me=$'\E[0m'           \
  LESS_TERMCAP_se=$'\E[0m'           \
  LESS_TERMCAP_so=$'\E[38;5;246m'    \
  LESS_TERMCAP_ue=$'\E[0m'           \
  LESS_TERMCAP_us=$'\E[04;38;5;146m' \
  man "$@"
}

# alias
alias la="ls -a"
alias ll="ls -l"
alias ls="ls -Gp --color=auto"
alias rm="rm -i"
alias rmf="rm -rfi"
alias ijavac="javac -cp ~/.ap.jar:. "
alias ijava="java -cp ~/.ap.jar:. "
alias vim="vi "
alias cls="clear ; ls"
#alias moodlepls="chromium --proxy-auto-detect http://moodle.univ-lille1.fr/ 2>/dev/null"
alias fucking="sudo"
alias umlet="/home/clement/Téléchargements/Umlet/./umlet.sh"
alias lille1="export http_proxy=http://proxy.univ-lille1.fr:3128;
              export https_proxy=https://proxy.univ-lille1.fr:3128;
              echo 'ok'"
alias stats="stat"
alias temp="/opt/vc/bin/vcgencmd measure_temp" 
alias gcc="gcc -Wall -W -Werror -std=c99"
alias cd..="cd .."
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
