alias ls='ls --color=auto -a'                        # List hidden files and in color :)
alias grep='grep --color=auto'
alias lss='ls --color=auto'                          # List files (not including hidden ones)
alias lzd='lazydocker'                               # Lazydocker
alias lzg='lazygit'                                  # Lazygit
alias permaban='rm -rf'                              # LMAO
alias stows='/usr/bin/stow -v --dotfiles -d ~/dotfiles .' # Shorthand for stow command
alias dc="docker-compose"                            # shorthand for docker DASH compose
alias notes="nvim '+normal Go' '+startinsert!' ~/notes"                           # Notes 

# Complicated aliases
stow() {
    echo "use 'stows' dumbass"
    echo "if you really need the original, use /usr/bin/stow"
}
