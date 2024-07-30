{ pkgs }:

pkgs.writeShellScriptBin "ghosts" ''
  RED08=$(tput setaf 1)
  GREEN0B=$(tput setaf 2)
  YELLOW0A=$(tput setaf 3)
  BLUE0D=$(tput setaf 4)
  MAGNETA0E=$(tput setaf 5)
  CYAN0C=$(tput setaf 6)
  TEXT05=$(tput setaf 7)
  BG02_03=$(tput setaf 8)
  ACCENT1_09=$(tput setaf 9)
  SURFACE1_01=$(tput setaf 10)
  SURFACE2_02=$(tput setaf 11)
  SURFACE3_04=$(tput setaf 12)
  SURFACE4_06=$(tput setaf 13)
  ACCENT2_0F=$(tput setaf 14)
  WHITE07=$(tput setaf 15)
  BLACK=$(tput setaf 16)
  RESET=$(tput sgr0)

  cat << EOF

  $RED08    ▄▄▄      $GREEN0B    ▄▄▄      $YELLOW0A    ▄▄▄      $BLUE0D    ▄▄▄      $MAGNETA0E    ▄▄▄      $CYAN0C    ▄▄▄      $TEXT05    ▄▄▄      
  $RED08   ▀█▀██  ▄  $GREEN0B   ▀█▀██  ▄  $YELLOW0A   ▀█▀██  ▄  $BLUE0D   ▀█▀██  ▄  $MAGNETA0E   ▀█▀██  ▄  $CYAN0C   ▀█▀██  ▄  $TEXT05   ▀█▀██  ▄  
  $RED08 ▀▄██████▀   $GREEN0B ▀▄██████▀   $YELLOW0A ▀▄██████▀   $BLUE0D ▀▄██████▀   $MAGNETA0E ▀▄██████▀   $CYAN0C ▀▄██████▀   $TEXT05 ▀▄██████▀   
  $RED08    ▀█████   $GREEN0B    ▀█████   $YELLOW0A    ▀█████   $BLUE0D    ▀█████   $MAGNETA0E    ▀█████   $CYAN0C    ▀█████   $TEXT05    ▀█████   
  $RED08       ▀▀▀▀▄ $GREEN0B       ▀▀▀▀▄ $YELLOW0A       ▀▀▀▀▄ $BLUE0D       ▀▀▀▀▄ $MAGNETA0E       ▀▀▀▀▄ $CYAN0C       ▀▀▀▀▄ $TEXT05       ▀▀▀▀▄ 
  $RED08    RED 08     $GREEN0B  GREEN 0B   $YELLOW0A  YELLOW 0A  $BLUE0D  BLUE 0D    $MAGNETA0E  MAGNETA 0E $CYAN0C  CYAN 0C    $TEXT05  TEXT 05  

  $ACCENT1_09    ▄▄▄      $SURFACE1_01    ▄▄▄      $SURFACE2_02    ▄▄▄      $SURFACE3_04    ▄▄▄      $SURFACE4_06    ▄▄▄      $ACCENT2_0F    ▄▄▄      $BG02_03    ▄▄▄     
  $ACCENT1_09   ▀█▀██  ▄  $SURFACE1_01   ▀█▀██  ▄  $SURFACE2_02   ▀█▀██  ▄  $SURFACE3_04   ▀█▀██  ▄  $SURFACE4_06   ▀█▀██  ▄  $ACCENT2_0F   ▀█▀██  ▄  $BG02_03   ▀█▀██  ▄ 
  $ACCENT1_09 ▀▄██████▀   $SURFACE1_01 ▀▄██████▀   $SURFACE2_02 ▀▄██████▀   $SURFACE3_04 ▀▄██████▀   $SURFACE4_06 ▀▄██████▀   $ACCENT2_0F ▀▄██████▀   $BG02_03 ▀▄██████▀  
  $ACCENT1_09    ▀█████   $SURFACE1_01    ▀█████   $SURFACE2_02    ▀█████   $SURFACE3_04    ▀█████   $SURFACE4_06    ▀█████   $ACCENT2_0F    ▀█████   $BG02_03    ▀█████  
  $ACCENT1_09       ▀▀▀▀▄ $SURFACE1_01       ▀▀▀▀▄ $SURFACE2_02       ▀▀▀▀▄ $SURFACE3_04       ▀▀▀▀▄ $SURFACE4_06       ▀▀▀▀▄ $ACCENT2_0F       ▀▀▀▀▄ $BG02_03       ▀▀▀▀▄
  $ACCENT1_09  ACCENT_1 09$SURFACE1_01 SURFACE_1 01$SURFACE2_02 SURFACE_2 02$SURFACE3_04 SURFACE_3 04$SURFACE4_06 SURFACE_4 06$ACCENT2_0F ACCENT_2 0F $BG02_03  BG02 03
  $rst
  EOF
''
