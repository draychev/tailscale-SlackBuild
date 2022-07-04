# douninst.sh
#
# uninstall script for Slackware >= 15.0
#
# NOTE: This script is run AFTER package removal, so be careful!
#       Consider it optional, use if it is really needed.

/etc/rc.d/rc.tailscale stop
killall -SIGINT tailscaled 2>/dev/null
rm -rf /var/lock/tailscale
rm -rf /var/db/tailscale/tailscaled.state
rm -rf /var/db/tailscale
rm -rf /var/run/tailscale/tailscaled.sock
rm -rf /var/run/tailscale
