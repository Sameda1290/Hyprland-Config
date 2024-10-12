#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Rofi menu for Quick Edit/View of Settings (SUPER E)

# Define preferred text editor and terminal
edit=${EDITOR:-nvim}
tty=konsole

# Paths to configuration directories
configs="$HOME/.config/hypr"

# Function to display the menu options
menu() {
    cat <<EOF
1. Edit hyprland
2. Edit hyprlock
3. Edit hyprpaper
4. Edit hypridle
EOF
}

# Main function to handle menu selection
main() {
    choice=$(menu | rofi -i -dmenu -config ~/.config/rofi/config-compact.rasi | cut -d. -f1)
    
    # Map choices to corresponding files
    case $choice in
        1) file="/home/samet/.config/hypr/hyprland.conf" ;;
        2) file="/home/samet/.config/hypr/hyprlock.conf" ;;
        3) file="/home/samet/.config/hypr/hyprpaper.conf" ;;
        4) file="/home/samet/.config/hypr/hypridle.conf" ;;
        *) return ;;  # Do nothing for invalid choices
    esac

    # Open the selected file in the terminal with the text editor
    $tty -e $edit "$file"
}

main
