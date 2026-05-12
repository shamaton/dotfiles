cdp() {
  local dir
  dir=$(ghq list -p | grep "^$HOME/works/github.com/" | fzf) || return
  cd "$dir"
}
