[[ -o interactive ]] || return

stty stop undef
export GPG_TTY=$(tty)

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
  export SSH_AGENT_PID
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

if [ -f "${ZSH}/oh-my-zsh.sh" ]; then
  source $ZSH/oh-my-zsh.sh
  plugins=(git vundle zsh-autosuggestions substring-search)
fi

if [ -f "${HOME}/resty" ]; then
  source ~/resty
fi
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_ed25519"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Associated with gpg sign
alias gcs="git commit -S"

# Bazel zsh completion
complete -o nospace -F _bazel__complete bazelisk

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Move Forward/Backward on command line
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# k9s watch my namespace
alias k9s_watch="k9s -n chansupark"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh-interactive-cd (https://github.com/changyuheng/zsh-interactive-cd)
# source ~/zsh-interactive-cd.plugin.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

autoload -U is-at-least
if is-at-least 5.1 && [[ -d ~/.zinit ]]; then

  source "$HOME/.zinit/bin/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit

  zplugin ice depth=1
  zplugin light romkatv/powerlevel10k

  ZSH_AUTOSUGGEST_USE_ASYNC=1
  if is-at-least 5.3; then
    zinit ice silent wait'1' atload'_zsh_autosuggest_start'
  fi
  zinit light zsh-users/zsh-autosuggestions

  # Easily access the directories you visit most often.
  #
  # Usage:
  #   $ z work
  #   $ <CTRL-G>work
  zinit light agkozak/zsh-z
  zinit light andrewferrier/fzf-z
  export FZFZ_SUBDIR_LIMIT=0

  # Automatically expand all aliases
  ZSH_EXPAND_ALL_DISABLE=word
  zinit light simnalamburt/zsh-expand-all

  # Load a few important annexes, without Turbo
  # (this is currently required for annexes)
  zinit light zsh-users/zsh-history-substring-search
  zinit light zsh-users/zsh-completions
  zinit light zdharma/fast-syntax-highlighting
  zinit light zinit-zsh/z-a-as-monitor
  zinit light zinit-zsh/z-a-patch-dl
  zinit light zinit-zsh/z-a-bin-gem-node
  zinit light simnalamburt/cgitc
  zinit light simnalamburt/ctrlf

  autoload -Uz compinit
  compinit
  zinit cdreplay

  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  ### End of Zinit's installer chunk
else
  # Default terminal
  case "$TERM" in
    xterm-color|*-256color)
      PS1=$'\e[1;32m%n@m\e[0m:\e[1;34m%~\e[0m%(!.#.$) ';;
    *)
      PS1='%n@%m:%~%(!.#.$) ';;
  esac

  autoload -Uz compinit
  compinit
fi

#
# zsh-sensible
#
alias l='ls -lah'
alias mv='mv -i'
alias cp='cp -i'

setopt auto_cd histignorealldups sharehistory
zstyle ':completion:*' menu select

HISTSIZE=90000
SAVEHIST=90000
HISTFILE=~/.zsh_history

# lsd commands (cargo install --git https://github.com/Peltoche/lsd.git --branch master)

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

#
# lscolors
#
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedxbagxcad"
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=30;46:tw=0;42:ow=30;43"
export TIME_STYLE='long-iso'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


#
# zsh-substring-completion
#
setopt complete_in_word
setopt always_to_end
WORDCHARS=''
zmodload -i zsh/complist

# Substring completion
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#
# zshrc
#
export DOCKER_BUILDKIT=1
export AWS_SDK_LOAD_CONFIG=true

# If ENV of EDITOR/VISUAL_CODE includes 'vi', then every emacs-like bindings are
# automatically disabled, including ^A/^E.
# References:
#   https://stackoverflow.com/a/43087047
#   https://github.com/zsh-users/zsh/blob/96a79938010073d14bd9db31924f7646968d2f4a/Src/Zle/zle_keymap.c#L1437-L1439
#   https://github.com/yous/dotfiles/commit/c29bf215f5a8edc6123819944e1bf3336a4a6648
if (( $+commands[vim] )); then
  export EDITOR=vim
  bindkey -e
fi


# Activate virtualenv if sourcing file exist
[[ ! -f ~/.dotfiles/wsl-python.zsh ]] || source ~/.dotfiles/wsl-python.zsh

# Load local configs
if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

# Add diff-highlight
# (https://github.com/git/git/blob/master/contrib/diff-highlight/diff-highlight.perl)
export PATH=/usr/share/git-core/contrib:$PATH

# Init perl
# before that install perl using apt-get install perl
if [[ -f ~/perl5/perlbrew/etc/bashrc ]]; then
  source ~/perl5/perlbrew/etc/bashrc
fi

export PATH=$HOME/.dotfiles:$PATH

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh
