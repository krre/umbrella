const webgpu = @import("webgpu.zig");
const Gpu = webgpu.Gpu;
const GpuAdapter = webgpu.GpuAdapter;
const GpuDevice = webgpu.GpuDevice;
const GpuCanvasContext = webgpu.GpuCanvasContext;

pub const Renderer = struct {
    gpu: Gpu,
    adapter: GpuAdapter,
    device: GpuDevice,
    canvas_context: GpuCanvasContext,

    pub fn init() Renderer {
        return Renderer{
            .gpu = Gpu.init(),
            .adapter = GpuAdapter.init(),
            .device = GpuDevice.init(),
            .canvas_context = GpuCanvasContext.init(),
        };
    }

    pub fn clear(self: *Renderer) void {
        const texture = self.canvas_context.getCurrentTexture();
        defer texture.deinit();

        const texture_view = texture.createView();
        defer texture_view.deinit();
    }
};
