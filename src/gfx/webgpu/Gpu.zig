const webgpu = @import("../webgpu.zig");
const Id = webgpu.Id;

extern fn gpu() Id;

pub const Gpu = struct {
    id: Id,

    pub fn init() Gpu {
        return Gpu{
            .id = gpu(),
        };
    }
};
