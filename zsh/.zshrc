# Start Tmux as the default Shell for user execlude dolphin
# if [[ -x "$(command -v tmux)" ]] && [[ -n "${DISPLAY}" ]] && [[ -z "${TMUX}" ]]; then
#     exec tmux
# fi

# Theme
ZSH_THEME="half-life"

# History Settings
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# Enviroment Virables
export ZSH="/home/0x00/.oh-my-zsh"
export VISUAL="/usr/bin/subl"
export EDITOR="/usr/bin/vim"
export UPDATE_ZSH_DAYS=30
export LANG=en_US.UTF-8
export FZF_BASE=/usr/share/fzf
eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"
# Use control + g to activate navi
eval "$(navi widget zsh)"

# Plugins
plugins=(
    colored-man-pages
    extract
    fzf
    gh
    git
    sudo
)

# Extra
fpath+=/usr/share/zsh/plugins/zsh-completions/src
[ -f /usr/share/zsh/plugins/zsh-autopair/autopair.zsh ] && source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
autopair-init

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.0/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/0x00/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/0x00/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/0x00/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/0x00/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#fastfetch
fastfetch --logo Arya \
    --set Colors="" \
    --set Cursor="" \
    --set Locale="" \
    --set DE="" \
    --set WM="" \
    --set WMTheme="" \
    --set Theme="" \
    --set Icons="" \
    --set Font="" \
    --set Terminal="" \
    --set TerminalFont=""

# Print a new line after command excuted
precmd() {
    print ""
}

# Use gpg-agent instead of ssh-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=${TTY:-"$(tty)"}
gpg-connect-agent updatestartuptty /bye >/dev/null

# Bindings
#Ctrl
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^F' forward-word
bindkey '^B' backward-word
bindkey '^K' kill-line
bindkey '^U' backward-kill-line
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^Y' yank
#escape
#bindkey '\e[A' history-search-backward
#bindkey '\e[B' history-search-forward

#aliases
alias c='clear'
alias n='navi'
alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias ln='ln -v'
alias lla='ls -la'
alias lt='ls --tree'
alias cp='rsync --progress -azvh'
alias mk='mkdir'
alias mv='mv -v'
alias rm='trash-put -v'
alias du='dust'
alias df='duf'
alias ps='procs'
alias nc='ncat'
alias ip='ip -c=always'
alias jq='jq -C'
alias top='btop'
alias cat='bat -pp'
alias less='bat'
alias more='bat'
alias grep='rg'
alias find='fd'
alias vbox='VirtualBox %U'
alias lynx='lynx -display_charset=utf-8'
alias fzf='fzf --reverse'
alias diff='diff --color=auto'
alias dmesg='dmesg --color=always'
alias split='split --verbose'
alias pacman='pacman --color always'
alias -s {json,yaml,yml,html}=subl
alias -s md=typora
alias -s txt=subl
