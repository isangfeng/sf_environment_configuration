# === shell ===
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt EXTENDED_HISTORY        # 记录时间戳
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE       # 空格开头的命令不入历史
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY             # !! 展开后先让你确认

setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

# === antidote ===
export ANTIDOTE_HOME=$HOME/.antidote
zsh_plugins_txt=${ZDOTDIR:-$HOME}/.zsh_plugins.txt
zsh_plugins_sh=${ZDOTDIR:-$HOME}/.zsh_plugins.zsh

if [[ ! -f $zsh_plugins_sh || $zsh_plugins_txt -nt $zsh_plugins_sh ]]; then
  source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
  antidote bundle <$zsh_plugins_txt >$zsh_plugins_sh
fi
source $zsh_plugins_sh
unset zsh_plugins_txt zsh_plugins_sh

zstyle ':completion:*' menu no
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:warnings'     format 'No matches for: %d'

zstyle ':fzf-tab:*' continuous-trigger '/'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons $realpath'
zstyle ':fzf-tab:complete:__git_checkout_branch:*' fzf-preview \
  'git log --color=always --oneline --graph -20 $word'
# need bat
zstyle ':fzf-tab:complete:*:*' fzf-preview \
  '[[ -d $realpath ]] && eza -1 --color=always --icons $realpath || bat --color=always --line-range :200 $realpath 2>/dev/null'


bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

if command -v eza > /dev/null; then
  alias ls='eza --icons --grid'
  alias ll='eza -lh --icons --git'
  alias lt='eza --tree --level=2 --icons'
fi

eval "$(zoxide init zsh --cmd z)"
eval "$(starship init zsh)"




# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# luna path
export NEUROKITS_DIR=~/neurokits
export PATH=${PATH}:${NEUROKITS_DIR}/luna-v1.7.0



# >>> Added by Spyder >>>
alias uninstall-spyder=/Users/fsang/Library/spyder-6/uninstall-spyder.sh
# <<< Added by Spyder <<<
