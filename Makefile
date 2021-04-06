TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = THS
ARCHS =armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = THSHelper

THSHelper_FILES = Tweak.x
THSHelper_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
