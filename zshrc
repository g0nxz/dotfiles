# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions you-should-use zsh-history-substring-search sudo extract z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export WGPU_BACKEND=vulkan

alias ls='eza --icons'
alias ll='eza -la --icons'
alias cat='batcat'
alias lg='lazygit'

# --- Alias generales ---
alias c='clear'
alias h='history'
alias ..='cd ..'
alias ...='cd ../..'
alias ports='ss -tulnp'
alias myip='curl -s ifconfig.me'

# --- Pentesting / HTB ---
alias recon='~/tools/scripts/recon.sh'
alias linpeas='~/tools/peass/linpeas.sh'
alias serve='python3 -m http.server 8000'
alias htbvpn='sudo openvpn ~/tools/htb/*.ovpn'
alias pwncat='pwncat-cs'

# --- tmux ---
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tl='tmux ls'

# --- git ---
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'

bindkey '^[[A' history-substring-search-up 
bindkey '^[[B' history-substring-search-down

# --- Funciones HTB ---
htb-new() {
  if [[ "$1" == "-h" || "$1" == "--help" || -z "$1" ]]; then
    echo "Uso: htb-new <nombre> <ip>"
    echo "  Crea la estructura de carpetas para una máquina de HTB y abre tmux."
    echo "  Ejemplo: htb-new forest 10.10.10.161"
    return 0
  fi
  local name=$1
  local ip=$2
  mkdir -p ~/htb/$name/{nmap,loot,exploits,notes}
  cd ~/htb/$name
  echo "# $name ($ip)" > notes/notes.md
  echo "Estructura creada en ~/htb/$name"
  tmux new -s "$name"
}
nmapfull() {
  if [[ "$1" == "-h" || "$1" == "--help" || -z "$1" ]]; then
    echo "Uso: nmapfull <ip> [nombre]"
    echo "  Escaneo rápido de todos los puertos abiertos (formato greppable)."
    echo "  Ejemplo: nmapfull 10.10.10.161 forest"
    return 0
  fi
  local ip=$1
  local name=${2:-scan}
  mkdir -p ~/htb/$name/nmap
  nmap -p- --open -sS --min-rate 5000 -vvv -n -Pn $ip -oG ~/htb/$name/nmap/allPorts
  echo "Resultado guardado en ~/htb/$name/nmap/allPorts"
}

extractPorts() {
  if [[ "$1" == "-h" || "$1" == "--help" || -z "$1" ]]; then
    echo "Uso: extractPorts <archivo-oG-de-nmap>"
    echo "  Extrae los puertos abiertos y la IP, y copia los puertos al portapapeles."
    echo "  Ejemplo: extractPorts ~/htb/forest/nmap/allPorts"
    return 0
  fi
  local file=$1
  ports="$(grep -oP '\d{1,5}/open' $file | awk -F '/' '{print $1}' | sort -n | tr '\n' ',' | sed 's/,$//')"
  ip_addr="$(grep -oP '(\d{1,3}\.){3}\d{1,3}' $file | head -n 1)"
  echo -e "\n[+] Extrayendo información...\n"
  echo -e "\t[+] IP: $ip_addr"
  echo -e "\t[+] Puertos abiertos: $ports\n"
  echo $ports | tr -d '\n' | xclip -sel clip
  echo -e "[+] Puertos copiados al portapapeles\n"
}

targeted() {
  if [[ "$1" == "-h" || "$1" == "--help" || -z "$1" ]]; then
    echo "Uso: targeted <ip> [nombre]"
    echo "  Lanza un escaneo detallado (-sC -sV) sobre los puertos"
    echo "  que tengas copiados en el portapapeles (de extractPorts)."
    echo "  Ejemplo: targeted 10.10.10.161 forest"
    return 0
  fi
  local ip=$1
  local name=${2:-scan}
  local ports=$(xclip -sel clip -o)
  if [[ -z "$ports" ]]; then
    echo "[-] No hay puertos en el portapapeles. Ejecuta extractPorts primero."
    return 1
  fi
  mkdir -p ~/htb/$name/nmap
  echo "[+] Escaneando puertos: $ports"
  nmap -p$ports -sC -sV -oN ~/htb/$name/nmap/targeted $ip
  echo "Resultado guardado en ~/htb/$name/nmap/targeted"
}
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
