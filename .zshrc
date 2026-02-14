



export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/apollo/.local/bin/"

ZSH_THEME="xiong-chiamiov"

plugins=(git docker node zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias terminal='kitty'
alias ls='lsd'
alias scratch='nvim -c "Scratch"'
alias scratcho='nvim -c "ScratchOpen"'
alias yay='yay --answerdiff n --answerclean n --answeredit n'

export EDITOR="nvim"

export SUDO_PROMPT="$(printf '%s\nConceda-me: ' "$(cowsay -f tux 'Ó senhor, que tua TUA GRANDEZA me conceda acesso ao Teu DOMÍNIO')")"
export CHROME_EXECUTABLE="/usr/bin/chromium"
export PATH="/home/apollo/.bun/bin:$PATH"

bindkey -r '^H'

export LANG=en_US.UTF-8
export LC_TIME=pt_BR.UTF-8
export LC_NUMERIC=pt_BR.UTF-8
export LC_MONETARY=pt_BR.UTF-8
export LC_MEASUREMENT=pt_BR.UTF-8
export LC_PAPER=pt_BR.UTF-8
export LC_NAME=pt_BR.UTF-8
export LC_ADDRESS=pt_BR.UTF-8
export LC_TELEPHONE=pt_BR.UTF-8

export GPG_TTY=$(tty)

[ -s "/home/apollo/.bun/_bun" ] && source "/home/apollo/.bun/_bun"

autoload -Uz compinit && compinit
source /usr/share/nvm/init-nvm.sh
source <(fzf --zsh)
