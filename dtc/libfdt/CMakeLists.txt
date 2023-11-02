cmake_minimum_required(VERSION 3.10...3.27)

#set project name
project(fdt)

include_directories(.)

add_library(fdt fdt.c fdt_addresses.c fdt_check.c fdt_empty_tree.c fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c fdt_wip.c)
INSTALL(FILES)
