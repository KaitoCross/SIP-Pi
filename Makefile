all: sipcall sipserv

sipcall: sipcall.c
	cc -o $@ $< `pkg-config --cflags --libs libpjproject`
	
sipserv: sipserv.c
	cc -o $@ $< `pkg-config --cflags --libs libpjproject`
	
sipserv-debug: sipserv.c
	cc -g -o $@ $< `pkg-config --cflags --libs libpjproject`

sipserv-gpio: sipserv.c
	cc -o sipserv $< `pkg-config --cflags --libs libpjproject`  -L/usr/local/lib -lwiringPi -Dgpioenable

sipserv-tcp: sipserv.c
	cc -o sipserv $< `pkg-config --cflags --libs libpjproject`  -L/usr/local/lib -lwiringPi -lpthread -Dgpioenable -Dtcpmodule

sipserv-local: sipserv.c
	cc -o $@ $< `pkg-config --cflags --libs libpjproject` -Dlocalhost

sipserv-gpio-local: sipserv.c
	cc -o sipserv $< `pkg-config --cflags --libs libpjproject`  -L/usr/local/lib -lwiringPi -Dgpioenable -Dlocalhost

sipserv-tcp-local: sipserv.c
	cc -o sipserv $< `pkg-config --cflags --libs libpjproject`  -L/usr/local/lib -lwiringPi -lpthread -Dgpioenable -Dtcpmodule -Dlocalhost

clean:
	rm -rf sipcall
	rm -rf sipserv
	rm -rf sipserv-debug

