const js = @import("../../js.zig");
const Id = @import("../../types.zig").Id;

pub const GpuAdapter = struct {
    id: Id,

    pub fn init() GpuAdapter {
        return GpuAdapter{
            .id = js.adapter(),
        };
    }
};
