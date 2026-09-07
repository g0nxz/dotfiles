# Dotfiles

Configuración personal para Kali Linux (ARM64, VMware Fusion en Apple Silicon).

## Contenido

- `zshrc` — configuración de Zsh + Oh My Zsh + Powerlevel10k
- `nvim/` — configuración de Neovim (NvChad), con LSPs de Python (basedpyright) y Bash (bashls)
- `terminator/config` — perfil y atajos de Terminator
- `tmux.conf` — configuración de tmux (ratón activado, paneles con `|` y `-`)
- `tmux-cheatsheet.md` — referencia rápida de atajos de tmux

## Instalación en una VM nueva

### Zsh + Oh My Zsh + Powerlevel10k
```bash
sudo apt install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
cp zshrc ~/.zshrc
source ~/.zshrc
```

### Neovim + NvChad
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz
sudo tar -C /opt -xzf nvim-linux-arm64.tar.gz
sudo ln -sf /opt/nvim-linux-arm64/bin/nvim /usr/local/bin/nvim
cp -r nvim ~/.config/nvim
nvim  # instala plugins automáticamente
```
Dentro de Neovim, instalar vía `:Mason`: basedpyright, bash-language-server.

### Terminator
```bash
sudo apt install terminator -y
mkdir -p ~/.config/terminator
cp terminator/config ~/.config/terminator/config
```

### tmux
```bash
sudo apt install tmux -y
cp tmux.conf ~/.tmux.conf
```

## Herramientas adicionales instaladas (no versionadas aquí)

- fzf, bat, eza, lazygit
- pwncat-cs (vía pipx)
- PEASS-ng (linpeas/winpeas) en `~/tools/peass`
- JetBrainsMono Nerd Font

## Notas

- Fuente necesaria para iconos: JetBrainsMono
