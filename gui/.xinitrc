#!/bin/sh

# xinitrc runs automatically when you run startx.

# There are some small but important commands that need to be run when we start
# the graphical environment. There is a link to this file in ~/.xprofile
# because that file is run automatically if someone uses a display manager
# (login screen) and so they are needed there. To prevent doubling up commands,
# I source them here with the line below.

. "$HOME/.xprofile"

export SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass
export SSH_ASKPASS_REQUIRE=prefer
eval "$(keychain --eval --noask ~/.ssh/id_rsa)"

ssh-agent dwm
