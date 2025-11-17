const Renderer = @import("../gfx/Renderer.zig");
const std = @import("std");
const Allocator = std.mem.Allocator;

const UI3D = @This();

allocator: Allocator,
renderer: Renderer,

pub fn init(allocator: Allocator) UI3D {
    return UI3D{
        .allocator = allocator,
        .renderer = Renderer.init(),
    };
}

pub fn start(self: *UI3D) !void {
    self.renderer.clear();
}

pub fn resize(self: *UI3D, width: usize, height: usize) void {
    _ = self;
    _ = width;
    _ = height;
}

pub fn mouseMove(self: *UI3D, x: i32, y: i32) void {
    _ = self;
    _ = x;
    _ = y;
}

pub fn mouseClick(self: *UI3D, x: i32, y: i32) void {
    _ = self;
    _ = x;
    _ = y;
}

pub fn mouseDoubleClick(self: *UI3D, x: i32, y: i32) void {
    _ = self;
    _ = x;
    _ = y;
}

pub fn mouseDown(self: *UI3D, x: i32, y: i32, button: u8) void {
    _ = self;
    _ = x;
    _ = y;
    _ = button;
}

pub fn mouseUp(self: *UI3D, x: i32, y: i32, button: u8) void {
    _ = self;
    _ = x;
    _ = y;
    _ = button;
}

pub fn mouseWheel(self: *UI3D, x: i32, y: i32, delta_y: i8) void {
    _ = self;
    _ = x;
    _ = y;
    _ = delta_y;
}

pub fn keyDown(self: *UI3D, code: u32) void {
    _ = self;
    _ = code;
}

pub fn keyUp(self: *UI3D, code: u32) void {
    _ = self;
    _ = code;
}
