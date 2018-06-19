ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="chris"

DISABLE_AUTO_UPDATE="true"

ZSH_CUSTOM=/home/chris/dotfiles/.oh-my-zsh/

plugins=(git common-aliases fasd colored-man-pages linuxverboselib mykeybindings zsh-syntax-highlighting chris-misc)

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/scripts/zplug/init.zsh

zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh
zplug load


eval $(thefuck --alias)

HISTSIZE=1000000
