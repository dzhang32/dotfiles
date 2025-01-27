# aliases
alias ll='ls -alh'
alias cat='bat'
alias k='kubectl'

# autocomplete and syntax highlighting
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
autoload -Uz compinit && compinit
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# starship
eval "$(starship init bash)"

# Token for coder.
eval "$(atuin init bash)"
