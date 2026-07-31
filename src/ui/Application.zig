const std = @import("std");
const Allocator = std.mem.Allocator;
const Renderer = @import("../gfx/Renderer.zig");
const Widget = @import("widget/Widget.zig");

const Application = @This();

allocator: Allocator,
renderer: Renderer,
root_widget: *Widget,

pub fn init(allocator: Allocator, root_widget: *Widget) Application {
    return Application{ .allocator = allocator, .renderer = Renderer.init(), .root_widget = root_widget };
}

pub fn start(self: *Application) !void {
    self.render();
}

pub fn render(self: *Application) void {
    self.renderer.render(self.root_widget);
}

pub fn resize(self: *Application, width: usize, height: usize) void {
    _ = width;
    _ = height;
    self.render();
}

pub fn mouseMove(self: *Application, x: i32, y: i32) void {
    _ = x;
    _ = y;
    self.render();
}

pub fn mouseClick(self: *Application, x: i32, y: i32) void {
    _ = x;
    _ = y;
    self.render();
}

pub fn mouseDoubleClick(self: *Application, x: i32, y: i32) void {
    _ = x;
    _ = y;
    self.render();
}

pub fn mouseDown(self: *Application, x: i32, y: i32, button: u8) void {
    _ = x;
    _ = y;
    _ = button;
    self.render();
}

pub fn mouseUp(self: *Application, x: i32, y: i32, button: u8) void {
    _ = x;
    _ = y;
    _ = button;
    self.render();
}

pub fn mouseWheel(self: *Application, x: i32, y: i32, delta_y: i8) void {
    _ = x;
    _ = y;
    _ = delta_y;
    self.render();
}

pub fn keyDown(self: *Application, code: u32) void {
    _ = code;
    self.render();
}

pub fn keyUp(self: *Application, code: u32) void {
    _ = code;
    self.render();
}
