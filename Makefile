# OASIS_START
# DO NOT EDIT (digest: a3c674b4239234cbbe53afe090018954)

SETUP = ocaml setup.ml

build: setup.data
	$(SETUP) -build $(BUILDFLAGS)

doc: setup.data build
	$(SETUP) -doc $(DOCFLAGS)

test: setup.data build
	$(SETUP) -test $(TESTFLAGS)

all:
	$(SETUP) -all $(ALLFLAGS)

install: setup.data
	$(SETUP) -install $(INSTALLFLAGS)

uninstall: setup.data
	$(SETUP) -uninstall $(UNINSTALLFLAGS)

reinstall: setup.data
	$(SETUP) -reinstall $(REINSTALLFLAGS)

clean:
	$(SETUP) -clean $(CLEANFLAGS)

distclean:
	$(SETUP) -distclean $(DISTCLEANFLAGS)

setup.data:
	$(SETUP) -configure $(CONFIGUREFLAGS)

configure:
	$(SETUP) -configure $(CONFIGUREFLAGS)

.PHONY: build doc test all install uninstall reinstall clean distclean configure

# OASIS_STOP

_coverage/bisect0001.out : test
	mkdir -p _coverage
	rm -rf _coverage/*
	env BISECT_COVERAGE=YES $(SETUP) -build $(BUILDFLAGS)
	env BISECT_FILE=_coverage/bisect ./test.byte

coverage/index.html : _coverage/bisect0001.out
	mkdir -p coverage
	rm -rf coverage/*
	bisect-ppx-report -I src/ -I src/amf/ -I test/ -html coverage/ _coverage/*

github.io-docs : doc coverage/index.html
	rm -rf docs/*

	cp -r amf_api.docdir/* docs
	cp -r coverage docs
