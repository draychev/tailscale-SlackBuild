This repo contains all the scripts needed to build a Tailscale 1.38.4 package for Slackware 15.0

## Install Package
1. run `make install` to build and install the package (look in the Makefile for more options)
   - this will `sudo bash ./tailscale/tailscale.SlackBuild`
   - and then it will `sudo installpkg /tmp/tailscale-1.38.4-amd64-1_SBo.tgz`
2. ensure the daemon starts on bootup: `sudo chmod +x /etc/rc.d/rc.tailscale`
3. start the dameon: `sudo /etc/rc.d/rc.tailscale start`
4. check the logs: `sudo tail -f /var/log/messages | grep -i tailscale`
3. start Tailscale: `sudo tailscale up`

## Developer:
0. Install slackpkg [from here](https://slackpkg.org/documentation.html)
1. run `make install-linter` to install `sbo-maintainer-tools`
2. run `make lint`  to test with `sbolint` and `sbopkglint`
3. run `make build-package`
4. submit the package [to SlackBuilds.org here](https://slackbuilds.org/submit/)

## Thanks!
### Inspiration for this package:
   - https://github.com/shayne/unRAID-NerdPack
   - https://rakhesh.com/linux-bsd/tailscale-on-openbsd/

### Documentation:
 - https://slackbuilds.org/guidelines/
 - https://slackbuilds.org/templates/
