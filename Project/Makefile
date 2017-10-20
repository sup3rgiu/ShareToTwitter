ARCHS = armv7 arm64
include theos/makefiles/common.mk

TWEAK_NAME = AutoFollow
AutoFollow_FILES = AutoFollow.xm
AutoFollow_FRAMEWORKS = UIKit Accounts Social
AutoFollow_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
install.exec "killall -9 '-'"