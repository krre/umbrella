const std = @import("std");
const Renderer = @import("Renderer.zig").Renderer;
const console = @import("console.zig");
const Allocator = std.mem.Allocator;

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
};
