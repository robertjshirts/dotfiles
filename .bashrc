# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set default editor
export EDITOR=nvim  # Change this to your preferred editor (e.g., vim, code)

# Add custom paths
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.deno/bin"
export PATH="$PATH:$HOME/go/bin"

# Load additional scripts or configurations
if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

# Load ssh-agent
SSH_ENV="$HOME/.ssh/agent-environment"

start_agent() {
    echo "Starting ssh-agent..."
    ssh-agent > "$SSH_ENV"
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" > /dev/null
    ssh-add ~/.ssh/gh_arch_btw #~/.ssh/actions, etc (whitespace sep)
}

# Source SSH environment if it exists
if [ -f "$SSH_ENV" ]; then
    . "$SSH_ENV" > /dev/null
fi

# Check if ssh-agent is still running, if not, start it
if ! ps -p "$SSH_AGENT_PID" > /dev/null 2>&1; then
    start_agent
fi

# Load secrets
if [ -f ~/.bash_secrets ]; then
    source ~/.bash_secrets
fi

copy() {
    # Function to copy contents of a file to clipboard using wl-copy
    if ! tty -s; then
        # Accept pipe input (stdin)
        wl-copy
        if [ $? -eq 0 ]; then
            echo "copied"
            return 0
        else
            echo "Error: Failed to copy piped input" >&2
            return 1
        fi
    elif [ "$#" -ne 1 ]; then
        # Ensure exactly one arg
        echo "Usage: copy <filename>"
        return 1
    elif [ ! -f "$1" ]; then 
        # Check if arg is a file
        echo "Error: File '$1' does not exist." >&2
        return 1
    fi

    wl-copy < "$1"
    if [ $? -eq 0 ]; then
        echo "$1"
    else
        # wl-copy returned something besides 0
        echo "Failed to copy contents of '$1' to the clipbaord" >&2
    fi
}

getip() {
    curl -s http://ip4only.me/api/ | awk -F, '{print $2}' | copy
}

# alias command for the jira cli, installed with go
jira() {
    if [[ "$1 $2" == "in progress" ]]; then
        jira issue list -s "in progress"
    elif [[ "$1" == "todo" ]]; then
        jira issue list -s "todo"
    else
        command jira "$@"
    fi
}

# Enable command history
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend  # Append to the history file, don't overwrite it

# Add zoxide
eval "$(zoxide init bash --cmd cd)"

# Add starship (for prompt)
eval "$(starship init bash)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/rshirts/google-cloud-sdk/path.bash.inc' ]; then . '/home/rshirts/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/rshirts/google-cloud-sdk/completion.bash.inc' ]; then . '/home/rshirts/google-cloud-sdk/completion.bash.inc'; fi

# Aliases and exports
alias ls='ls --color=auto -a'             # List hidden files and in color :)
alias grep='grep --color=auto'
alias lss='ls --color=auto'               # List files (not including hidden ones)
alias ..='cd ..'                          # Go up one directory
alias ...='cd ../..'                      # Go up two directories
alias lzd='lazydocker'                    # Lazydocker
alias permaban='rm -rf'                   # LMAO
alias lc='history -p '!!' | copy'         # Last command
alias wezterm='WAYLAND_DISPLAY= wezterm'  # TODO: Remove this when wezterm gets fixed lol
export QT_QPA_PLATFORM=xcb
. /usr/local/etc/bash_completion.d/deno.bash

