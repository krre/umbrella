let wasm;

const objects = {};
let objectIdCounter = 0;

let gpuId = -1;
let adapterId = -1;
let deviceId = -1;
let canvasContextId = -1;

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

    if (!canvas) {
        console.log('Canvas not found');
        return;
    }

    const canvasContext = canvas.getContext('webgpu');

    if (!canvasContext) {
        console.log('GPUCanvasContext object not defined');
        return;
    }

    canvasContextId = nextObjectId();
    objects[canvasContextId] = canvasContext;

    const presentationFormat = navigator.gpu.getPreferredCanvasFormat();

    canvasContext.configure({
        device,
        format: presentationFormat,
    });

    const imports = {
        env: {
            consoleLog: (ptr, len) => {
                const bytes = new Uint8Array(wasm.instance.exports.memory.buffer, ptr, len);
                console.log(new TextDecoder("utf8").decode(bytes));
            },
            destroy: (id) => {
                objects[id].destroy()
                delete objects[id]
            },
            remove: (id) => {
                delete objects[id]
            },
            gpu: () => {
                return gpuId;
            },
            adapter: () => {
                return adapterId;
            },
            device: () => {
                return deviceId;
            },
            canvasContext: () => {
                return canvasContextId;
            },
            canvasContextGetCurrentTexture: (id) => {
                const canvasContext = objects[id];
                const texture = canvasContext.getCurrentTexture();
                const textureId = nextObjectId();
                objects[textureId] = texture;
                return textureId;
            },
            textureCreateView: (id) => {
                const texture = objects[id];
                const textureView = texture.createView();
                const textureViewId = nextObjectId();
                objects[textureViewId] = textureView;
                return textureViewId;
            },
        }
    };

    const wasm = await WebAssembly.instantiateStreaming(fetch("lib.wasm"), imports);
    wasm.instance.exports.start();
}

init();
