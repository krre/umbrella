const Id = @import("../types.zig").Id;

extern fn adapter() Id;

pub const GpuAdapter = struct {
    id: Id,

    pub fn init() GpuAdapter {
        return GpuAdapter{
            .id = adapter(),
        };
    }
};
