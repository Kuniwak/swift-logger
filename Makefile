SCHEME := swift-logger
SCRIPTS_PATH := Scripts
XCODEBUILD_SCRIPTS_PATH := ${SCRIPTS_PATH}/xcodebuild-scripts

.PHONY: all
all: clean test

Logs:
	mkdir Logs

.PHONY: test
test: test-macOS test-iOS test-watchOS test-tvOS test-visionOS

.PHONY: test-macOS
test-macOS:
	# ====== Test on macOS ======
	swift test

.PHONY: test-iOS
test-iOS: Logs
	# ====== Test on iOS ======
	"${XCODEBUILD_SCRIPTS_PATH}/test" "${SCHEME}" "iOS-17-" "iPhone " "Logs/xcodebuild-test-iOS.log" "build/junit-iOS.xml"

.PHONY: test-watchOS
test-watchOS: Logs
	# ====== Test on watchOS ======
	"${XCODEBUILD_SCRIPTS_PATH}/test" "${SCHEME}" "watchOS-10-" "Apple Watch " "Logs/xcodebuild-test-watchOS.log" "build/junit-watchOS.xml"

.PHONY: test-tvOS
test-tvOS: Logs
	# ====== Test on tvOS ======
	"${XCODEBUILD_SCRIPTS_PATH}/test" "${SCHEME}" "tvOS-17-" "Apple TV " "Logs/xcodebuild-test-tvOS.log" "build/junit-tvOS.xml"

.PHONY: test-visionOS
test-visionOS: Logs
	# ====== Test on visionOS ======
	"${XCODEBUILD_SCRIPTS_PATH}/test" "${SCHEME}" "xrOS-1-" "Apple Vision Pro " "Logs/xcodebuild-test-visionOS.log" "build/junit-visionOS.xml"

.PHONY: clean
clean:
	git clean -fdx
