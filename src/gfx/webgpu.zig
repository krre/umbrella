pub const Gpu = @import("webgpu/Gpu.zig");
pub const GpuAdapter = @import("webgpu/GpuAdapter.zig");
pub const GpuCanvasContext = @import("webgpu/GpuCanvasContext.zig");
pub const GpuColor = @import("webgpu/GpuColor.zig");
pub const GpuCommandBuffer = @import("webgpu/GpuCommandBuffer.zig");
pub const GpuCommandEncoder = @import("webgpu/GpuCommandEncoder.zig");
pub const GpuDevice = @import("webgpu/GpuDevice.zig");
pub const GpuQueue = @import("webgpu/GpuQueue.zig");
pub const GpuRenderPassColorAttachment = @import("webgpu/GpuRenderPassColorAttachment.zig");
pub const GpuRenderPassEncoder = @import("webgpu/GpuRenderPassEncoder.zig");
pub const GpuRenderPassDescriptor = @import("webgpu/GpuRenderPassDescriptor.zig");
pub const GpuTexture = @import("webgpu/GpuTexture.zig");
pub const GpuTextureView = @import("webgpu/GpuTextureView.zig");
pub const Id = @import("../types.zig").Id;

pub const GpuLoadOp = enum {
    load,
    clear,
};

pub const GpuStoreOp = enum {
    store,
    discard,
};
