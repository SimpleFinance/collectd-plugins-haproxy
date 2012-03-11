NAME=collectd-plugins-haproxy
VERSION=0.1.3
URL=https://github.banksimple.com/BankSimple/$(NAME)
DESCRIPTION="Collectd plugin for haproxy"
MAINTAINER=packages@banksimple.com
ARCH=all
PACKAGE_NAME=$(NAME)
PACKAGE_VERSION=$(VERSION)

PREFIX=installroot/usr/lib/collectd/plugins
SOURCES=haproxy-stats

.PHONY: default
default: package


test:
	./haproxy-stats -f samples/stats1.csv

sources:
	echo "Installing from current dir"

install: sources
	install -d $(PREFIX)
	install $(SOURCES) $(PREFIX)

package: install
	fpm -s dir -t deb  -n $(PACKAGE_NAME)  -v $(PACKAGE_VERSION) \
                --url $(URL) --arch $(ARCH) --description $(DESCRIPTION) \
                -m $(MAINTAINER) \
		-p $(PACKAGE_NAME)-$(PACKAGE_VERSION)_$(ARCH).deb -C installroot .


distclean: clean
	@rm -f *.deb

clean:
	@rm -rf $(NAME)-$(VERSION) $(NAME)-$(VERSION).tar.gz installroot
