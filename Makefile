export TTYD_LABEL ?= local.ttyd.$(USER)
export TTYD_PORT ?= 7681 # ttyd default

export HOMEBREW_BIN := $(shell brew --prefix)/bin

TTYD_TEMPLATE := template.plist
TTYD_PLIST := $(HOME)/Library/LaunchAgents/$(TTYD_LABEL).plist
TTYD_URL := http://localhost:$(TTYD_PORT)

.PHONY: install
install: $(TTYD_PLIST) load list

.PHONY: uninstall
uninstall: unload
	rm -f $(TTYD_PLIST)

$(TTYD_PLIST): $(TTYD_TEMPLATE)
	envsubst < $< > $@

PLIST_COMMANDS = load unload
LABEL_COMMANDS = start stop list

.PHONY: $(PLIST_COMMANDS)
$(PLIST_COMMANDS):
	launchctl $@ $(TTYD_PLIST)

.PHONY: $(LABEL_COMMANDS)
$(LABEL_COMMANDS):
	launchctl $@ $(TTYD_LABEL)

.PHONY: open
open:
	open $(TTYD_URL)
