export ZSH="$HOME/.oh-my-zsh"
export EDITOR=helix
ZSH_THEME="strug"
# ZSH_THEME="kphoen"
# ZSH_THEME="trapd00r"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="~/.npm-global/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/go/bin"
# export ELECTRON_OZONE_PLATFORM_HINT=x11
alias ls='ls --hyperlink=auto --color=auto'
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

