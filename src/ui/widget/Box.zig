const std = @import("std");
const Widget = @import("Widget.zig");
const Border = @import("Border.zig");
const Color = @import("angie3d").ui.Color;

const Box = @This();

color: Color = Color.white,
border: Border = .{},
widget: Widget,

const vtable = Widget.VTable{
    .draw = &draw,
};

pub fn init(allocator: std.mem.Allocator) Box {
    return Box{ .widget = Widget.init(allocator, &vtable) };
}

fn draw(widget: *Widget) void {
    _ = widget;
}
