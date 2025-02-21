# Automatically added
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash"
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Util functions
check_command() {
    local cmd="$1"

    if ! command -v "$cmd" &> /dev/null; then
        echo "Alert: $cmd is not installed."
        return 1
    fi
    return 0
}

source_util() {
    local filename="$1"
    local file_path="$HOME/bash/${filename}.sh"
    
    if [ -f "$file_path" ]; then
        source "$file_path"
    else
        echo "Error: File $file_path not found"
        return 1
    fi
}

# Secrets
source ~/.bash_secrets

# Imports
source_util exports
source_util dependencies
source_util copy
source_util history
source_util aliases
source_util hyprland


# Automatically added
source /usr/share/nvm/init-nvm.sh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/rshirts/.lmstudio/bin"

# pnpm
export PNPM_HOME="/home/rshirts/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
