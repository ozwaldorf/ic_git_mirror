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

local: replica
	@dfx deploy

ic:
	@dfx deploy --network=ic

dev: local
	@yarn && yarn start