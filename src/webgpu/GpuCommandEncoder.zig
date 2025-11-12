const webgpu = @import("../webgpu.zig");
const Id = webgpu.Id;

pub const GpuCommandEncoder = struct {
    id: Id,

    pub fn init(id: Id) GpuCommandEncoder {
        return GpuCommandEncoder{
            .id = id,
        };
    }

    pub fn deinit(self: GpuCommandEncoder) void {
        webgpu.remove(self.id);
    }
};
