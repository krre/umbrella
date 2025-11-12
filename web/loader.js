let wasm;

const objects = {};
let objectIdCounter = 0;

let gpuId = -1;
let adapterId = -1;
let deviceId = -1;
let canvasContextId = -1;

const loadOps = ["load", "clear"];
const storeOps = ["store", "discard"];

function nextObjectId() {
    return ++objectIdCounter;
}

function saveObject(object) {
    const id = nextObjectId();
    objects[id] = object;
    return id;
}

async function init() {
    const gpu = navigator.gpu;

    if (!gpu) {
        console.error('User agent doesn’t support WebGPU');
        return;
    }

    gpuId = saveObject(gpu);

    const adapter = await gpu.requestAdapter();

    if (!adapter) {
        console.error('No WebGPU adapters found');
        return;
    }

    adapterId = saveObject(adapter);

    const device = await adapter.requestDevice();
    deviceId = saveObject(device);

    const canvas = document.querySelector('canvas');

    if (!canvas) {
        console.error('Canvas not found');
        return;
    }

    const canvasContext = canvas.getContext('webgpu');

    if (!canvasContext) {
        console.error('GPUCanvasContext object not defined');
        return;
    }

    canvasContextId = saveObject(canvasContext);

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
            canvasContextGetCurrentTexture: (canvasContextId) => {
                const canvasContext = objects[canvasContextId];
                const texture = canvasContext.getCurrentTexture();
                return saveObject(texture);
            },
            textureCreateView: (textureId) => {
                const texture = objects[textureId];
                const textureView = texture.createView();
                return saveObject(textureView);
            },
            renderPassColorAttachment: (textureViewId, loadOp, storeOp, colorId) => {
                const textureView = objects[textureViewId];
                const colorAttachment = {
                    view: textureView,
                    loadOp: loadOps[loadOp],
                    storeOp: storeOps[storeOp],
                    clearValue: objects[colorId]
                };
                return saveObject(colorAttachment);
            },
            color: (r, g, b, a) => {
                const color = {
                    r: r,
                    g: g,
                    b: b,
                    a: a
                };
                return saveObject(color);
            },
            renderPassDescriptor: () => {
                const descriptor = {
                    colorAttachments: []
                };
                return saveObject(descriptor);
            },
            addRenderPassColorAttachment: (descriptorId, attachmentId) => {
                const renderPassDescriptor = objects[descriptorId];
                const renderPassColorAttachment = objects[attachmentId];
                renderPassDescriptor.colorAttachments.push(renderPassColorAttachment);
            },
            deviceCreateCommandEncoder: (deviceId) => {
                const device = objects[deviceId];
                const encoder = device.createCommandEncoder();
                return saveObject(encoder);
            },
            commandEncoderBeginRenderPass: (commandEncoderId, descriptorId) => {
                const commandEncoder = objects[commandEncoderId];
                const descriptor = objects[descriptorId];
                const renderPassEncoder = commandEncoder.beginRenderPass(descriptor);
                return saveObject(renderPassEncoder);
            },
            renderPassEnd: (renderPassId) => {
                const renderPass = objects[renderPassId];
                renderPass.end();
            }
        }
    };

    const wasm = await WebAssembly.instantiateStreaming(fetch("lib.wasm"), imports);
    wasm.instance.exports.start();
}

init();
