# required libnotify
{ pkgs }:
pkgs.writers.writePython3Bin "go-browser" { libraries = [ ]; } /*python*/ ''  
import subprocess
command = 'hyprctl workspaces | grep -B 5 "Zen"\
| grep -oP "workspace ID \\K\\d+"'

try:
    result = subprocess.check_output(command, shell=True, text=True)
    browser_workspaces = result.splitlines()
    browser_workspaces = [int(line) for line in browser_workspaces]
    browser_workspaces.sort()
    command = 'hyprctl activeworkspace | grep -oP "workspace ID \\K\\d+"'
    result = subprocess.check_output(command, shell=True, text=True)
    active_workspace = int(result)
    next_workspace = browser_workspaces[0]
    for workspace in browser_workspaces:
        if workspace > active_workspace:
            next_workspace = workspace
            break
    command = f'hyprctl dispatch workspace {next_workspace}'.split()
    subprocess.run(command)
except subprocess.CalledProcessError:
    subprocess.Popen('hyprctl dispatch workspace empty; zen', shell=True)
''
