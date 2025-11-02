async function init() {
    const response = await fetch("lib.wasm");
    const bytes = await response.arrayBuffer();

    const { instance } = await WebAssembly.instantiate(bytes, {});
    const exports = instance.exports;
    console.log("start() =", exports.start());
}

init();
