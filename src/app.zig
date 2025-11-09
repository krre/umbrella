const std = @import("std");
const Allocator = std.mem.Allocator;
const console = @import("console.zig");
const gpu = @import("webgpu/gpu.zig");
const adapter = @import("webgpu/adapter.zig");
const device = @import("webgpu/device.zig");

pub fn start(allocator: Allocator) !void {
    const webgpu = try gpu.Gpu.init(allocator);
    try console.fmtLog(allocator, "GPU id: {d}", .{webgpu.id});

    const gpu_adapter = try adapter.GpuAdapter.init(allocator);
    try console.fmtLog(allocator, "GPUAdapter id: {d}", .{gpu_adapter.id});

    const gpu_device = try device.GpuDevice.init(allocator);
    try console.fmtLog(allocator, "GPUDevice id: {d}", .{gpu_device.id});
}
