const std = @import("std");
const Allocator = std.mem.Allocator;
const console = @import("console.zig");
const gpu = @import("webgpu/gpu.zig");

pub fn start(allocator: Allocator) !void {
    console.log("Application started");
    const webgpu = try gpu.Gpu.init(allocator);
    try console.fmtLog(allocator, "GPU id: {d}", .{webgpu.id});
}
