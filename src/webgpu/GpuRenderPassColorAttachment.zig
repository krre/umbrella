const webgpu = @import("../webgpu.zig");
const GpuLoadOp = webgpu.GpuLoadOp;
const GpuStoreOp = webgpu.GpuStoreOp;
const GpuTextureView = @import("GpuTextureView.zig").GpuTextureView;

extern fn renderPassColorAttachment(view: usize, load_op: u8, store_op: u8) usize;

pub const GpuRenderPassColorAttachment = struct {
    id: usize,
    view: GpuTextureView,
    load_op: GpuLoadOp,
    store_op: GpuStoreOp,

    pub fn init(view: GpuTextureView, load_op: GpuLoadOp, store_op: GpuStoreOp) GpuRenderPassColorAttachment {
        return GpuRenderPassColorAttachment{
            .id = renderPassColorAttachment(view.id, @intFromEnum(load_op), @intFromEnum(store_op)),
            .view = view,
            .load_op = load_op,
            .store_op = store_op,
        };
    }

    pub fn deinit(self: GpuRenderPassColorAttachment) void {
        webgpu.remove(self.id);
    }
};
