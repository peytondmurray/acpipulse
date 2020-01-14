#!/bin/bash

# Reference: https://unix.stackexchange.com/questions/342556/pulseaudio-auto-switch-sink-when-headphones-connected
# 1. Install/enable/start acpid
# 2. `pactl list sinks` to list possible sinks; choose the ones you want
# 3. `sudo ln -s headphone-jack.sh /etc/acpi/headphone-jack.sh`
# 4. `sudo ln -s headphone-jack /etc/acpi/events/headphone-jack`
set -e -u

if [ "$1" = "jack/headphone" -a "$2" = "HEADPHONE" ]; then
    case "$3" in
        plug)
            sink=alsa_output.pci-0000_0d_00.4.analog-stereo
            ;;
        *)
            sink=alsa_output.pci-0000_0b_00.1.hdmi-stereo
            ;;
    esac
    for userdir in /run/user/*; do
        uid="$(basename $userdir)"
        user="$(id -un $uid)"
        if [ -f "$userdir/pulse/pid" ]; then
            PULSE_RUNTIME_PATH="$userdir/pulse" su "$user" -c "paswitch $sink"
        fi
    done
fi
