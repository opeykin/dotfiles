## FB installation

env $(fwdproxy-config --format=sh curl) ./install

Add this to back rc:
[ -f ~/.bashrc_shared ] && source ~/.bashrc_shared

env $(fwdproxy-config --format=sh curl) nvim

:PlugUpdate

