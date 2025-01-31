#!/usr/bin/env bash

# This script will start by moving the X-AIR-Edit binary into a more central location
# Then we will configure a autostart .desktop file that will start the application when
# the user logs in
#
set -x
# Move the binary into a better location
sudo cp ~/Downloads/X-AIR-Edit /usr/local/bin/

# Double check that it's actually executable
sudo chmod +x /usr/local/bin/X-AIR-Edit

# Setup the application to autostart when the user logs in. This is seemingly more
# reliable than the systemd service. Maybe we can improve that, but for now, this
# seems to be working fine.
mkdir $HOME/.config/autostart/
touch $HOME/.config/autostart/X-AIR-Edit.desktop
cat <<EOF >"$HOME/.config/autostart/X-AIR-Edit.desktop"
[Desktop Entry]
Type=Application
Name=X-AIR-Edit
Exec=/usr/local/bin/X-AIR-Edit
EOF
