const std = @import("std");
const Allocator = std.mem.Allocator;
const console = @import("console.zig");
const renderer = @import("renderer.zig");

pub fn start(allocator: Allocator) !void {
    const webgpu_renderer = try renderer.Renderer.init(allocator);
    _ = webgpu_renderer;
}
