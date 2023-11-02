cmake_minimum_required(VERSION 3.10...3.27)

add_subdirectory(libfdt)

#set project name
project(dtc)

find_package(FLEX 2.6 REQUIRED)
find_package(BISON 3.0 REQUIRED)

set(PARSER_DIR "${CMAKE_CURRENT_BINARY_DIR}")
flex_target(LEXER "dtc-lexer.l" "${PARSER_DIR}/dtc-lexer.lex.c")
bison_target(PARSER "dtc-parser.y" "${PARSER_DIR}/dtc-parser.c" DEFINES_FILE "${PARSER_DIR}/dtc-parser.h")
add_flex_bison_dependency(LEXER PARSER)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror -Wno-sign-compare -Wno-missing-field-initializers -Wno-unused-parameter -DNO_YAML")

include_directories(. libfdt ${PARSER_DIR})

target_link_libraries(fdt)

add_executable(dtc-rpi checks.c data.c dtc.c flattree.c fstree.c livetree.c srcpos.c treesource.c util.c ${FLEX_LEXER_OUTPUTS} ${BISON_PARSER_OUTPUTS})
install(TARGETS dtc-rpi RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
