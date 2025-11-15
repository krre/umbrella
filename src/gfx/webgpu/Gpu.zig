const js = @import("../../js.zig");
const Id = @import("../../types.zig").Id;

pub const Gpu = struct {
    id: Id,

    pub fn init() Gpu {
        return Gpu{
            .id = js.gpu(),
        };
    }
};
