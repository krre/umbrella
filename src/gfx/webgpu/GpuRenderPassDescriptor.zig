const webgpu = @import("../webgpu.zig");
const GpuRenderPassColorAttachment = webgpu.GpuRenderPassColorAttachment;
const angie3d = @import("angie3d");
const js = angie3d.js;
const Id = angie3d.types.Id;

const GpuRenderPassDescriptor = @This();

const max_attachments = 8;

id: Id,

pub fn init() GpuRenderPassDescriptor {
    return GpuRenderPassDescriptor{
        .id = js.renderPassDescriptor(),
    };
}

pub fn deinit(self: GpuRenderPassDescriptor) void {
    js.remove(self.id);
}

pub fn addColorAttachment(self: GpuRenderPassDescriptor, attachment: GpuRenderPassColorAttachment) void {
    js.addRenderPassColorAttachment(self.id, attachment.id);
}
