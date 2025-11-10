const std = @import("std");
const Allocator = std.mem.Allocator;
const console = @import("console.zig");
const gpu = @import("webgpu/gpu.zig");
const adapter = @import("webgpu/adapter.zig");
const device = @import("webgpu/device.zig");
const canvas_context = @import("webgpu/canvas_context.zig");

pub const Renderer = struct {
    gpu: *gpu.Gpu,
    adapter: *adapter.GpuAdapter,
    device: *device.GpuDevice,
    canvas_context: *canvas_context.GpuCanvasContext,

    pub fn init(allocator: Allocator) !*Renderer {
        const result = try allocator.create(Renderer);

        result.gpu = try gpu.Gpu.init(allocator);
        try console.fmtLog(allocator, "GPU id: {d}", .{result.gpu.id});

        result.adapter = try adapter.GpuAdapter.init(allocator);
        try console.fmtLog(allocator, "GPUAdapter id: {d}", .{result.adapter.id});

        result.device = try device.GpuDevice.init(allocator);
        try console.fmtLog(allocator, "GPUDevice id: {d}", .{result.device.id});

        result.canvas_context = try canvas_context.GpuCanvasContext.init(allocator);
        try console.fmtLog(allocator, "GpuCanvasContext id: {d}", .{result.canvas_context.id});

        return result;
    }
};
