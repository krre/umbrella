const Id = @import("../types.zig").Id;

extern fn device() Id;

pub const GpuDevice = struct {
    id: Id,

    pub fn init() GpuDevice {
        return GpuDevice{
            .id = device(),
        };
    }
};
