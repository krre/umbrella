const webgpu = @import("../webgpu.zig");
const Id = webgpu.Id;

pub const GpuCommandBuffer = struct {
    id: Id,

    pub fn init(id: Id) GpuCommandBuffer {
        return GpuCommandBuffer{
            .id = id,
        };
    }

    pub fn deinit(self: GpuCommandBuffer) void {
        webgpu.remove(self.id);
    }
};
