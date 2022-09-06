#!make

.PHONY: install-linter
install-linter:
	sudo sbopkg -i sbo-maintainer-tools

.PHONY: lint
lint:
	/usr/bin/sbolint ./tailscale

.PHONY: build-package
build-package: lint
	sudo bash ./tailscale/tailscale.SlackBuild


.PHONY: install
install: build-package
	sudo installpkg /tmp/tailscale-1.30.0-amd64-1_SBo.tgz


.PHONY: prep-for-submission
prep-for-submission: lint
	tar -czf tailscale_1.30.0.tgz tailscale/
	ls -lah tailscale_1.30.0.tgz
