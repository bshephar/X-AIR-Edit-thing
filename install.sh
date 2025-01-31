#!/usr/bin/env bash

# This script will start by moving the X-AIR-Edit binary into a more central location
# Then we will configure a systemd service that will start the application on boot
#

# Move the binary into a better location
sudo cp ~/Downloads/X-AIR-Edit /usr/local/bin/

# Double check that it's actually executable
sudo chmod +x /usr/local/bin/X-AIR-Edit

# Setup the systemd service to execute the program on user login
mkdir -p $HOME/.local/share/systemd/user/
cat <<EOF >$HOME/.local/share/systemd/user/X-AIR-Edit.service
[Unit]
Description=Run the X-AIR-Edit application
StartLimitIntervalSec=400
StartLimitBurst=5

[Service]
ExecStart=/usr/local/bin/X-AIR-Edit
Restart=on-failure
RestartSec=90

[Install]
WantedBy=default.target
EOF

sudo systemctl daemon-reload
systemctl --user enable --now X-AIR-Edit
