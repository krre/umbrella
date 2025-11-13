const webgpu = @import("../webgpu.zig");
const Id = webgpu.Id;

extern fn adapter() Id;

pub const GpuAdapter = struct {
    id: Id,

    pub fn init() GpuAdapter {
        return GpuAdapter{
            .id = adapter(),
        };
    }
};
