export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "mafredri/zsh-async", from:github

zplug "sachaos/todoist", use:"todoist_functions.sh"
zplug "sachaos/git-recent-branch", use:"git-recent-branch_functions.sh"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# Load each zshrc file by OSTYPE
case "${OSTYPE}" in
    # MacOSX
    darwin*)
        [ -f .zshrc.osx ] && source ~/.zshrc.osx
        ;;
    # Linux
    linux*)
        [ -f .zshrc.linux ] && source ~/.zshrc.linux
        ;;
esac

eval "$(starship init zsh)"

# direnv
eval "$(direnv hook zsh)"

source ~/.zshrc.alias
source ~/.zshrc.custom

