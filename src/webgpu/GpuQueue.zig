const webgpu = @import("../webgpu.zig");
const Id = webgpu.Id;

pub const GpuQueue = struct {
    id: Id,

    pub fn init(id: Id) GpuQueue {
        return GpuQueue{
            .id = id,
        };
    }

    pub fn deinit(self: GpuQueue) void {
        webgpu.remove(self.id);
    }
};
