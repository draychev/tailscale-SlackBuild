#!make

.PHONY: install-linter
install-linter:
	sudo sbopkg -i sbo-maintainer-tools

.PHONY: lint
lint: build-package
	@echo -e "\n\n>>> Running sbolint"
	/usr/bin/sbolint ./tailscale
	@echo -e "\n\n>>> Running sbopkglint"
	/usr/bin/sbopkglint ./tailscale.tgz

.PHONY: build-package
build-package: clean
	cp -R ./tailscale ./install
	tar -czf tailscale.tgz ./install
	rm -rf ./install


.PHONY: install
install: build-package
	sudo bash ./tailscale/tailscale.SlackBuild
	sudo /sbin/installpkg /tmp/tailscale-1.40.0-amd64-1_SBo.tgz


.PHONY: prep-for-submission
prep-for-submission: lint
	tar -czf tailscale_1.40.0.tgz tailscale/
	ls -lah tailscale_1.40.0.tgz


.PHONY: clean
clean:
	rm -rf *.tar.gz *.tgz
