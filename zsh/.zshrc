# github.com/hbd

# global config.
source ~/.zsh_global
fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions $fpath)

# user config.
function main() {
    source ~/.zsh_alias
    source ~/.zsh_env
    source ~/.zsh_func
    # source ~/.zsh_minikube
    source ~/.zsh_private
}

# helper to retrieve current time in milliseconds.
function mstime() {
    echo "$(gdate +%s.%N | sed 's/......$//')" | \bc
}

# save cursor position, so loading time is not displayed at top.
tput sc
echo

echo -n "Loading oh-my-zsh..."
a=$(mstime)
export ZSH="$HOME/.oh-my-zsh"
source ~/.zsh_oh_my_zsh
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
b=$(mstime)
echo " loaded in $(echo "($b - $a)" | \bc) ms."

echo -n "Loading user config..."
a=$(mstime)
main
b=$(mstime)
echo " loaded in $(echo "($b - $a)" | \bc) ms."

tput rc; tput el
