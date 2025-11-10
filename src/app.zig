const std = @import("std");
const Allocator = std.mem.Allocator;
const console = @import("console.zig");
const renderer = @import("renderer.zig");

var webgpu_renderer: *renderer.Renderer = undefined;

pub fn start(allocator: Allocator) !void {
    webgpu_renderer = try renderer.Renderer.init(allocator);
}
