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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
#force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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
    alias ll='ls -lh'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
    alias grep='grep --color=auto'
    alias thot='ssh -p 4242 -X ngsuser@146.48.79.71'
    alias horus='ssh -p 4242 luca@2.230.96.105'
    alias osiris='ssh -X lp471@tk-pc1.gurdon.cam.ac.uk'
    alias lab_backup='rsync -avzu --exclude '.Trash-1000' --exclude 'lost+found' --delete-after /home/luca/LAB/ /media/luca/backupGurdon/LAB'
    alias gurdon_backup='rsync -avzu --exclude '.Trash-1000' --exclude 'lost+found' -e "ssh -p 4242" --delete-after /home/luca/LAB/ luca@2.230.96.105:~/LAB_Backup'
    alias documents_backup='rsync -avzu --exclude '.Trash-1000' --exclude 'lost+found' -e "ssh -p 4242" --delete-after /home/luca/Documents/ luca@2.230.96.105:~/Documents'   
    alias myproxy='ssh -p 4242 -D 9999 -C luca@2.230.96.105'
    alias sam='ssh Luca@tk-mac1.gurdon.cam.ac.uk'
    alias tp='xinput set-button-map "TPPS/2 IBM TrackPoint" 0 0 0 4 5 6 7'
    alias osiris_wol='wakeonlan -i 131.111.45.156 38:d5:47:b0:39:2f'
    alias rename_bene_photos='jhead -nIMG_%Y%m%d_%H%M%S *.JPG'
    alias cpu='echo -e "\nTEMPERATURE:" && sensors | grep "high" && echo -e "\nFREQUENCY:" && cat /proc/cpuinfo | grep "MHz" && echo " "'
    alias doublescreen='xrandr --output VGA-1 --off --output DP-2-1 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2-2 --off --output DP-2-3 --off --output eDP-1 --primary --mode 2880x1620 --pos 0x1440 --rotate normal --output HDMI-2 --off --output HDMI-1 --off --output DP-2 --off --output DP-1 --off'
    alias nemo='nemo --no-desktop'
fi

stty -ixon

#colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lh='ls -lh'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

stty intr \^k
PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\u@\h: \w $ \[$(tput sgr0)\]"

PATH=$PATH:/home/luca/Apps/weblogo/
PATH=/home/luca/Apps/HOMER/bin:${PATH}
PATH=/home/luca/Apps/bamtools/bin:${PATH}
PATH=/home/luca/Apps/FastQC:${PATH}
PATH=/home/luca/Apps/HOMER/bin:${PATH}
PATH=/home/luca/Apps/meme/bin:${PATH}
PATH=/home/luca/Apps/UCSC_tools:${PATH}
PATH=/home/luca/Apps/subread-1.5.1/bin:${PATH}
PATH=/home/luca/Apps/sratoolkit.2.8.1-3/bin:${PATH}
