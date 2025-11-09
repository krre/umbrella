let wasm;
let context;

const objects = {};
let objectIdCounter = 0;

let gpuId = -1;
let adapterId = -1;
let deviceId = -1;

function nextObjectId() {
    return ++objectIdCounter;
}

async function init() {
    const gpu = navigator.gpu;

    if (!gpu) {
        console.log('GPU object not defined');
        return;
    }

    gpuId = nextObjectId();
    objects[gpuId] = gpu;

    const adapter = await gpu.requestAdapter();

    if (!adapter) {
        console.log('GPUAdapter object not defined');
        return;
    }

    adapterId = nextObjectId();
    objects[adapterId] = adapter;

    const device = await adapter.requestDevice();

    if (!device) {
        console.log('GPUDevice object not defined');
        return;
    }

    deviceId = nextObjectId();
    objects[deviceId] = device;

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
                return gpuId;
            },
            adapter: () => {
                return adapterId;
            },
            device: () => {
                return deviceId;
            }
        }
    };

    const wasm = await WebAssembly.instantiateStreaming(fetch("lib.wasm"), imports);
    wasm.instance.exports.start();
}

init();
