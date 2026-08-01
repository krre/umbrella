const std = @import("std");
const Allocator = std.mem.Allocator;
const Renderer = @import("../gfx/Renderer.zig");
const Widget = @import("widget/Widget.zig");
const geometry = @import("geometry.zig");
const Pos2D = geometry.Pos2D;
const Size2D = geometry.Size2D;

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

pub fn resize(self: *Application, size: Size2D) void {
    _ = size;
    self.render();
}

pub fn mouseMove(self: *Application, pos: Pos2D) void {
    _ = pos;
    self.render();
}

pub fn mouseClick(self: *Application, pos: Pos2D) void {
    _ = pos;
    self.render();
}

pub fn mouseDoubleClick(self: *Application, pos: Pos2D) void {
    _ = pos;
    self.render();
}

pub fn mouseDown(self: *Application, pos: Pos2D, button: u8) void {
    _ = pos;
    _ = button;
    self.render();
}

pub fn mouseUp(self: *Application, pos: Pos2D, button: u8) void {
    _ = pos;
    _ = button;
    self.render();
}

pub fn mouseWheel(self: *Application, pos: Pos2D, delta_y: i8) void {
    _ = pos;
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
