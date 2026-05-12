eval "$(direnv hook zsh)"
eval "$(mise activate zsh --shims)"

export PATH="$PATH:$(go env GOPATH)/bin"

export GHQ_ROOT="$HOME/works"
export ABBR_USER_ABBREVIATIONS_FILE="$HOME/.config/my-zsh/abbreviations"
abbr load

alias ls='eza --icons --color=always --group-directories-first'
alias ccat='bat --color=always'
alias top='btop'
alias vim=nvim

source "${HOME}/.config/my-zsh/fzf.zsh"
source "${HOME}/.config/my-zsh/cdp.zsh"

if [[ -f "$HOME/.config/company/zsh/entry.zsh" ]]; then
  source "$HOME/.config/company/zsh/entry.zsh"
fi

