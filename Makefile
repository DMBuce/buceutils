SHELL = /bin/sh

# root for installation
prefix      = /usr/local
exec_prefix = ${prefix}

# executables
bindir     = ${exec_prefix}/bin
sbindir    = ${exec_prefix}/sbin
libexecdir = ${exec_prefix}/libexec

# data
datarootdir    = ${prefix}/share
datadir        = ${datarootdir}
sysconfdir     = ${prefix}/etc
sharedstatedir = ${prefix}/com
localstatedir  = ${prefix}/var

# misc
includedir    = ${prefix}/include
oldincludedir = /usr/include
docdir        = ${datarootdir}/doc/${PACKAGE_TARNAME}
infodir       = ${datarootdir}/info
libdir        = ${exec_prefix}/lib
localedir     = ${datarootdir}/locale
mandir        = ${datarootdir}/man
man1dir       = $(mandir)/man1
man2dir       = $(mandir)/man2
man3dir       = $(mandir)/man3
man4dir       = $(mandir)/man4
man5dir       = $(mandir)/man5
man6dir       = $(mandir)/man6
man7dir       = $(mandir)/man7
man8dir       = $(mandir)/man8
man9dir       = $(mandir)/man9
manext        = .1
srcdir        = .

INSTALL         = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA    = ${INSTALL} -m 644

PACKAGE   = buceutils
PROG      = buceutils
#VERSION   = 0.0.0
BUGREPORT = https://github.com/DMBuce/buceutils/issues
URL       = https://github.com/DMBuce/buceutils

BINFILES         = $(wildcard bin/*)
BINFILES_INSTALL = $(BINFILES:bin/%=$(DESTDIR)$(bindir)/%)
ETCFILES         = $(wildcard etc/bashrc.d/*)
ETCFILES_INSTALL = $(ETCFILES:etc/%=$(DESTDIR)$(sysconfdir)/%)
INSTALL_FILES    = $(BINFILES_INSTALL) $(ETCFILES_INSTALL)
INSTALL_DIRS     = $(DESTDIR)$(bindir) $(DESTDIR)$(sysconfdir)/bashrc.d

.PHONY: all
all:

.PHONY: install
install: all install-dirs $(INSTALL_FILES)

.PHONY: install-dirs
install-dirs:
	mkdir -p $(INSTALL_DIRS)

$(DESTDIR)$(bindir)/%: bin/%
	$(INSTALL_PROGRAM) $< $@

$(DESTDIR)$(sysconfdir)/bashrc.d/%: etc/bashrc.d/%
	$(INSTALL_PROGRAM) $< $@

# vim: set ft=make:
