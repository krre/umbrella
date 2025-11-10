const gpu = @import("webgpu/gpu.zig");
const adapter = @import("webgpu/adapter.zig");
const device = @import("webgpu/device.zig");
const canvas_context = @import("webgpu/canvas_context.zig");

pub const Renderer = struct {
    gpu: gpu.Gpu,
    adapter: adapter.GpuAdapter,
    device: device.GpuDevice,
    canvas_context: canvas_context.GpuCanvasContext,

    pub fn init() Renderer {
        return Renderer{
            .gpu = gpu.Gpu.init(),
            .adapter = adapter.GpuAdapter.init(),
            .device = device.GpuDevice.init(),
            .canvas_context = canvas_context.GpuCanvasContext.init(),
        };
    }
};
