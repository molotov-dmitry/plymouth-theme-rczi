TARGET			= rczi
INSTALL_DIR		= $(PREFIX)/usr/share/plymouth/themes

FILES			= $(wildcard *.png) $(TARGET).script $(TARGET).plymouth
INSTALL_FILES	= $(addprefix $(INSTALL_DIR)/$(TARGET)/,$(FILES))

.PHONY: all install uninstall

all:

install: $(INSTALL_DIR)/$(TARGET) $(INSTALL_FILES)

uninstall:
	rm -f $(INSTALL_DIR)/$(TARGET)

### Files ======================================================================

$(INSTALL_DIR)/$(TARGET):
	mkdir -p $(INSTALL_DIR)/$(TARGET)

$(INSTALL_DIR)/$(TARGET)/%: %
	cp -f $^ $@

