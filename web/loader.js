let wasm;

async function init() {
    const imports = {
        env: {
            console_log: (ptr, len) => {
                const bytes = new Uint8Array(wasm.instance.exports.memory.buffer, ptr, len);
                console.log(new TextDecoder("utf8").decode(bytes));
            }
        }
    };

    const wasm = await WebAssembly.instantiateStreaming(fetch("lib.wasm"), imports);
    console.log("start() =", wasm.instance.exports.start());
}

init();
