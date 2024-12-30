# Custom paths
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
if check_command deno; then
    export PATH="$PATH:$HOME/.deno/bin"
fi
if check_command go; then
    export PATH="$PATH:$HOME/go/bin"
fi

# Neovim
if check_command nvim; then
    export EDITOR=nvim
fi
