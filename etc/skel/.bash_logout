# ~/.bash_logout for MEET

# kill dbus in SSH
if [ -n "$SSH_TTY" ]; then
  pkill -u "$USER" -t "${SSH_TTY/\/dev\//}" dbus-launch
fi
