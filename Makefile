#!make

.PHONY: install-linter
install-linter:
	sudo sbopkg -i sbo-maintainer-tools

.PHONY: lint
lint:
	/usr/bin/sbolint ./tailscale

.PHONY: build-package
build-package: lint
	tar -czf tailscale.tar.gz ./tailscale


.PHONY: install
install: build-package
	sudo bash ./tailscale/tailscale.SlackBuild
	sudo installpkg /tmp/tailscale-1.38.4-amd64-1_SBo.tgz


.PHONY: prep-for-submission
prep-for-submission: lint
	tar -czf tailscale_1.38.4.tgz tailscale/
	ls -lah tailscale_1.38.4.tgz


.PHONY: clean
clean:
	rm -rf *.tar.gz *.tgz
