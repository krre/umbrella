const angie3d = @import("angie3d");
const js = angie3d.js;
const Id = angie3d.types.Id;

const GpuRenderPassEncoder = @This();

id: Id,

pub fn init(id: Id) GpuRenderPassEncoder {
    return GpuRenderPassEncoder{
        .id = id,
    };
}

pub fn deinit(self: GpuRenderPassEncoder) void {
    js.remove(self.id);
}

pub fn end(self: GpuRenderPassEncoder) void {
    js.renderPassEnd(self.id);
}
