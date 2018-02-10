# OASIS_START
# OASIS_STOP

github.io-docs : docs
	rm -rf docs/*
	cp -r amf_api.docdir/* docs
	git add docs
