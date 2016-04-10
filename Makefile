TOOLCHAIN_VERSION=swift-DEVELOPMENT-SNAPSHOT-2016-03-24-a

SWIFTPM_DEVELOPMENT_DIRECTORY=$(HOME)/swift-package-manager
SWIFTPM_EXECUTIVE_DIRECTORY=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin

UTILITIES_BOOTSTRAP=Utilities/bootstrap
SWIFT_BUILD_TOOL=swift-build-tool
BUILD_DEBUG_DIRECTORY=.build/debug
SWIFT_BUILD=swift-build
SWIFT_TEST=swift-test

.PHONY: all swift-install swiftpm-rebuild swiftpm-test

all:
	@echo
	@echo "OVERVIEW: Unofficial development utilities for Swift"
	@echo
	@echo "USAGE: make [targets] [options <value>]"
	@echo
	@echo "TARGETS:"
	@echo "    swift-install      Download and install Swift from Swift.org."
	@echo "    swiftpm-rebuild    Rebuild the Swift Package Manager itself."
	@echo "    swiftpm-test       Test the Swift Package Manager itself after rebuilding."
	@echo
	@echo "OPTIONS:"
	@echo "    -C <your-directory>, --directory=<your-directory>"
	@echo "                       Change to <your-directory> before doing anything."
	@echo

swift-install:
	set -e
	curl -fO\# https://swift.org/builds/development/xcode/$(TOOLCHAIN_VERSION)/$(TOOLCHAIN_VERSION)-osx.pkg
	sudo installer -pkg $(TOOLCHAIN_VERSION)-osx.pkg -target /
	rm $(TOOLCHAIN_VERSION)-osx.pkg

swiftpm-rebuild: swiftpm-clean
	@echo
	@echo "Building..."
	$(SWIFTPM_DEVELOPMENT_DIRECTORY)/$(UTILITIES_BOOTSTRAP) --swiftc $(SWIFTPM_EXECUTIVE_DIRECTORY)/swiftc --sbt $(SWIFTPM_EXECUTIVE_DIRECTORY)/$(SWIFT_BUILD_TOOL)
	@echo
	@echo "Copying..."
	sudo cp -f $(SWIFTPM_DEVELOPMENT_DIRECTORY)/$(BUILD_DEBUG_DIRECTORY)/$(SWIFT_BUILD) $(SWIFTPM_EXECUTIVE_DIRECTORY)
	sudo cp -f $(SWIFTPM_DEVELOPMENT_DIRECTORY)/$(BUILD_DEBUG_DIRECTORY)/$(SWIFT_TEST) $(SWIFTPM_EXECUTIVE_DIRECTORY)

swiftpm-clean:
	@echo
	cd $(SWIFTPM_DEVELOPMENT_DIRECTORY)
	@echo
	@echo "Cleaning..."
	$(SWIFTPM_DEVELOPMENT_DIRECTORY)/$(UTILITIES_BOOTSTRAP) --swiftc $(SWIFTPM_EXECUTIVE_DIRECTORY)/swiftc --sbt $(SWIFTPM_EXECUTIVE_DIRECTORY)/$(SWIFT_BUILD_TOOL) clean

swiftpm-test: swiftpm-rebuild
	@echo
	@echo "Testing..."
	$(SWIFTPM_DEVELOPMENT_DIRECTORY)/$(UTILITIES_BOOTSTRAP) test
