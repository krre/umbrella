const std = @import("std");
const Allocator = std.mem.Allocator;
const Renderer = @import("Renderer.zig").Renderer;
const console = @import("console.zig");

var renderer: Renderer = undefined;

export fn resize(width: usize, height: usize) void {
    console.fmtLog("resize {d}, {d}", .{ width, height }) catch {};
}

pub fn start(allocator: Allocator) !void {
    _ = allocator;
    renderer = Renderer.init();
    renderer.clear();
}
