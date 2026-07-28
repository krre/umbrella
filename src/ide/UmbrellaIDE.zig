const std = @import("std");
const Allocator = std.mem.Allocator;
const Widget = @import("../ui/widget/Widget.zig");
const UI3D = @import("../ui/UI3D.zig");

const UmbrellaIDE = @This();

pub var ui: UI3D = undefined;
var root: Widget = undefined;

const vtable = Widget.VTable{
    .draw = &draw,
};

pub fn init(allocator: Allocator) void {
    root = Widget.init(allocator, &vtable);
    ui = UI3D.init(allocator, &root);
}

fn draw(self: *Widget) void {
    _ = self;
}
