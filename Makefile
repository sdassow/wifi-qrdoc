.SUFFIXES: .tex .pdf

# use egress interface by default
WLANIF != ifconfig egress | perl -lne 'm!^(\w+\d+):! && print $$1'

all: build

build: wifi-qrdoc.pdf

wifi-qrdoc.pdf: mynw.tex

clean:
	rm -f mynw.tex wifi-qrdoc.{aux,dvi,log,pdf} .secure

mynw.tex:
	perl -lne 'm!^\s*#! && next; m!nwid\s+"(.*?)"! && print "\\def\\mynwid{$$1}"; m!wpakey\s+"(.*?)"! && print "\\def\\mynwkey{$$1}"' < /etc/hostname.${WLANIF} >> $@

.secure:
	chmod 0700 .
	touch $@

.tex.pdf: .secure
	xelatex $<
