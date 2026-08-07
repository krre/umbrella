const angie3d = @import("angie3d");
const js = angie3d.js;
const Id = angie3d.types.Id;

const GpuTextureView = @This();

id: Id,

pub fn init(id: Id) GpuTextureView {
    return GpuTextureView{
        .id = id,
    };
}

pub fn deinit(self: GpuTextureView) void {
    js.remove(self.id);
}
