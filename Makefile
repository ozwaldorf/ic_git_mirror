.PHONY: repos clean deploy

REPOS?="https://github.com/ozwaldorf/ic_otp" "https://github.com/ozwaldorf/ic-playground"

repos:
	@cd public && for repo in $(REPOS); do \
		rm -rf $$(basename $$repo).git; \
		git clone --bare $$repo; \
		cd $$(basename $$repo).git; \
		git update-server-info; \
		cd ..; \
	done

replica:
	dfx ping local &>/dev/null || dfx start --background --clean

stop-replica:
	dfx stop

local: repos replica
	@dfx deploy

ic: repos
	@dfx deploy --network=ic