const webgpu = @import("../webgpu.zig");
const Id = webgpu.Id;

pub const GpuRenderPassEncoder = struct {
    id: Id,

    pub fn init(id: Id) GpuRenderPassEncoder {
        return GpuRenderPassEncoder{
            .id = id,
        };
    }

    pub fn deinit(self: GpuRenderPassEncoder) void {
        webgpu.remove(self.id);
    }
};
