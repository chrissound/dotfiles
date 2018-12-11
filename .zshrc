# The following lines were added by compinstall
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -Uz compinit promptinit
promptinit
compinit

export PATH=/home/chris/.local/bin/:$PATH

setopt PROMPT_SUBST
source /home/chris/dotfiles/my-alias-pkg/prompt_chris_setup

source /home/chris/dotfiles/my-alias-pkg/chris-misc.plugin.zsh
source /home/chris/dotfiles/my-alias-pkg/init.sh
source /home/chris/dotfiles/my-alias-pkg/completion.sh

source /home/chris/dotfiles/Human-Friendly-Commands/commands.sh
source /home/chris/dotfiles/Human-Friendly-Commands/fzf.plugin.zsh

source /home/chris/dotfiles/z/z.sh
source /home/chris/dotfiles/fz/fz.plugin.zsh
source /home/chris/vte.sh


if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
fi

## options 

setopt autocd

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
# End of lines configured by zsh-newuser-install
