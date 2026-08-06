const js = @import("../../js.zig");
const Id = @import("angie3d").types.Id;

const Gpu = @This();

id: Id,

pub fn init() Gpu {
    return Gpu{
        .id = js.gpu(),
    };
}
