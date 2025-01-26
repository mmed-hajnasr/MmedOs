function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function syy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	sudo yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function build() {
  local script_path=$1
  nix-build $script_path --arg pkgs 'import <nixpkgs> {}'
}


function vi() {
  nb=$(kitten @ launch --keep-focus --cwd=current)
  if [ -z "$VI_FIRST_CALL_DONE" ]; then
    kitten @ resize-window --increment=-12 --axis=vertical --match id:$nb
    export VI_FIRST_CALL_DONE=1 # Mark the first call as done
  fi
  kitten @ goto-layout stack
  nvim && kitten @ close-window --match id:$nb
  kitten @ goto-layout fat
}
