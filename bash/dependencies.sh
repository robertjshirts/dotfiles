# If we don't have neovim, we need to check for yay
if ! check_command nvim; then
    check_command yay
fi

# Better cd
if check_command zoxide; then
    eval "$(zoxide init bash --cmd cd)"
fi

# Prompt my beloved
if check_command starship; then
    eval "$(starship init bash)"
fi
