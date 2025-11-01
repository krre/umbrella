async function init() {
    // const response = await fetch("lib.wasm");
    // const bytes = await response.arrayBuffer();

    // const { instance } = await WebAssembly.instantiate(bytes, {});
    // const exports = instance.exports;
    // console.log("exports", exports)

    // console.log("add(5, 7) =", exports.add(5, 7));

    // Используем память для вывода строки
    // const ptr = 0; // начало памяти
    // const len = exports.write_message(ptr);

    // const mem = new Uint8Array(exports.memory.buffer, ptr, len);
    // const text = new TextDecoder().decode(mem);
    // console.log("Message from Zig:", text);

    // document.getElementById("out").textContent = text;

    fetch('lib.wasm')
        .then(response => response.arrayBuffer())
        .then(bytes => WebAssembly.instantiate(bytes))
        .then(results => {
            const { add, } = results.instance.exports;
            console.log("2 + 3 =", add(2, 3));         // 5
        });
}

init();
