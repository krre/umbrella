const webgpu = @import("../webgpu.zig");
const GpuRenderPassColorAttachment = webgpu.GpuRenderPassColorAttachment;
const js = @import("../../js.zig");
const Id = @import("angie3d").types.Id;

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
