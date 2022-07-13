source "$ZDOTDIR/.zshkeybindings"
source "$ZDOTDIR/aliasrc"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# History
HISTFILE=~/.config/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

# misc 
setopt autocd nobeep
#extendedglob

# Line Editor Mode
bindkey -v

# Completion
autoload -Uz compinit
compinit

zstyle :compinstall filename '${$ZDOTDIR}/.zshrc'
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# Prompt
prompt off # turn off system prompt

autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst

add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '[%b%u%c]'
zstyle ':vcs_info:git:*' actionformats '[%b|%a%u%c]'

setprompt() {
    PS1="%F{blue}[%F{yellow}%~%F{blue}]"$'\n'"%(?..%F{red}%?)%F{blue}->%f"
    RPS1='%F{cyan}${vcs_info_msg_0_}%f'
}


setprompt

echo '\( ^-^)/ "Hello Sailor!"'
