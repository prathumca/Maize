include $(THEOS)/makefiles/common.mk

ifeq ($(SIMULATOR),1)
	export TARGET = simulator:clang:latest:7.0
	export ARCHS = x86_64
else
	export TARGET = iphone:latest:7.0
	export ARCHS = armv7 arm64
endif

MaizeUI_CFLAGS = -fobjc-arc -I../headers -I../

FRAMEWORK_NAME = MaizeUI
# MaizeUI_PUBLIC_HEADERS = $(wildcard *.h)
MaizeUI_FILES = $(wildcard BinPack/*.mm) $(wildcard *.mm) $(wildcard *.m)
MaizeUI_INSTALL_PATH = /Library/Frameworks
MaizeUI_EXTRA_FRAMEWORKS = MaizeServices
MaizeUI_LDFLAGS = -F../.theos/$(THEOS_OBJ_DIR_NAME)
MaizeUI_LIBRARIES = flipswitch

include $(THEOS_MAKE_PATH)/framework.mk
