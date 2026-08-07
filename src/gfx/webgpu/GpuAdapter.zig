const angie3d = @import("angie3d");
const js = angie3d.js;
const Id = angie3d.types.Id;

const GpuAdapter = @This();

id: Id,

pub fn init() GpuAdapter {
    return GpuAdapter{
        .id = js.adapter(),
    };
}
