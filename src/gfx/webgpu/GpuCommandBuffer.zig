const angie3d = @import("angie3d");
const js = angie3d.js;
const Id = angie3d.types.Id;

const GpuCommandBuffer = @This();

id: Id,

pub fn init(id: Id) GpuCommandBuffer {
    return GpuCommandBuffer{
        .id = id,
    };
}

pub fn deinit(self: GpuCommandBuffer) void {
    js.remove(self.id);
}
