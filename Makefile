ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0

PACKAGE_NAME = com.hajan.767telegram
TWEAK_NAME = 767Telegram
767Telegram_FILES = Tweak.x
767Telegram_FRAMEWORKS = UIKit Foundation
767Telegram_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
