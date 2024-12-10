### Env/package managers

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Brew
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
alias ibrew='arch -x86_64 /usr/local/bin/brew'

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Langauges

# Go
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

### Tools

# Vim
alias vim="nvim"
# Use Vi bindings
set -o vi

# FZF
# Install fzf to get the bash file
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules --ignore dist -g ""'

# Local profile
[ -f ~/.local_profile ] && source ~/.local_profile

# Elixir
export PATH="$HOME/.mix/escripts:$PATH"
export ELIXIR_ERL_OPTIONS="-kernel shell_history enabled"


# Bash
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=20000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
bindkey "^R" history-incremental-search-backward

