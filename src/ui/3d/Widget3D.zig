const std = @import("std");
const Widget = @import("../Widget.zig");
const Pos3D = @import("../3d.zig").Pos3D;
const Size3D = @import("../3d.zig").Size3D;

const Widget3D = @This();

pos: Pos3D,
size: Size3D,
widget: Widget,

const vtable = Widget.VTable{
    .draw = &draw,
};

pub fn init(allocator: std.mem.Allocator) Widget3D {
    return Widget3D{ .pos = Pos3D{ .x = 0, .y = 0, .z = 0 }, .size = Size3D{ .width = 0, .height = 0, .depth = 0 }, .widget = Widget.init(allocator, &vtable) };
}

pub fn asWidget(self: *Widget3D) *Widget {
    return &self.widget;
}

pub fn move(self: *Widget3D, pos: Pos3D) void {
    self.pos = pos;
}

pub fn resize(self: *Widget3D, size: Size3D) void {
    self.size = size;
}

fn draw(self: *Widget) void {
    _ = self;
}
