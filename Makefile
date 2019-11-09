TARGET			= rczi
INSTALL_DIR		= $(PREFIX)/usr/share/plymouth/themes

FILES			= $(wildcard *.png) $(TARGET).script $(TARGET).plymouth $(TARGET).grub
INSTALL_FILES	= $(addprefix $(INSTALL_DIR)/$(TARGET)/,$(FILES))

.PHONY: all install uninstall

all:

install: $(INSTALL_DIR)/$(TARGET) $(INSTALL_FILES)

uninstall:
	rm -f $(INSTALL_DIR)/$(TARGET)
	
install-alternative:
	update-alternatives --install $(INSTALL_DIR)/default.plymouth default.plymouth $(INSTALL_DIR)/$(TARGET)/$(TARGET).plymouth 150 --slave $(INSTALL_DIR)/default.grub default.plymouth.grub $(INSTALL_DIR)/$(TARGET)/$(TARGET).grub
	
set-alternative:
	update-alternatives --set default.plymouth $(INSTALL_DIR)/$(TARGET)/$(TARGET).plymouth

remove-alternative:
	update-alternatives --remove default.plymouth $(INSTALL_DIR)/$(TARGET)/$(TARGET).plymouth

### Files ======================================================================

$(INSTALL_DIR)/$(TARGET):
	mkdir -p $(INSTALL_DIR)/$(TARGET)

$(INSTALL_DIR)/$(TARGET)/%: %
	cp -f $^ $@

