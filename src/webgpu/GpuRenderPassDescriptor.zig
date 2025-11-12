const webgpu = @import("../webgpu.zig");
const GpuRenderPassColorAttachment = webgpu.GpuRenderPassColorAttachment;
const Id = webgpu.Id;

const max_attachments = 8;

extern fn renderPassDescriptor() Id;

pub const GpuRenderPassDescriptor = struct {
    id: Id,

    pub fn init() GpuRenderPassDescriptor {
        return GpuRenderPassDescriptor{
            .id = renderPassDescriptor(),
        };
    }

    pub fn deinit(self: GpuRenderPassDescriptor) void {
        webgpu.remove(self.id);
    }
};
