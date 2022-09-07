.PHONY: repos clean deploy

REPOS?="https://github.com/ozwaldorf/ic_otp" "https://github.com/ozwaldorf/ic-playground"

replica:
	dfx ping local &>/dev/null || dfx start --background --clean

stop-replica:
	dfx stop

repos:
	@cd assets && for repo in $(REPOS); do \
		rm -rf $$(basename $$repo).git; \
		git clone --bare $$repo; \
		cd $$(basename $$repo).git; \
		git update-server-info; \
		cd ..; \
	done

build: repos
	yarn build


local: build replica
	@dfx deploy

ic: repos
	@DFX_NETWORK=ic yarn build
	@dfx deploy --network=ic