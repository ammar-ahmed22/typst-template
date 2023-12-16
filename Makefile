SRC_DIR = src
BUILD_DIR = build
SRC_FILE = document
OUT_FILE = output

all:
	typst compile ${SRC_DIR}/${SRC_FILE}.typ ${BUILD_DIR}/${OUT_FILE}.pdf --root ../


create-build:
	mkdir -p ${BUILD_DIR}

watch:
	typst watch ${SRC_DIR}/${SRC_FILE}.typ ${BUILD_DIR}/${OUT_FILE}.pdf --root ../