const webgpu = @import("../webgpu.zig");
const GpuRenderPassEncoder = webgpu.GpuRenderPassEncoder;
const GpuRenderPassDescriptor = webgpu.GpuRenderPassDescriptor;
const GpuCommandBuffer = webgpu.GpuCommandBuffer;
const angie3d = @import("angie3d");
const js = angie3d.js;
const Id = angie3d.types.Id;

const GpuCommandEncoder = @This();

id: Id,

pub fn init(id: Id) GpuCommandEncoder {
    return GpuCommandEncoder{
        .id = id,
    };
}

pub fn deinit(self: GpuCommandEncoder) void {
    js.remove(self.id);
}

pub fn beginRenderPass(self: GpuCommandEncoder, descriptor: GpuRenderPassDescriptor) GpuRenderPassEncoder {
    return GpuRenderPassEncoder.init(js.commandEncoderBeginRenderPass(self.id, descriptor.id));
}

pub fn finish(self: GpuCommandEncoder) GpuCommandBuffer {
    return GpuCommandBuffer.init(js.commandEncoderFinish(self.id));
}
