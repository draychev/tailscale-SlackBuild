#!make

.PHONY: install-linter
install-linter:
	sudo sbopkg -i sbo-maintainer-tools

.PHONY: lint
lint:
	/usr/bin/sbolint ./tailscale

.PHONY: build-package
build-package: lint
	tar -czf tailscale_1.30.0.tgz tailscale/
	ls -lah tailscale_1.30.0.tgz


tailscale_1.30.0.tgz: build-package
