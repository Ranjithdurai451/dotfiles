# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  sudo
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
  zsh-completions
  zsh-history-substring-search
)


source $ZSH/oh-my-zsh.sh

autoload -Uz compinit && compinit -C

# User configuration
PROMPT='%F{green}%~ %F{blue}git:(%F{red}$(git branch --show-current 2>/dev/null)%F{blue}) %f'
# History configuration
HISTSIZE=1000
HISTFILESIZE=2000
SAVEHIST=2000
setopt HIST_IGNORE_DUPS       # Don't save duplicate entries
setopt SHARE_HISTORY          # Share history between sessions
setopt APPEND_HISTORY         # Append to history file

# Additional options
# setopt AUTO_CD              # Type directory name to cd into it
setopt CORRECT              # Command correction
setopt EXTENDED_HISTORY     # Add timestamps to history

# Exports imported from bash
export PATH=$HOME/.local/bin:$PATH
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.config/tmux/plugins/tpm"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.fzf/bin:$PATH"
if [[ ! "$PATH" == */home/noone/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/noone/.fzf/bin"
fi
export EDITOR=nvim
# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  






# Shell utilities
alias ozs="nvim ~/.zshrc"
alias szs="source ~/.zshrc"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ls="eza --no-filesize --long --color=always --icons=always --no-user" 
alias c="clear"
alias cat="batcat"
alias cd="z"
alias y="yazi"
alias h="cd ~"
# npm/Node.js
alias nrd="npm run dev"
alias nrb="npm run build"
alias ni="npm install"
alias nu="npm uninstall"
alias nr="npm run"
alias nrp="npm run prisma:studio"
alias nrt="npm run test"
alias nlg="npm list -g --depth=0"

# Bun (JavaScript runtime)
alias bx="bunx"
alias b="bun"
alias ba="bun add"
alias bi="bun install"
alias br="bun run"
alias bu="bun update"
alias bre="bun remove"
alias brd="bun run dev"
alias brb="bun run build"
alias bpm="bun pm"
# Essential Git Aliases
alias g="git"
alias ga="git add"
alias gs="git status"
alias gc="git commit -m"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gp="git push"
alias gpl="git pull"
alias gl="git log --oneline --graph --all"
alias gd="git diff"
alias gcl="git clone"
alias gb="git branch"

# Java
alias jc="javac"
alias j="java"

# Load extensions
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if command -v tmux >/dev/null 2>&1; then
    if [ -z "$TMUX" ]; then
        if tmux has-session -t default 2>/dev/null; then
            tmux attach-session -t default
        else
            tmux new-session -s default
        fi
    fi
fi

# bun completions
[ -s "/home/noone/.bun/_bun" ] && source "/home/noone/.bun/_bun"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="/snap/bin:$PATH"
export PATH="$PATH:/snap/bin"
export PATH="$HOME/yazi/target/release:$PATH"
# export PATH="$PATH:/mnt/c/Users/ranji/AppData/Local/Programs/Microsoft VS Code/bin/code"
git-create() {
  if [ -z "$1" ]; then
    echo "❌ Usage: git-create <remote-url>"
    return 1
  fi

  REMOTE_URL="$1"
  COMMIT_MSG="setup: initial commit"

  git init &&
  git branch -M main &&
  git remote add origin "$REMOTE_URL" &&
  git add . &&
  git commit -m "$COMMIT_MSG" &&
  git push -u origin main
}


