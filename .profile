# Use Vi bindings.
set -o vi



### vim ####
alias vim="nvim"



### git ####

# git completion
source ~/git-completion.bash



### nvm ###

# https://superuser.com/questions/544989/does-tmux-sort-the-path-variable/583502#583502
if [ -f /etc/profile ]; then
	PATH=""
	source /etc/profile
fi

export NVM_DIR="$HOME/.nvm"

# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"



### rbenv ###
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


### FZF ###

# Install fzf to get the bash file
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules --ignore dist -g ""'


### local profile ####
source .local_profile
