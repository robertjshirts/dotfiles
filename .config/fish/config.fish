if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Funny fish logo at startup
function fish_greeting
    fish_logo blue cyan green
end

# Alias fish logo to fl bc we the goats
alias fl="fish_logo blue cyan green"

# Alias idv4 to copy a new uuidv4 to my clipboard
alias idv4="uuidgen -r | xclip -selection clipboard"

# Init starship (prompt) (nvm we goin through a lil thng rn)
# starship init fish | source

# Init zoxide (better cd)
zoxide init fish | source 
alias cd=z

