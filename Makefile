# OASIS_START
# OASIS_STOP

coverage : test
	mkdir -p _coverage coverage
	rm coverage/* _coverage/*
	BISECT_FILE=_coverage/bisect BISECT_COVERAGE=YES $(SETUP) -build $(BUILDFLAGS) && $(SETUP) -test $(TESTFLAGS)
	bisect-report -I src/ -I src/amf/ -I test/ -html coverage/ _coverage/*

github.io-docs : docs coverage
	rm -rf docs/*

	cp -r amf_api.docdir/* docs
	cp -r coverage docs

	git add docs
