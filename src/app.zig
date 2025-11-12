const std = @import("std");
const Allocator = std.mem.Allocator;
const Renderer = @import("Renderer.zig").Renderer;

var renderer: Renderer = undefined;

pub fn start(allocator: Allocator) !void {
    _ = allocator;
    renderer = Renderer.init();
    renderer.clear();
}
