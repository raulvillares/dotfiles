RED="\[\033[0;31m\]"
YELLOW="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
DARK_GRAY="\[\033[0;36m\]"
LIGHT_GRAY="\[\033[1;36m\]"
COLOR_NONE="\[\e[0m\]"

function parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function virtualenv_info(){
    if [[ -n "$VIRTUAL_ENV" ]]; then
        venv="${VIRTUAL_ENV##*/}"
    else
        venv=''
    fi
    [[ -n "$venv" ]] && echo " [$venv]"
}
export VIRTUAL_ENV_DISABLE_PROMPT=1

VENV="\$(virtualenv_info)";
export PS1="${DARK_GRAY}\u@\h at ${LIGHT_GRAY}\W${YELLOW}\$(virtualenv_info)${PURPLE}\$(parse_git_branch)${WHITE} $ ${COLOR_NONE}"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/repos
source $HOME/Library/Python/2.7/bin/virtualenvwrapper.sh

alias docker-clean-unused='docker system prune --all --force --volumes'
alias docker-clean-all='docker stop $(docker container ls -a -q) && docker system prune -a -f --volumes'
