.SUFFIXES: .tex .pdf

# use egress interface by default
WLANIF != ifconfig egress | perl -lne 'm!^(\w+\d+):! && print $$1'

all: build

build: wifi-qrdoc.pdf

wifi-qrdoc.pdf: mynw.tex

mynw.tex:
	touch $@
	chmod 0600 $@
	perl -lne 'm!^\s*#! && next; m!nwid\s+"(.*?)"! && print "\\def\\mynwid{$$1}"; m!wpakey\s+"(.*?)"! && print "\\def\\mynwkey{$$1}"' < /etc/hostname.${WLANIF} >> $@

.tex.pdf:
	xelatex $<
