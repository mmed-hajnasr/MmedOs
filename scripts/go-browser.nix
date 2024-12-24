{ pkgs }:
pkgs.writers.writePython3Bin "testing" { libraries = [ ]; } /*python*/ ''  
  import subprocess

  result = subprocess.run(['ls', '-l'], capture_output=True, text=True)

  assert result.returncode == 0
  print("Output:", result.stdout)
''
