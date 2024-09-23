{ pkgs }:

pkgs.writeShellScriptBin "screenshot" ''
  # Restores the shader after screenhot has been taken
  restore_shader() {
  	if [ -n "$shader" ]; then
  		${pkgs.hyprshade}/bin/hyprshade on "$shader"
  	fi
  }

  # Saves the current shader and turns it off
  save_shader() {
  	shader=$(${pkgs.hyprshade}/bin/hyprshade current)
  	${pkgs.hyprshade}/bin/hyprshade off
  	trap restore_shader EXIT
  }

  save_shader # Saving the current shader

  temp_screenshot="/tmp/screenshot.png"

  function print_error
  {
  	cat <<"EOF"
      screenshot <action>
      ...valid actions are...
          p  : print all screens
          s  : snip current screen
          sf : snip current screen (frozen)
          m  : print focused monitor
  EOF
  }

  case $1 in
  p) # print all outputs
  	${pkgs.grimblast}/bin/grimblast copysave screen $temp_screenshot && restore_shader && swappy -f $temp_screenshot ;;
  s) # drag to manually snip an area / click on a window to print it
  	${pkgs.grimblast}/bin/grimblast copysave area $temp_screenshot && restore_shader && swappy -f $temp_screenshot ;;
  sf) # frozen screen, drag to manually snip an area / click on a window to print it
  	${pkgs.grimblast}/bin/grimblast --freeze copysave area $temp_screenshot && restore_shader && swappy -f $temp_screenshot ;;
  m) # print focused monitor
  	${pkgs.grimblast}/bin/grimblast copysave output $temp_screenshot && restore_shader && swappy -f $temp_screenshot ;;
  *) # invalid option
  	print_error ;;
  esac

  rm "$temp_screenshot"
''
