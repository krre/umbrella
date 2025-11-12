pub const Gpu = @import("webgpu/Gpu.zig").Gpu;
pub const GpuAdapter = @import("webgpu/GpuAdapter.zig").GpuAdapter;
pub const GpuCanvasContext = @import("webgpu/GpuCanvasContext.zig").GpuCanvasContext;
pub const GpuColor = @import("webgpu/GpuColor.zig").GpuColor;
pub const GpuCommandBuffer = @import("webgpu/GpuCommandBuffer.zig").GpuCommandBuffer;
pub const GpuCommandEncoder = @import("webgpu/GpuCommandEncoder.zig").GpuCommandEncoder;
pub const GpuDevice = @import("webgpu/GpuDevice.zig").GpuDevice;
pub const GpuRenderPassColorAttachment = @import("webgpu/GpuRenderPassColorAttachment.zig").GpuRenderPassColorAttachment;
pub const GpuRenderPassEncoder = @import("webgpu/GpuRenderPassEncoder.zig").GpuRenderPassEncoder;
pub const GpuRenderPassDescriptor = @import("webgpu/GpuRenderPassDescriptor.zig").GpuRenderPassDescriptor;
pub const GpuTexture = @import("webgpu/GpuTexture.zig").GpuTexture;
pub const GpuTextureView = @import("webgpu/GpuTextureView.zig").GpuTextureView;
pub const Id = @import("types.zig").Id;

pub const GpuLoadOp = enum {
    load,
    clear,
};

pub const GpuStoreOp = enum {
    store,
    discard,
};

pub extern fn destroy(id: Id) void;
pub extern fn remove(id: Id) void;
