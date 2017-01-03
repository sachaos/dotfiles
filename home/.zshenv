#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Load each env file by OSTYPE
case "${OSTYPE}" in
    # MacOSX
    darwin*)
        [ -f .zshenv.osx ] && source ~/.zshenv.osx
        ;;
    # Linux
    linux*)
        [ -f .zshenv.linux ] && source ~/.zshenv.linux
        ;;
esac
