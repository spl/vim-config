default:
	git submodule sync
	git submodule update --init
	$(MAKE) -C vimfiles/bundle/vimproc
