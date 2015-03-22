BIN = smpl
PREFIX ?= /usr/local
DESTDIR ?=
BINDIR ?= $(PREFIX)/bin
LIBDIR ?= $(PREFIX)/lib
MANDIR ?= $(PREFIX)/share/man
CP ?= cp

ifdef LINK
	CP = ln -rs
endif

BASHCOMP_PATH ?= $(DESTDIR)$(PREFIX)/share/bash-completion/completions

all:

link:
	@$(MAKE) --no-print-directory install LINK=1

install-bin:
	@mkdir -p $(DESTDIR)$(BINDIR)
ifdef LINK
	@$(CP) -vf $(BIN) $(DESTDIR)$(BINDIR)
else
	sed 's:^lib_dir=.*:lib_dir="$(DESTDIR)$(LIBDIR)/$(BIN)":' \
		$(BIN) > $(DESTDIR)$(BINDIR)/$(BIN)
endif
	@chmod 755 $(DESTDIR)$(BINDIR)/$(BIN)

install-lib:
	@mkdir -p $(DESTDIR)$(LIBDIR)
	@$(CP) -rvf lib $(DESTDIR)$(LIBDIR)/$(BIN)

install-man:
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@$(CP) -vf man/$(BIN).1 $(DESTDIR)$(MANDIR)/man1
	@chmod 644 $(DESTDIR)$(MANDIR)/man1/$(BIN).1

install-comp:
	@mkdir -p $(BASHCOMP_PATH)
	@$(CP) -vf completion/_$(BIN).bash $(BASHCOMP_PATH)/$(BIN)
	@chmod 644 $(BASHCOMP_PATH)/$(BIN)

install: install-bin install-lib install-man install-comp

uninstall:
	@rm -vrf \
		"$(DESTDIR)$(BINDIR)/$(BIN)" \
		"$(DESTDIR)$(LIBDIR)/$(BIN)" \
		"$(DESTDIR)$(MANDIR)/man1/$(BIN).1" \
		"$(BASHCOMP_PATH)/$(BIN)"
