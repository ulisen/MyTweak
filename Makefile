TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = Twitter
ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FleetsBGone

FleetsBGone_FILES = Tweak.x
FleetsBGone_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
