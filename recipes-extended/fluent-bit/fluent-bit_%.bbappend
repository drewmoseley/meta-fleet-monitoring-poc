# 
# POC config files for fluent-bit
#
FLEET_SERVER_URI ?= "example.com"

SRC_URI += " \
    file://fluent-bit.conf \
    file://input_disk.conf \
    file://input_klogs.conf \
    file://input_net.conf \
    file://input_thermal.conf \
    file://plugins.conf \
    file://input_cpu.conf \
    file://input_mem.conf \
    file://input_osinfo.conf \
    file://parsers.conf \
"

do_install_append() {
    install -d -m 0755 ${D}${sysconfdir}/fluent-bit
    install -m 0644 ${WORKDIR}/*.conf ${D}${sysconfdir}/fluent-bit
    sed -i -e 's/@FLEET_SERVER_URI@/${FLEET_SERVER_URI}/g' ${D}${sysconfdir}/fluent-bit/*.conf
}

SYSTEMD_AUTO_ENABLE = "enable"
