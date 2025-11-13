const webgpu = @import("../webgpu.zig");
const GpuRenderPassEncoder = webgpu.GpuRenderPassEncoder;
const GpuRenderPassDescriptor = webgpu.GpuRenderPassDescriptor;
const GpuCommandBuffer = webgpu.GpuCommandBuffer;
const Id = webgpu.Id;

extern fn commandEncoderBeginRenderPass(id: Id, descriptor_id: Id) Id;
extern fn commandEncoderFinish(id: Id) Id;

pub const GpuCommandEncoder = struct {
    id: Id,

    pub fn init(id: Id) GpuCommandEncoder {
        return GpuCommandEncoder{
            .id = id,
        };
    }

    pub fn deinit(self: GpuCommandEncoder) void {
        webgpu.remove(self.id);
    }

    pub fn beginRenderPass(self: GpuCommandEncoder, descriptor: GpuRenderPassDescriptor) GpuRenderPassEncoder {
        return GpuRenderPassEncoder.init(commandEncoderBeginRenderPass(self.id, descriptor.id));
    }

    pub fn finish(self: GpuCommandEncoder) GpuCommandBuffer {
        return GpuCommandBuffer.init(commandEncoderFinish(self.id));
    }
};
