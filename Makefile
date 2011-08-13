NAME=collectd-plugins-haproxy
VERSION=0.1.0
SOURCE=https://download.github.com/$(NAME)-$(VERSION).tar.gz
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
	git clone $(URL).git $(NAME)-$(VERSION)
	cd $(NAME)-$(VERSION) && git checkout $(VERSION)

install: sources
	install -d $(PREFIX)
	install $(SOURCES) $(PREFIX)

package: install
	/opt/fpm/bin/fpm -s dir -t deb  -n $(PACKAGE_NAME)  -v $(PACKAGE_VERSION) \
                -d $(DEPENDS) --url $(URL) --arch $(ARCH) --description $(DESCRIPTION) \
                -m $(MAINTAINER) \
		-p $(PACKAGE_NAME)-$(PACKAGE_VERSION)_$(ARCH).deb -C installroot .


distclean: clean
	@rm -f *.deb

clean:
	@rm -rf $(NAME)-$(VERSION) $(NAME)-$(VERSION).tar.gz installroot
