const std = @import("std");
const Allocator = std.mem.Allocator;
const Widget = @import("../ui/Widget.zig");

const UmbrellaIDE = @This();

root: Widget,

const vtable = Widget.VTable{
    .draw = &draw,
};

pub fn init(allocator: Allocator) UmbrellaIDE {
    return UmbrellaIDE{ .root = Widget.init(allocator, &vtable) };
}

fn draw(self: *Widget) void {
    _ = self;
}
