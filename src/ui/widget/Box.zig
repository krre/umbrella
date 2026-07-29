const std = @import("std");
const Widget = @import("Widget.zig");
const Border = @import("Border.zig");
const Color = @import("../Color.zig");

const Box = @This();

color: Color = Color.white,
border: Border = .{},
widget: Widget,

pub fn init(allocator: std.mem.Allocator) Box {
    return Box{ .widget = Widget.init(allocator) };
}
