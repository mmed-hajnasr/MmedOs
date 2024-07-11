CONFIG_FILES="$HOME/.config/waybar/noback/config $HOME/.config/waybar/noback/desc-colors.css $HOME/.config/waybar/noback/style.css $HOME/.config/waybar/desktopclock/config $HOME/.config/waybar/desktopclock/style.css $HOME/.config/waybar/desktopclock/desc-colors.css "

trap "pkill waybar" EXIT

while true; do
    waybar -c $HOME/.config/waybar/noback/config -s $HOME/.config/waybar/noback/style.css &
    waybar -c $HOME/.config/waybar/desktopclock/config -s $HOME/.config/waybar/desktopclock/style.css &
    inotifywait -e create,modify $CONFIG_FILES
    pkill waybar
done
