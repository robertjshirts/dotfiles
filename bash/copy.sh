if check_command wl-copy; then
    copy() {
        if ! tty -s; then
            if wl-copy; then
                echo "copied"
                return 0
            else
                echo "Error: Failed to copy piped input" >&2
                return 1
            fi
        elif [ "$#" -ne 1 ]; then
            echo "Usage: copy <filename>" >&2  # Added >&2 for error message
            return 1
        elif [ ! -f "$1" ]; then 
            echo "Error: File '$1' does not exist." >&2
            return 1
        else
            if wl-copy < "$1"; then
                echo "Copied contents of '$1'"  # More descriptive success message
                return 0
            else
                echo "Failed to copy contents of '$1' to the clipboard" >&2
                return 1
            fi
        fi
    }
fi
