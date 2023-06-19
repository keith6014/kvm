SHELL = /bin/sh

all: f

pkgs: hosts
	ansible-playbook -i $^ setup_nfs.yml setup_corepackages.yml && >$@

f: pkgs
	ansible-playbook -i hosts setup_nfs.yml

hosts:
	>$@ && \
	for i in $(shell arp -e | awk '/virbr0/ { print $$1}'); do \
        ping -W.5 -c1 $$i && echo $$i >>$@ ;\
	done 

clean:
	rm -rf ./pkgs
