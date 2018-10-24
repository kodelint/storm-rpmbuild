.PHONY:	rpm clean

VERSION ?= ${storm_version}
BUILD_NUMBER ?= 1
SOURCE = apache-storm-$(VERSION).tar.gz
TOPDIR = /tmp/storm-rpm
PWD = $(shell pwd)
URL = $(shell curl -s https://www.apache.org/dyn/closer.cgi/storm/apache-storm-$(VERSION)/apache-storm-$(VERSION).tar.gz?asjson=1 | python -c 'import sys,json; data=json.load(sys.stdin); print data["preferred"] + data["path_info"]')

rpm: $(SOURCE)
	@rpmbuild -v -bb \
			--define "_sourcedir $(PWD)" \
			--define "_rpmdir $(PWD)" \
			--define "_topdir $(TOPDIR)" \
			--define "version $(VERSION)" \
			--define "build_number $(BUILD_NUMBER)" \
			storm.spec

$(SOURCE):
	@spectool \
                        --define "version $(VERSION)" \
                        -g storm.spec

clean:
	@rm -rf $(TOPDIR) x86_64
	@rm -f $(SOURCE)
