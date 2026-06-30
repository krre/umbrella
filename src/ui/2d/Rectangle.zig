const std = @import("std");
const Widget2D = @import("Widget2D.zig");
const Color = @import("../Color.zig");

const Rectangle = @This();

color: Color,
widget2D: Widget2D,

pub fn init(allocator: std.mem.Allocator) Rectangle {
    return Rectangle{ .color = Color{}, .widget2D = Widget2D.init(allocator) };
}
