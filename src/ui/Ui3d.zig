const Renderer = @import("../gfx/Renderer.zig");
const std = @import("std");
const Allocator = std.mem.Allocator;

const Ui3d = @This();

allocator: Allocator,
renderer: Renderer,

pub fn init(allocator: Allocator) Ui3d {
    return Ui3d{
        .allocator = allocator,
        .renderer = Renderer.init(),
    };
}

pub fn start(self: *Ui3d) !void {
    self.renderer.clear();
}

pub fn resize(self: *Ui3d, width: usize, height: usize) void {
    _ = self;
    _ = width;
    _ = height;
}

pub fn mouseMove(self: *Ui3d, x: i32, y: i32) void {
    _ = self;
    _ = x;
    _ = y;
}

pub fn mouseClick(self: *Ui3d, x: i32, y: i32) void {
    _ = self;
    _ = x;
    _ = y;
}

pub fn mouseDoubleClick(self: *Ui3d, x: i32, y: i32) void {
    _ = self;
    _ = x;
    _ = y;
}

pub fn mouseDown(self: *Ui3d, x: i32, y: i32, button: u8) void {
    _ = self;
    _ = x;
    _ = y;
    _ = button;
}

pub fn mouseUp(self: *Ui3d, x: i32, y: i32, button: u8) void {
    _ = self;
    _ = x;
    _ = y;
    _ = button;
}

pub fn mouseWheel(self: *Ui3d, x: i32, y: i32, delta_y: i8) void {
    _ = self;
    _ = x;
    _ = y;
    _ = delta_y;
}

pub fn keyDown(self: *Ui3d, code: u32) void {
    _ = self;
    _ = code;
}

pub fn keyUp(self: *Ui3d, code: u32) void {
    _ = self;
    _ = code;
}
