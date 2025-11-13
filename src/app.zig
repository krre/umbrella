const std = @import("std");
const Allocator = std.mem.Allocator;
const Renderer = @import("Renderer.zig").Renderer;
const console = @import("console.zig");

var renderer: Renderer = undefined;

export fn resize(width: usize, height: usize) void {
    console.fmtLog("resize {d}, {d}", .{ width, height }) catch {};
}

export fn mouseMove(x: i32, y: i32) void {
    _ = x;
    _ = y;
}

export fn mouseClick(x: i32, y: i32) void {
    _ = x;
    _ = y;
}

export fn mouseDoubleClick(x: i32, y: i32) void {
    _ = x;
    _ = y;
}

export fn mouseDown(x: i32, y: i32, button: u8) void {
    _ = x;
    _ = y;
    _ = button;
}

export fn mouseUp(x: i32, y: i32, button: u8) void {
    _ = x;
    _ = y;
    _ = button;
}

export fn mouseWheel(x: i32, y: i32, delta_y: i8) void {
    _ = x;
    _ = y;
    _ = delta_y;
}

pub fn start(allocator: Allocator) !void {
    _ = allocator;
    renderer = Renderer.init();
    renderer.clear();
}
