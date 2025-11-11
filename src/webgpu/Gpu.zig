const Id = @import("../types.zig").Id;

extern fn gpu() Id;

pub const Gpu = struct {
    id: Id,

    pub fn init() Gpu {
        return Gpu{
            .id = gpu(),
        };
    }
};
