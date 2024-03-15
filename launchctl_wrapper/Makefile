include $(THEOS)/makefiles/common.mk

ARCHS = arm64 arm64e

TOOL_NAME = launchctl_wrapper

launchctl_wrapper_FILES = main.m
launchctl_wrapper_CFLAGS = -fobjc-arc
launchctl_wrapper_INSTALL_PATH = /usr/libexec
launchctl_wrapper_CODESIGN_FLAGS = -S../layout/DEBIAN/ent

include $(THEOS_MAKE_PATH)/tool.mk
