## FB installation
env $(fwdproxy-config --format=sh curl) ./install
env $(fwdproxy-config --format=sh curl) nvim
:PlugUpdate

