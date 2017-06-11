# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/parth/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
#else
#   export EDITOR='mvim'
#fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"

# Copied from previous shell (bash)'s settings

## enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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

export SCALA_HOME="$HOME/scala-2.11.8"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/chapel/bin/linux64/" # Add chpl compiler to path
export PATH="$PATH:$SCALA_HOME/bin/" # Add Scala to path
export PATH="$PATH:$HOME/figaro_4.0.0.0-2.11/"
export CHPL_HOME="$HOME/chapel"
export GASNET_SPAWNFN=L
export MANPATH="$CHPL_HOME/man:$MANPATH"

export CLASSPATH="/home/parth/figaro_4.0.0.0-2.11/figaro_2.11-4.0.0.0-fat.jar:."

alias ducks='du -cks * | sort -rn'

export PATH="$HOME/.cabal/bin:/opt/cabal/1.24/bin:/opt/ghc/8.0.2/bin:$PATH"

# Set android-dev related env vars
export ANDROID_HOME="/home/parth/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

# Add Go to PATH
export GOPATH="/home/parth/go"
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

export PATH=$PATH:/home/parth/.local/bin

alias g='git'
alias glog='git log --graph --all --decorate'
alias gl=glog
alias ga='git add'
alias gc='git checkout'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'

# Routes to copy files to-from X clipboard
function fileToClip() {
    cat $1 | xclip -in -selection clipboard
}

function clipToFile() {
    xclip -out -selection clipboard > $1
}

function clipToFileAppend() {
    xclip -out -selection clipboard >> $1
}

function scrotToClip() {
    # https://bbs.archlinux.org/viewtopic.php?id=163312
    import png:- | xclip -selection c -t image/png
}

alias f2c='fileToClip'
alias c2f='clipToFile'
alias c2fa='clipToFileAppend'
alias s2c='scrotToClip'

# Make less with syntax highlighting
function cless() {
    pygmentize -f terminal "$1" | less -R
}


# The following three lines have been added by UDB DB2.
if [ -f /home/parth/sqllib/db2profile ]; then
    . /home/parth/sqllib/db2profile
fi

alias r='ranger'

function LW() {
	{
		sudo mount -t "ntfs" -o "uhelper=udisks2,nodev,nosuid,uid=1000,gid=1000,dmask=0077,fmask=0177" "/dev/sda6" "/media/parth/Windows Data" &&
		sudo mount -t "ntfs" -o "uhelper=udisks2,nodev,nosuid,uid=1000,gid=1000,dmask=0077,fmask=0177" "/dev/sda4" "/media/parth/Windows C drive"	&&
		printf "Windows loaded successfully (Writable)\n"
	} || {
	    printf "\nFailed to load windows in writable mode\n"
    	sudo mount -t "ntfs" -ro "uhelper=udisks2,nodev,nosuid,uid=1000,gid=1000,dmask=0077,fmask=0177" "/dev/sda6" "/media/parth/Windows Data"
	    sudo mount -t "ntfs" -ro "uhelper=udisks2,nodev,nosuid,uid=1000,gid=1000,dmask=0077,fmask=0177" "/dev/sda4" "/media/parth/Windows C drive"
    	printf "Windows loaded successfully (read only)\n"
    }
}

function RN() {
    sudo service network-manager restart
}

alias s='sudo'
alias ohmyzsh="mate ~/.oh-my-zsh"

source /home/parth/utils/per-directory-history/per-directory-history.zsh

alias x='fortune | cowsay'
