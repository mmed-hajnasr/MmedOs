function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

wallpaper() {
	swww img --transition-type random --transition-duration=2 --transition-fps=120 $1
	cp $1 ~/wallpapers/current_wallpaper.jpg
}

dive() {
    
}
