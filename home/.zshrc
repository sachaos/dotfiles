# source $HOME/.homesick/repos/dotfiles/home/.antigen/antigen.zsh
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

source ~/.zshrc.alias
source ~/.zshrc.custom
source ~/.zshrc.prompt

[[ -s "/home/sachaos/.gvm/scripts/gvm" ]] && source "/home/sachaos/.gvm/scripts/gvm"
