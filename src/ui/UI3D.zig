const std = @import("std");
const Allocator = std.mem.Allocator;
const Renderer = @import("../gfx/Renderer.zig");
const Widget = @import("Widget.zig");
const UmbrellaIDE = @import("../ide/UmbrellaIDE.zig");

const UI3D = @This();

allocator: Allocator,
renderer: Renderer,
ide: UmbrellaIDE,

pub fn init(allocator: Allocator) UI3D {
    return UI3D{ .allocator = allocator, .renderer = Renderer.init(), .ide = UmbrellaIDE.init(allocator) };
}

pub fn start(self: *UI3D) !void {
    self.render();
}

pub fn render(self: *UI3D) void {
    self.renderer.render(&self.ide.root);
}

pub fn resize(self: *UI3D, width: usize, height: usize) void {
    _ = width;
    _ = height;
    self.render();
}

pub fn mouseMove(self: *UI3D, x: i32, y: i32) void {
    _ = x;
    _ = y;
    self.render();
}

pub fn mouseClick(self: *UI3D, x: i32, y: i32) void {
    _ = x;
    _ = y;
    self.render();
}

pub fn mouseDoubleClick(self: *UI3D, x: i32, y: i32) void {
    _ = x;
    _ = y;
    self.render();
}

pub fn mouseDown(self: *UI3D, x: i32, y: i32, button: u8) void {
    _ = x;
    _ = y;
    _ = button;
    self.render();
}

pub fn mouseUp(self: *UI3D, x: i32, y: i32, button: u8) void {
    _ = x;
    _ = y;
    _ = button;
    self.render();
}

pub fn mouseWheel(self: *UI3D, x: i32, y: i32, delta_y: i8) void {
    _ = x;
    _ = y;
    _ = delta_y;
    self.render();
}

pub fn keyDown(self: *UI3D, code: u32) void {
    _ = code;
    self.render();
}

pub fn keyUp(self: *UI3D, code: u32) void {
    _ = code;
    self.render();
}
