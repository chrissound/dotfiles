# The following lines were added by compinstall
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -Uz compinit promptinit
promptinit
compinit

export PATH=/home/chris/.local/bin/:$PATH


## options 

setopt INC_APPEND_HISTORY
setopt autocd
setopt PROMPT_SUBST

source /home/chris/dotfiles/my-alias-pkg/prompt_chris_setup

source /home/chris/dotfiles/my-alias-pkg/chris-misc.plugin.zsh
source /home/chris/dotfiles/my-alias-pkg/init.sh
source /home/chris/dotfiles/my-alias-pkg/completion.sh

source /home/chris/dotfiles/Human-Friendly-Commands/commands.sh
source /home/chris/dotfiles/Human-Friendly-Commands/fzf.plugin.zsh
alias kubetail=/home/chris/dotfiles/kubetail/kubetail
#source /home/chris/dotfiles/kubetail/kubetail
#source /home/chris/dotfiles/kubetail/completion/kubetail.zsh
source /home/chris/dotfiles/oh-my-zsh/plugins/git/git.plugin.zsh

source /home/chris/dotfiles/z/z.sh
source /home/chris/dotfiles/fz/fz.plugin.zsh
source /home/chris/vte.sh


if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
fi

EDITOR=nvim

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
# End of lines configured by zsh-newuser-install

setTerminalTitle() {
  (
    setopt nopromptsubst
    t2=$(sodiumSierraStrawberry --limit 60 "$PWD")
    print -Pn "\e]0;$t2\a"
  )
}
setTerminalTitleToCmd() {
  (
    setopt nopromptsubst
    t2="$1"
    print -Pn "\e]0;$t2\a"
  )
}

## Set terminal title
case $TERM in
  xterm*)
      chpwd() {
          setTerminalTitle
          ll
      }
    precmd () setTerminalTitle
    preexec () {
        setTerminalTitleToCmd "$1"
        }
    ;;
esac

source /home/chris/.config/broot/launcher/bash/br

function sudi (){
    echo "errrhmmm"
    args="sudo $@"
    echo "hmmm"
    /run/wrappers/bin/sudo -u "$USER" zsh -i -c "$args"
}
#alias sudo='sudo -u "$USER" zsh -i -c '
