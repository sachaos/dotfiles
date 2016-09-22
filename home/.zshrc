source $HOME/.homesick/repos/dotfiles/home/antigen/antigen.zsh
source $HOME/.homesick/repos/homeshick/homeshick.sh
source $HOME/.homesick/repos/dotfiles/home/.autoenv/activate.sh

autoload -Uz colors
colors

# load antigen plugins
antigen bundles <<EOF
  zsh-syntax-highlighting
  autoenv
  git

  oh-my-zsh
EOF

antigen apply

antigen theme candy

source .zshrc.custom
source .zshrc.alias

case "${OSTYPE}" in
    # MacOSX
    darwin*)
        [ -f .zshrc.osx ] && source .zshrc.osx
        ;;
    # Linux
    linux*)
        [ -f .zshrc.linux ] && source .zshrc.linux
        ;;
esac
