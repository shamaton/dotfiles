# nvim config

Personal Neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).

## Requirements

- Neovim latest stable
- `git`, `make`, `gcc`
- [ripgrep](https://github.com/BurntSushi/ripgrep), [fd](https://github.com/sharkdp/fd)
- [Nerd Font](https://www.nerdfonts.com/) (icons用)
- `go`, `npm` (言語サポート用)

## Structure

```
~/.config/nvim/
├── init.lua                    # メイン設定
└── lua/
    ├── kickstart/plugins/      # ベースプラグイン設定
    │   ├── autopairs.lua
    │   ├── debug.lua
    │   ├── gitsigns.lua
    │   ├── indent_line.lua
    │   ├── lint.lua
    │   └── neo-tree.lua
    └── custom/plugins/         # カスタムプラグイン設定
        ├── bufferline.lua
        ├── comment.lua
        ├── copilot.lua
        ├── persistence.lua
        ├── terraform.lua
        └── typescript-tools.lua
```

## Features

### LSP & Completion

- **LSP:** nvim-lspconfig + mason.nvim による自動インストール
  - 対応言語: Go (`gopls`), Lua (`lua_ls`), Rust (`rust_analyzer`), Terraform (`terraform-ls`), TypeScript (`typescript-tools`)
- **Completion:** blink.cmp (LuaSnip スニペット対応)
- **AI補完:** GitHub Copilot (blink-copilot 経由、最優先)
- **進捗表示:** fidget.nvim による LSP 進捗インジケーター

| キー | 動作 |
|------|------|
| `grn` | シンボルのリネーム |
| `gra` | コードアクション |
| `grd` | 定義へジャンプ |
| `grr` | 参照一覧 |
| `gri` | 実装へジャンプ |
| `grt` | 型定義へジャンプ |
| `gO` | ドキュメントシンボル |
| `gW` | ワークスペースシンボル |
| `<leader>th` | インレイヒントのトグル |

### Fuzzy Finder (Telescope)

| キー | 動作 |
|------|------|
| `<leader>sf` | ファイル検索 |
| `<leader>sg` | ライブ grep |
| `<leader>sw` | カーソル下の単語を検索 |
| `<leader>sd` | 診断情報を検索 |
| `<leader>sh` | ヘルプ検索 |
| `<leader>sk` | キーマップ検索 |
| `<leader><leader>` | バッファ一覧 |
| `<leader>s.` | 最近のファイル |
| `<leader>sn` | Neovim 設定を検索 |
| `<leader>/` | バッファ内ファジー検索 |

### File Explorer (Neo-tree)

| キー | 動作 |
|------|------|
| `\` | ファイルツリーのトグル |

ドットファイル・gitignore ファイルも表示。

### Buffer Management (Bufferline)

| キー | 動作 |
|------|------|
| `<Tab>` | 次のバッファ |
| `<S-Tab>` | 前のバッファ |
| `<leader>bH` | バッファを左へ移動 |
| `<leader>bL` | バッファを右へ移動 |
| `<leader>bp` | バッファのピン留め |
| `<leader>bP` | ピン留めしていないバッファを閉じる |
| `<leader>bo` | 他のバッファを閉じる |

### Git (Gitsigns)

| キー | 動作 |
|------|------|
| `]c` / `[c` | 次/前の変更へジャンプ |
| `<leader>hs` | ハンクをステージ |
| `<leader>hr` | ハンクをリセット |
| `<leader>hS` | バッファ全体をステージ |
| `<leader>hu` | ステージを取り消し |
| `<leader>hp` | ハンクのプレビュー |
| `<leader>hb` | 行の blame 表示 |
| `<leader>hd` | インデックスとの diff |
| `<leader>tb` | blame 表示のトグル |

### Code Formatting

- **conform.nvim** による保存時自動フォーマット (timeout: 500ms)
- Lua: `stylua`
- Terraform: `terraform_fmt`
- Go: `goimports` (LSP経由、保存時自動実行)

| キー | 動作 |
|------|------|
| `<leader>f` | バッファをフォーマット |

### Session Management (Persistence)

| キー | 動作 |
|------|------|
| `<leader>qs` | セッションを復元 |
| `<leader>qS` | セッションを選択して復元 |
| `<leader>ql` | 最後のセッションを復元 |
| `<leader>qd` | セッションを保存しない |

### その他

- **Treesitter:** bash, c, diff, go, html, lua, markdown, vim のシンタックスハイライト
- **mini.ai:** テキストオブジェクトの拡張
- **mini.surround:** 囲み文字の追加・削除・置換 (`sa`, `sd`, `sr`)
- **Comment.nvim:** コメントのトグル
- **todo-comments:** TODO/FIXME/NOTE などのハイライト
- **which-key:** キーバインドのヒント表示
- **guess-indent:** インデントの自動検出
- **Colorscheme:** [jb.nvim](https://github.com/nickvdyck/jb.nvim) (JetBrains インスパイア)

## Plugin Manager

[lazy.nvim](https://github.com/folke/lazy.nvim) — `:Lazy` で管理画面を表示。
