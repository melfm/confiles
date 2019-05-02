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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Disable touchpad tap click on dell xp
synclient MaxTapTime=0

# SHELL SETTINGS
parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
    }
PS1='[\w]\[\033[1;35m\]$(parse_git_branch)\[\033[0m\] > '

export PATH="$PATH:/usr/local/cuda-8.0/bin"
export CUDA_HOME="/usr/local/cuda-8.0/"

# Added for mujoco
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.mujoco/mjpro150/bin:/usr/lib/nvidia-384:/usr/local/cuda-8.0/lib64"
# Needed for GL version
export LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libGLEW.so"

export WORKSPACE="$HOME/Workspace"

alias python="python3.5"

# Common dirs
alias down="cd ~/Downloads";

# Clean swp files
alias cleanswp="cd /tmp; rm *.swp"

# CARLA
alias carla="cd /home/melissa/Workspace/CARLA_0.8.4"
alias actcar="carla; cd PythonClient; source .carla/bin/activate"

# Mujoco paths
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/adaptation/mfmozifi/.mujoco/mjpro150/bin:/usr/lib/nvidia-396:/usr/local/cuda-9.0/lib64"
export LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libGLEW.so"

# lulu - work
alias mel="cd /usr/local/data/melfm"

# LSDR project
alias spin="source /usr/local/data/melfm/virt_evns/spinning/bin/activate"
alias spinup="cd /usr/local/data/melfm/spinningup"
alias spinplot="python spinup/utils/plot.py"
alias spinppo="python spinup/algos/ppo/experiment_runner.py"
alias ppotran="python spinup/algos/ppo/ppo_transfer.py"
alias spinat="source /usr/local/data/melfm/Workspace/virtual_envs/spinning/bin/activate"
alias spinupat="cd /usr/local/data/melfm/Workspace/spinningup"

# Server hooks
alias hookupcedar="sshfs -o reconnect -o Ciphers=aes128-ctr -o Compression=no melfm24@cedar.computecanada.ca:/home/melfm24/projects/def-dpmeger/melfm24 cedar"
alias hookupbeluga="sshfs melfm24@beluga.computecanada.ca:/home/melfm24/projects/def-dpmeger/melfm24 beluga"

alias hookupatl="sshfs mfmozifi@atlantis.cim.mcgill.ca:/usr/local/data/melfm atlantis"





