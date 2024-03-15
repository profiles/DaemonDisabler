ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DaemonDisabler

DaemonDisabler_FILES = Tweak.x
DaemonDisabler_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += daemondisablerprefs
SUBPROJECTS += launchctl_wrapper
include $(THEOS_MAKE_PATH)/aggregate.mk
