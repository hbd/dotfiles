# github.com/hbd

# global config.
source .zsh_global
fpath=(/usr/local/share/zsh-completions $fpath)

# user config.
function main() {
    source ~/.zsh_alias
    source ~/.zsh_env
    source ~/.zsh_func
    # source ~/.zsh_theme

    # source powerline config.
    # source /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

    # source vendored plugins.
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
export ZSH="/Users/zak/.oh-my-zsh"
source .zsh_oh_my_zsh
source $ZSH/oh-my-zsh.sh
b=$(mstime)
echo " loaded in $(echo "($b - $a)" | \bc) ms."

echo -n "Loading user config..."
a=$(mstime)
main
b=$(mstime)
echo " loaded in $(echo "($b - $a)" | \bc) ms."

tput rc; tput el
