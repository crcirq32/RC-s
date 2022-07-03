# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='🐧[\d \t]🐧$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias reloadbash='. ~/.bashrc'
alias dropcaches='sudo sh -c "/usr/bin/echo 1 > /proc/sys/vm/drop_caches && /usr/bin/echo 2 > /proc/sys/vm/drop_caches && /usr/bin/echo 3 > /proc/sys/vm/drop_caches"'
alias EdWeb='cd ~/Desktop/Website/ && sudo vi -p ./*.html ./*.css'   
alias TEMP='cpu=$(</sys/class/thermal/thermal_zone0/temp) && echo "$((cpu/1000))C"'
alias bootlog='sudo journalctl --no-hostname -o short-monotonic --boot -0'
alias cleanenv='env -i bash --noprofile --norc'
alias grep='grep --color=auto'
alias vibash='sudo vi ~/.bashrc'
alias listfailed='systemctl list-units --state=failed'
alias mapvdso='for i in `seq 1 10`; do cat /proc/self/maps | grep vdso ; done'
alias mapvvar='for i in `seq 1 10`; do cat /proc/self/maps | grep vvar ; done'
alias mapstack='for i in `seq 1 10`; do cat /proc/self/maps | grep stack ; done'

alias cc='sudo gcc'
alias dd='sudo dd'
alias ps='sudo ps'
alias rm='sudo rm'
alias cp='sudo cp'
alias echo='sudo echo'

#update Kern
alias updkern='wget https://raw.githubusercontent.com/pimline/ubuntu-mainline-kernel.sh/master/ubuntu-mainline-kernel.sh'
alias ikern='install ubuntu-mainline-kernel.sh /usr/local/bin/'
alias runkern='ubuntu-mainline-kernel.sh -c'
alias inskern='ubuntu-mainline-kernel.sh -i'


alias aptsearch='apt-cache search $1'
alias fdsid='sudo find / -user root -perm -4000'
alias gtstky='find / -perm /6000 2</dev/null'
alias psp='ps -p $1 -o comm='
alias logusr='last | sed "/^root /d"'
alias sysusrinfo='sed -e "s/:. :/:/" /etc/passwd'
alias ttrace='touch /tmp/strace.txt && strace -d -v -o /tmp/strace.txt $1'
alias cattrace='cat /tmp/strace.txt'
alias ufwlog='sudo cat /var/log/ufw.log | grep "BLOCK" | less +G'
alias find1='find $1 / 2>/dev/null | grep $1'
alias getvimupdate='git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && sudo sh ~/.vim_runtime/install_awesome_vimrc.sh'
alias updateall='apt update -y && apt upgrade -y && apt full-upgrade -y && apt-get autoremove --purge -y'
alias TDHISTORY='echo "export HISTTIMEFORMAT="%d/%m/%y %T " >> ~/.bash_profile'
alias jobsp='jobs -ld'

#nmap search
#locate -r '\.nse$' | xargs grep categories | grep 'default\|version\|safe' | grep $1

#use files as arguments
alias difxxd='diff <(xxd $1) <(xxd $2)'

## Git aliases
alias g='git'
alias gfu='git fetch upstream'
alias gfo='git fetch origin'
alias gr='git rebase'
alias gpull='git pull'
alias gs='git status'
alias gc='git checkout'
alias gl="git log --pretty=format:'%Cblue%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset' --abbrev-commit --date=relative"
alias gbranches='git branch -a'
alias gnb='git checkout -b'
alias gnewbranch='git checkout -b'
alias grmbranch='git branch -d'
alias gd='git diff'
alias gss='git stash save'
alias gsp='git stash pop'
alias gsl='git stash list'
alias ga='git add'
alias gaa='git add -A'
alias gcom='git commit'
alias gcommam='git add -A && git commit -m'
alias gcomma='git add -A && git commit'
alias gcommend='git add -A && git commit --amend --no-edit'
alias gm='git merge'
alias gcp='git cherry-pick'
alias gpoh='git push origin HEAD'
alias grom='git rebase origin/master'
alias gcd='cd ~/repos/'

#setup jupyter env

#https://speedysense.com/install-jupyter-notebook-on-ubuntu-20-04/
#mkdir -p ~/Desktop/notebook
#cd ~/Desktop/notebook
#virtualenv jupyterenv
#source jupyterenv/bin/activate -> moves to env
#pip install jupyter

#run jupyter notebook
#jupyter notebook

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
