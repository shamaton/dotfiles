# fzf shell integration
source <(fzf --zsh)

# fzf default UI
export FZF_DEFAULT_OPTS='
  --height 40%
  --layout=reverse
  --border
  --info=inline
  --cycle
'

# Ctrl-T: ファイル選択時のプレビュー
export FZF_CTRL_T_OPTS='
  --preview "bat --style=numbers --color=always --line-range :500 {} 2>/dev/null"
  --preview-window=right:60%:wrap
  --walker-skip .git,node_modules,target,.venv
'

# Alt-C: ディレクトリ移動時のプレビュー
export FZF_ALT_C_OPTS='
  --preview "eza --tree --level=2 --color=always {} 2>/dev/null || ls -la {}"
  --preview-window=right:60%:wrap
  --walker-skip .git,node_modules,target,.venv
'

# Ctrl-R: 履歴検索
export FZF_CTRL_R_OPTS='
  --preview "echo {}"
  --preview-window=down:3:wrap
'
