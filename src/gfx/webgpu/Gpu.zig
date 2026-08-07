const angie3d = @import("angie3d");
const js = angie3d.js;
const Id = angie3d.types.Id;

const Gpu = @This();

id: Id,

pub fn init() Gpu {
    return Gpu{
        .id = js.gpu(),
    };
}
