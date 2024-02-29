# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export EDITOR=nvim
ZSH_THEME="kphoen"

export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="/home/dedligma/.local/bin:$PATH"
export PATH="~/.npm-global/bin:$PATH"
# alias python='python3.11'

SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

#export PATH="/home/dedligma/.local/bin:$PATH"
export PATH="$PATH:/home/dedligma/.cargo/bin"


alias ls='ls --hyperlink=auto --color=auto'

clg() {
  if [[ $1 == *.cpp ]]; then
    clang++ -std=c++20 "$@"
  elif [[ $1 == *.c ]]; then
    clang "$@"
  else
    echo "Unknown file type"
  fi
}

tt() {
  text=\"$@\"
  trans :ru "$text"
}

lg() {
  lazygit $@
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# alias open=kde-open5

function az() {
    tmp="$(mktemp -t "yazi-cwd.XXXXX")"
    yazi --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

plugins=(
  git 
  command-not-found
)



source $ZSH/oh-my-zsh.sh

