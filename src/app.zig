const std = @import("std");
const Allocator = std.mem.Allocator;
const renderer = @import("renderer.zig");

var webgpu_renderer: renderer.Renderer = undefined;

pub fn start(allocator: Allocator) !void {
    _ = allocator;
    webgpu_renderer = renderer.Renderer.init();
}
