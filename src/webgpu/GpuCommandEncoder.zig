const webgpu = @import("../webgpu.zig");
const GpuRenderPassEncoder = webgpu.GpuRenderPassEncoder;
const GpuRenderPassDescriptor = webgpu.GpuRenderPassDescriptor;
const Id = webgpu.Id;

extern fn commandEncoderBeginRenderPass(id: Id, descriptor_id: Id) Id;

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
};
