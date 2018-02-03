set fish_greeting

set -x GOROOT (go env GOROOT)
set -x GOPATH $HOME/.gopath
set -x GOENV_ROOT $HOME/.goenv
set -x PYENV_ROOT $HOME/.pyenv
set -x EDITOR nvim
if test -n $TMUX
  set -x TERM xterm-256color
else
  set -x TERM tmux-256color
end

set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/bin $PATH
set -x PATH $HOME/dotfiles/bin $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/.pyenv/shims $PATH
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.goenv/bin $PATH
set -x ANACONDA_VERSION anaconda3-2.5.0

eval (direnv hook fish)
. (pyenv init -| psub)
. (goenv init -| psub)

balias diff colordiff
balias ovim vim
balias vim nvim
balias g git
balias k kubectl
balias kc kubectl
balias kg 'kubectl get'
balias kd 'kubectl describe'
balias sudo 'sudo '
balias ls exa
balias ll 'exa -l --git'
balias la 'exa -la --git'
balias lt 'exa -l -T --git'
balias syncon 'tmux set-window-option synchronize-panes on'
balias syncoff 'tmux set-window-option synchronize-panes off'
balias mon 'eval (minikube docker-env)'

function moff
    unset DOCKER_TLS_VERIFY
    unset DOCKER_HOST
    unset DOCKER_CERT_PATH
    unset DOCKER_API_VERSION
end

# Change commands to j and jo
set -U Z_CMD "z"
set -U Z_DATA "$HOME/.z"

set -x CLOUDSDK_PYTHON $PYENV_ROOT/versions/$ANACONDA_VERSION/envs/py27/bin/python

. ~/google-cloud-sdk/path.fish.inc.fish
. ~/.python.fish
. ~/.gcp_commands.fish

set fish_plugins theme peco z tmux goenv

function fish_prompt
    ~/.pyenv/versions/anaconda3-2.5.0/bin/python ~/powerline-shell/powerline-shell.py $status --shell bare ^/dev/null
end

function peco
      command peco --layout=bottom-up $argv
end

function unset
    set --erase $argv
end

function fish_user_key_bindings

  # コマンド履歴を見る
  bind \cr peco_select_history
  # プロセスをキルする
  bind \cx\ck peco_kill
  # 最近見たディレクトリに移動
  bind \cx\cr peco_recentd
  bind \c] peco_select_ghq_repository
  bind \cxc commandline_copy

  # fzf
  bind \cx\cf '__fzf_find_file'
  bind \ct\cr '__fzf_reverse_isearch'
  bind \ex '__fzf_find_and_execute'
  bind \ed '__fzf_cd'
  bind \eD '__fzf_cd_with_hidden'
end
