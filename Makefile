# OASIS_START
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
