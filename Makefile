
all:
	$(MAKE) -C src

install: all
	mkdir -p $(DESTDIR)/usr/bin
	install -m 755 src/hawkeye $(DESTDIR)/usr/bin/hawkeye
	cp ./share/init.d /etc/init.d/hawkeye
	chmod +x /etc/init.d/hawkeye
	mkdir -p /usr/share/man/man1
	cp ./doc/hawkeye.1 /usr/share/man/man1/
	mandb
	mkdir -p /etc/hawkeye
	cp ./doc/hawkeye.conf /etc/hawkeye/
	mkdir -p /var/lib/hawkeye
	cp -r www /var/lib/hawkeye

clean:
	$(MAKE) -C src clean

.PHONY: clean
