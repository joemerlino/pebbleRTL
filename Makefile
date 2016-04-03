include theos/makefiles/common.mk

TWEAK_NAME = PebbleRTL
PebbleRTL_FILES = Tweak.xm bidi.mm logging.mm
PebbleRTL_FRAMEWORKS = UIKit CoreBluetooth CoreFoundation Foundation
PebbleRTL_LIBRARIES = icucore
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "launchctl stop com.apple.BTLEServer; sleep 5; killall -9 BTLEServer; launchctl start com.apple.BTLEServer"
	#install.exec "reboot"
