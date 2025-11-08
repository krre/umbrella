let wasm;
let context;

async function init() {
    const adapter = await navigator.gpu?.requestAdapter();
    const device = await adapter?.requestDevice();

    if (!device) {
        console.log('Browser does not supports WebGPU');
        return;
    }

    const canvas = document.querySelector('canvas');
    context = canvas.getContext('webgpu');
    const presentationFormat = navigator.gpu.getPreferredCanvasFormat();

    context.configure({
        device,
        format: presentationFormat,
    });

    console.log("context", context)

    const imports = {
        env: {
            console_log: (ptr, len) => {
                const bytes = new Uint8Array(wasm.instance.exports.memory.buffer, ptr, len);
                console.log(new TextDecoder("utf8").decode(bytes));
            },
            gpu: () => {
                return 42
            }
        }
    };

    const wasm = await WebAssembly.instantiateStreaming(fetch("lib.wasm"), imports);
    wasm.instance.exports.start();
}

init();
