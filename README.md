This repo contains all the scripts needed to build a Tailscale 1.30.0 package for Slackware 15.0

## Install Package
0. run `sudo bash ./tailscale/tailscale.SlackBuild`
1. install with `sudo installpkg /tmp/tailscale-1.30.0-amd64-1_SBo.tgz`
2. ensure the daemon starts on bootup: `sudo chmod +x /etc/rc.d/rc.tailscale`
3. start the dameon: `sudo /etc/rc.d/rc.tailscale start`
4. check the logs: `sudo tail -f /var/log/messages | grep -i tailscale`
3. start Tailscale: `sudo tailscale up`

## Developer:
0. Install slackpkg from here
1. run `make install-linter` to install `sbo-maintainer-tools`
2. run `make lint`
3. run `make build-package`


## Thanks!
### Inspiration for this package:
   - https://github.com/shayne/unRAID-NerdPack
   - https://rakhesh.com/linux-bsd/tailscale-on-openbsd/

### Documentation:
 - https://slackbuilds.org/guidelines/
 - https://slackbuilds.org/templates/
