const std = @import("std");
const Renderer = @import("Renderer.zig").Renderer;
const console = @import("console.zig");
const Allocator = std.mem.Allocator;

pub const Application = struct {
    allocator: Allocator,
    renderer: Renderer,

    pub fn init(allocator: Allocator) Application {
        return Application{
            .allocator = allocator,
            .renderer = Renderer.init(),
        };
    }

    pub fn start(self: *Application) !void {
        self.renderer.clear();
    }

    pub fn resize(self: *Application, width: usize, height: usize) void {
        _ = self;
        _ = width;
        _ = height;
    }

    pub fn mouseMove(self: *Application, x: i32, y: i32) void {
        _ = self;
        _ = x;
        _ = y;
    }

    pub fn mouseClick(self: *Application, x: i32, y: i32) void {
        _ = self;
        _ = x;
        _ = y;
    }

    pub fn mouseDoubleClick(self: *Application, x: i32, y: i32) void {
        _ = self;
        _ = x;
        _ = y;
    }

    pub fn mouseDown(self: *Application, x: i32, y: i32, button: u8) void {
        _ = self;
        _ = x;
        _ = y;
        _ = button;
    }

    pub fn mouseUp(self: *Application, x: i32, y: i32, button: u8) void {
        _ = self;
        _ = x;
        _ = y;
        _ = button;
    }

    pub fn mouseWheel(self: *Application, x: i32, y: i32, delta_y: i8) void {
        _ = self;
        _ = x;
        _ = y;
        _ = delta_y;
    }
};
