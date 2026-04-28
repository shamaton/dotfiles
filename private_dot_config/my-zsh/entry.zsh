export GOPATH="$HOME/works/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$(go env GOPATH)/bin"

export ABBR_USER_ABBREVIATIONS_FILE="$HOME/.config/my-zsh/abbreviations"
abbr load

alias ls='eza --icons --color=always --group-directories-first'
alias ccat='bat --color=always'
alias top='btop'
alias vim=nvim

eval "$(direnv hook zsh)"
eval "$(mise activate zsh --shims)"

if [[ -f "$HOME/.config/company/zsh/entry.zsh" ]]; then
  source "$HOME/.config/company/zsh/entry.zsh"
fi
