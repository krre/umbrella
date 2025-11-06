WEB_DIR=web

all: build run

build:
	zig build

run:
	cd $(WEB_DIR) && python3 -m http.server 8000 --bind 127.0.0.1

wat: build
	cd $(WEB_DIR) && wasm2wat lib.wasm -o lib.wat

clean:
	cd $(WEB_DIR) && rm -f lib.wasm && rm -f lib.wat

.PHONY: all build run wat clean
