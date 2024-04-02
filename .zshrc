export ZSH="$HOME/.oh-my-zsh"

export EDITOR=nvim
ZSH_THEME="kphoen"

export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="/home/dedligma/.local/bin:$PATH"
export PATH="~/.npm-global/bin:$PATH"

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