{ pkgs }:
pkgs.writers.writePython3Bin "monitor" { } /*python*/ ''
import argparse
import subprocess
from pathlib import Path
from enum import Enum


class MonitorLayout(Enum):
    HDMI = "hdmi"
    MAIN = "main"
    DOUBLE = "double"
    AUTO = "auto"

    def __str__(self):
        return self.value


def parse_arguments():
    parser = argparse.ArgumentParser(description="select Monitor layout")

    # Make the -m flag optional
    parser.add_argument(
        "-m", "--mode",
        type=MonitorLayout,
        choices=list(MonitorLayout),
        default=MonitorLayout.AUTO,
        help="select the preferred Mode (optional)"
    )
    return parser.parse_args()


def detect_hdmi_connection():
    """Check if an HDMI connection exists using wlr-randr."""
    try:
        output = subprocess.check_output(
            "${pkgs.wlr-randr}/bin/wlr-randr\
            | grep -o HDMI", shell=True, text=True
        )
        return bool(output.strip())
    except subprocess.CalledProcessError:
        print("Error running wlr-randr or no HDMI found.")
        return False


def configure_monitor_layout(mode):
    """Generate the monitor layout configuration based on the selected mode."""
    match mode:
        case MonitorLayout.HDMI:
            return (
                "monitor = HDMI-A-1 , 1920x1080@120, 0x0, 1\n",
                "monitor = eDP-1, disable\n"
            )
        case MonitorLayout.MAIN:
            return (
                "monitor = HDMI-A-1 , disable\n",
                "monitor = eDP-1, 1920x1080@120, 0x0, 1\n"
            )
        case MonitorLayout.DOUBLE:
            return (
                "monitor = HDMI-A-1 , 1920x1080@120, 0x0, 1\n",
                "monitor = eDP-1, 1920x1080@120, 1920x0, 1\n"
            )
        case _:
            raise ValueError(f"Unsupported mode: {mode}")


args = parse_arguments()
if args.mode == MonitorLayout.AUTO:
    if detect_hdmi_connection():
        args.mode = MonitorLayout.HDMI
    else:
        args.mode = MonitorLayout.MAIN


hypr_file_path = Path.home() / ".config/hypr/hyprland.conf"
try:
    hdmi_config, edp_config = configure_monitor_layout(args.mode)
    with open(hypr_file_path, "r") as file:
        lines = file.readlines()
        lines[0] = hdmi_config
        lines[1] = edp_config
    with open(hypr_file_path, "w") as file:
        file.writelines(lines)

    print("HDMI Config:", hdmi_config)
    print("eDP Config:", edp_config)
except ValueError as e:
    print("Error:", e)
''

