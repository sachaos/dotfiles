source $HOME/.homesick/repos/dotfiles/home/.antigen/antigen.zsh
source $HOME/.homesick/repos/homeshick/homeshick.sh
source $HOME/.homesick/repos/dotfiles/home/.autoenv/activate.sh

autoload -Uz colors
colors

# load antigen plugins
antigen bundle zsh-users/zsh-completions
antigen bundle git
antigen bundle oh-my-zsh
antigen apply

antigen use oh-my-zsh

source ~/.zshrc.custom
source ~/.zshrc.prompt
source ~/.zshrc.alias

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
