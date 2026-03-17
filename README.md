# dotfiles

## セットアップ

### macOS

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
chezmoi apply --source=<このリポジトリのパス>
```

### Linux

```sh
apt update
apt install -y curl gcc git zsh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME"
$HOME/chezmoi init https://github.com/shamaton/dotfiles
$HOME/chezmoi apply
```

### Windows

```powershell
iex "&{$(irm 'https://get.chezmoi.io/ps1')} -BinDir $env:USERPROFILE\.local\bin"
chezmoi apply --source=<このリポジトリのパス>
```
