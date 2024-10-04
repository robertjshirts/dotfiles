# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set default editor
export EDITOR=nvim  # Change this to your preferred editor (e.g., vim, code)

# Add custom paths
export PATH="$HOME/bin:$PATH"

# Load additional scripts or configurations
if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

# Enable command history
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend  # Append to the history file, don't overwrite it

# Add zoxide
eval "$(zoxide init bash --cmd cd)"

# Add starship (for prompt)
eval "$(starship init bash)"

# Aliases
alias ls='ls --color=auto -a'  # List hidden files and in color :)
alias grep='grep --color=auto'
alias lss='ls --color=auto'  # List files (not including hidden ones)
alias ..='cd ..'   # Go up one directory
alias ...='cd ../..'  # Go up two directories
alias wezterm='WAYLAND_DISPLAY= wezterm' # TODO: Remove this when wezterm gets fixed lol

