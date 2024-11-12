export ZSH="$HOME/.oh-my-zsh"
export TERM=xterm-256color

 zstyle ':omz:update' mode auto      # update automatically without asking

 zstyle ':omz:update' frequency 13 # how often to auto-update (in days).

 
plugins=(
  git
  zsh-autosuggestions
  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

alias kt='/home/vzkz/Own_Pojects/kotlin_WorkSpace && eza --icons -lah'
alias sl='/home/vzkz/Own_Pojects/Salamandra && eza --icons -lah'
alias dw='/home/vzkz/Downloads && eza --icons -lah'
alias l="eza --icons -lah"
alias v="nvim"
alias e="exit"
alias cl="clear"
alias t="tmux attach || tmux"
alias logout="pkill -KILL -u $USER"
alias update="sudo nixos-rebuild switch --flake ~/nixos/#nixos-config"

#git
psh() {
  if [ -z "$1" ]; then
    echo "Por favor, proporciona un mensaje de commit."
  else
    git add . && git commit -m "$1" && git push
  fi
}
alias lg='lazygit'

# Set nvim as default editor
export EDITOR="nvim"

export TERM=xterm-256color

# zoxide
eval "$(zoxide init --cmd cd zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

#Starship
eval "$(starship init zsh)"

#Execute fastfetch on startup
fastfetch

