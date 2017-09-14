source $HOME/.homesick/repos/dotfiles/home/.antigen/antigen.zsh
source $HOME/.homesick/repos/homeshick/homeshick.sh

autoload -Uz colors
colors

# load antigen plugins
antigen bundle zsh-users/zsh-completions
antigen bundle git
antigen bundle oh-my-zsh
antigen apply

antigen use oh-my-zsh

source ~/.zshrc.alias
source ~/.zshrc.custom
source ~/.zshrc.prompt

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
