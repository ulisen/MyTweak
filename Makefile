TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = Twitter
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = thsCrack

thsCrack_FILES = Tweak.x
thsCrack_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
