# acpipulse
Auto-switch Pulse audio output when headphones are plugged in (even with HDMI monitor output)

## Installation

These files were modified from [this stackexchange thread][thread].

1. Install/enable/start acpid
2. `pactl list sinks` to list possible sinks; choose the ones you want
3. `sudo ln -s headphone-jack.sh /etc/acpi/headphone-jack.sh`
4. `sudo ln -s headphone-jack /etc/acpi/events/headphone-jack`

[thread]: https://unix.stackexchange.com/questions/342556/pulseaudio-auto-switch-sink-when-headphones-connected
