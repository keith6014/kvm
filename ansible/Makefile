SHELL=/bin/sh

all: simple.yml

.PHONY: simple.yml

simple.yml:
	ansible-playbook  -i inventory/hosts simple.yml
