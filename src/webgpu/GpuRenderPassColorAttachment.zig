const webgpu = @import("../webgpu.zig");
const GpuColor = webgpu.GpuColor;
const GpuLoadOp = webgpu.GpuLoadOp;
const GpuStoreOp = webgpu.GpuStoreOp;
const GpuTextureView = @import("GpuTextureView.zig").GpuTextureView;

extern fn renderPassColorAttachment(view: usize, load_op: u8, store_op: u8, color_value: usize) usize;

pub const GpuRenderPassColorAttachment = struct {
    id: usize,
    view: GpuTextureView,
    load_op: GpuLoadOp,
    store_op: GpuStoreOp,
    clear_value: ?GpuColor,

    pub fn init(view: GpuTextureView, load_op: GpuLoadOp, store_op: GpuStoreOp, clear_value: ?GpuColor) GpuRenderPassColorAttachment {
        var color_id: usize = 0;

        if (clear_value) |value| {
            color_id = value.id;
        }

        return GpuRenderPassColorAttachment{
            .id = renderPassColorAttachment(view.id, @intFromEnum(load_op), @intFromEnum(store_op), color_id),
            .view = view,
            .load_op = load_op,
            .store_op = store_op,
            .clear_value = clear_value,
        };
    }

    pub fn deinit(self: GpuRenderPassColorAttachment) void {
        webgpu.remove(self.id);

        if (self.clear_value != null) {
            self.clear_value.?.deinit();
        }
    }
};
