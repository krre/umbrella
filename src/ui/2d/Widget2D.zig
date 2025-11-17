const std = @import("std");
const Widget = @import("../Widget.zig");
const Pos2D = @import("../2d.zig").Pos2D;
const Size2D = @import("../2d.zig").Size2D;

const Widget2D = @This();

pos: Pos2D,
size: Size2D,
widget: Widget,

const vtable = Widget.VTable{
    .draw = &draw,
};

pub fn init(allocator: std.mem.Allocator) Widget2D {
    return Widget2D{ .pos = Pos2D{ .x = 0, .y = 0 }, .size = Size2D{ .width = 0, .height = 0 }, .widget = Widget.init(allocator, &vtable) };
}

pub fn asWidget(self: *Widget2D) *Widget {
    return &self.widget;
}

pub fn move(self: *Widget2D, pos: Pos2D) void {
    self.pos = pos;
}

pub fn resize(self: *Widget2D, size: Size2D) void {
    self.size = size;
}

fn draw(self: *Widget) void {
    _ = self;
}
