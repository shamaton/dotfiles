# export GOPATH="$HOME/works/go"
# export PATH="$PATH:$GOPATH/bin"
# export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

export ABBR_USER_ABBREVIATIONS_FILE="$HOME/.config/my-zsh/abbreviations"
abbr load

alias ls='eza --icons --color=always --group-directories-first'
alias cat='bat --color=always'
alias top='btop'
alias vim=nvim
alias zellij='TERM=xterm-256color zellij'

eval "$(direnv hook zsh)"

if [[ -d "$HOME/.config/company/zsh" ]]; then
  for f in "$HOME/.config/company/zsh"/*; do
    [[ -f "$f" ]] && source "$f"
  done
fi
