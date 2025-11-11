const webgpu = @import("../webgpu.zig");

pub const GpuTextureView = struct {
    id: usize,

    pub fn init(id: usize) GpuTextureView {
        return GpuTextureView{
            .id = id,
        };
    }

    pub fn deinit(self: GpuTextureView) void {
        webgpu.remove(self.id);
    }
};
