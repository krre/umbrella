const webgpu = @import("webgpu.zig");
const Gpu = webgpu.Gpu;
const GpuAdapter = webgpu.GpuAdapter;
const GpuColor = webgpu.GpuColor;
const GpuDevice = webgpu.GpuDevice;
const GpuRenderPassColorAttachment = webgpu.GpuRenderPassColorAttachment;
const GpuCanvasContext = webgpu.GpuCanvasContext;

const GpuLoadOp = webgpu.GpuLoadOp;
const GpuStoreOp = webgpu.GpuStoreOp;

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

        const color = GpuColor.init(1.0, 0.0, 0.0, 1.0);

        const color_attachment = GpuRenderPassColorAttachment.init(texture_view, GpuLoadOp.clear, GpuStoreOp.store, color);
        defer color_attachment.deinit();
    }
};
