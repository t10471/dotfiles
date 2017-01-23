alias ls='/usr/local/bin/gls --color=auto'
alias la='/usr/local/bin/gls -la --color=auto'
alias ll='/usr/local/bin/gls -la --color=auto'
alias g='git'
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias sudo='sudo '
alias syncon='tmux set-window-option synchronize-panes on'
alias syncoff='tmux set-window-option synchronize-panes off'

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/.stack/programs/x86_64-osx/ghcjs-0.2.1.9007002_ghc-8.0.1/bin:$PATH
export GOPATH="$HOME/.gopath"
export PATH="$HOME/.local/bin:$GOPATH/bin:$PATH" 
export PATH="$HOME/bin:$PATH" 
export PATH="$HOME/dotfiles/bin:$PATH" 

source ~/.airtrack_env
source ~/.user_topics_env
source ~/.potage_env
source ~/.gcp_commands.sh
source ~/.python.sh
ENHANCD_FILTER=fzy
export ENHANCD_FILTER
source ~/dotfiles/enhancd/init.sh
# autojump setting
[[ -s `brew --prefix`/etc/autojump.sh  ]] && . `brew --prefix`/etc/autojump.sh

export KUBE_EDITOR="vim"
export EDITOR="/usr/local/bin/vim"
export VISUAL="/usr/local/bin/vim"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/a14332/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/a14332/google-cloud-sdk/completion.bash.inc'

source '/Users/a14332/.minikube_completion.bash.inc'

function _update_ps1() {
    export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}
export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
peco-select-history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
bind -x '"\C-r": peco-select-history'

