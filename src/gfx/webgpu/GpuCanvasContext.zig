const webgpu = @import("../webgpu.zig");
const GpuTexture = webgpu.GpuTexture;
const angie3d = @import("angie3d");
const js = angie3d.js;
const Id = angie3d.types.Id;

const GpuCanvasContext = @This();

id: Id,

pub fn init() GpuCanvasContext {
    return GpuCanvasContext{
        .id = js.canvasContext(),
    };
}

pub fn getCurrentTexture(self: GpuCanvasContext) GpuTexture {
    return GpuTexture.init(js.canvasContextGetCurrentTexture(self.id));
}
