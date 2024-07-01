if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Funny fish logo at startup
function fish_greeting
    fish_logo blue cyan green
end

# Alias fish logo to fl bc we the goats
alias fl="fish_logo blue cyan green"

# Init starship (prompt) (nvm we goin through a lil thng rn)
# starship init fish | source

# Init zoxide (better cd)
zoxide init fish | source 
alias cd=z

