set -U EDITOR nvim

function fish_greeting
  fortune
end

function bass_init
  bass export EDITOR=nvim
  bass source ~/.nvm/nvm.sh
end

alias vim="nvim"
alias g="git"
alias be="bundle exec"
alias mux="tmuxinator"
alias ls="exa"
alias cat="bat"
alias more="bat"
alias dc="docker-compose"
alias dcr="docker-compose run"

set -x FZF_DEFAULT_COMMAND "rg --files --follow"
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $HOME/.bin $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin $HOME/.rbenv/bin $PATH
set -x EMACSPATH $PATH

switch (uname)
  case Darwin
    set -x RUBY_CONFIGURE_OPTS "--with-openssl-dir=/usr/local/opt/openssl@1.1"
  case Linux
    set -x QT_STYLE_OVERRIDE Adwaita-Dark
    # set -x MOZ_ENABLE_WAYLAND 1
    alias open="xdg-open"
    alias pbcopy="xclip"
end

status --is-interactive; and source (rbenv init -|psub)

bass_init
eval (direnv hook fish)
