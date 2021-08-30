SUMMARY = "A console-only image implementing a fleet monitoring \
proof of concept using fluentbit."

LICENSE = "MIT"

inherit core-image

CORE_IMAGE_EXTRA_INSTALL += " fluent-bit "
