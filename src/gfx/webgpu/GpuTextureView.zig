const webgpu = @import("../webgpu.zig");
const Id = webgpu.Id;

pub const GpuTextureView = struct {
    id: Id,

    pub fn init(id: Id) GpuTextureView {
        return GpuTextureView{
            .id = id,
        };
    }

    pub fn deinit(self: GpuTextureView) void {
        webgpu.remove(self.id);
    }
};
