export ZSH="$HOME/.oh-my-zsh"
export EDITOR=helix
ZSH_THEME="bira"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/go/bin"
export ELECTRON_OZONE_PLATFORM_HINT=auto
alias ls='ls --hyperlink=auto --color=auto'
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


eval "$(zellij setup --generate-auto-start zsh)"

source <(fzf --zsh)
source $ZSH/oh-my-zsh.sh
eval "$(zoxide init zsh)"

YAZI_TERM=""
if [ -n "$YAZI_LEVEL" ]; then
	YAZI_TERM=" yazi $ "
fi

PS1="$PS1$YAZI_TERM"
