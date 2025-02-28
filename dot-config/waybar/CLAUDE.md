# Waybar Configuration Guidelines

## Commands
- **Test Config**: `waybar`
- **Validate JSON**: `jq . ~/.config/waybar/config.jsonc`
- **Restart Waybar**: `pkill waybar && waybar &`
- **CSS Linting**: `stylelint ~/.config/waybar/style.css`

## Style Guidelines
- **JSON**: Use 4-space indentation in config.jsonc
- **CSS**: Limited to GTK CSS specification, which is a subset of standard CSS
- **CSS Selectors**: Use #id and simple selectors as complex selectors may not work
- **Shell Scripts**: Use POSIX-compatible syntax when possible
- **Icons**: Use JetBrainsMono Nerd Font for consistency
- **Comments**: Document complex configurations and module customizations
- **Colors**: Use Catppuccin Mocha palette variables for consistency
- **DRY**: Reuse CSS properties with comma-separated selectors
- **Error Handling**: Include appropriate fallbacks in scripts
- **Layout**: Group related modules together in config
- **Naming**: Use descriptive names for custom modules

## Structure
Custom scripts should be placed in the scripts/ directory and made executable.

## CSS Limitations
- Waybar uses GTK CSS which is more limited than standard CSS
- No CSS variables, advanced selectors, or modern CSS features
- Styling must target elements by ID or simple class selectors
- Use rgba() for transparency instead of opacity in most cases