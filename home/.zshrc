source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"

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

source ~/.zshrc.alias
source ~/.zshrc.custom
source ~/.zshrc.prompt
