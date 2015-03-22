BIN = smpl
PREFIX ?= /usr/local
DESTDIR ?=
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man
CP ?= cp

ifdef LINK
	CP = ln -rs
endif

BASHCOMP_PATH ?= $(DESTDIR)$(PREFIX)/share/bash-completion/completions

all:

install-bin:
	@mkdir -p $(DESTDIR)$(BINDIR)
	@$(CP) -vf $(BIN) $(DESTDIR)$(BINDIR)
	@chmod 755 $(DESTDIR)$(BINDIR)/$(BIN)

install-man:
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@$(CP) -vf man/$(BIN).1 $(DESTDIR)$(MANDIR)/man1
	@chmod 644 $(DESTDIR)$(MANDIR)/man1/$(BIN).1

install-comp:
	@mkdir -p $(BASHCOMP_PATH)
	@$(CP) -vf completion/_$(BIN).bash $(BASHCOMP_PATH)/$(BIN)
	@chmod 644 $(BASHCOMP_PATH)/$(BIN)

install: install-bin install-man install-comp

uninstall:
	@rm -vrf \
		"$(DESTDIR)$(BINDIR)/$(BIN)" \
		"$(DESTDIR)$(MANDIR)/man1/$(BIN).1" \
		"$(BASHCOMP_PATH)/$(BIN)"
