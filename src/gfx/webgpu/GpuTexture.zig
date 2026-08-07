const webgpu = @import("../webgpu.zig");
const GpuTextureView = webgpu.GpuTextureView;
const angie3d = @import("angie3d");
const js = angie3d.js;
const Id = angie3d.types.Id;

const GpuTexture = @This();

id: Id,

pub fn init(id: Id) GpuTexture {
    return GpuTexture{
        .id = id,
    };
}

pub fn deinit(self: GpuTexture) void {
    js.destroy(self.id);
}

pub fn createView(self: GpuTexture) GpuTextureView {
    return GpuTextureView.init(js.textureCreateView(self.id));
}
