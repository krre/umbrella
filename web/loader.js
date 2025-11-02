let instance;

function console_log(location, size) {
    var buffer = new Uint8Array(instance.exports.memory.buffer, location, size);
    var decoder = new TextDecoder();
    var string = decoder.decode(buffer);
    console.log(string);
}

async function init() {
    const response = await fetch("lib.wasm");
    const bytes = await response.arrayBuffer();

    const imports = {
        env: {
            memory: new WebAssembly.Memory({ initial: 1 }),
            console_log: console_log,
        }
    };

    const source = await WebAssembly.instantiate(bytes, imports);
    instance = source.instance
    const exports = instance.exports;
    console.log("start() =", exports.start());
}

init();
