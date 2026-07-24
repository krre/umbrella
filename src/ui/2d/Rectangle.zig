const std = @import("std");
const Widget2D = @import("Widget2D.zig");
const Color = @import("../Color.zig");
const Border = @import("../Border.zig");

const Rectangle = @This();

color: Color = Color.white,
border: Border,
widget2D: Widget2D,

pub fn init(allocator: std.mem.Allocator) Rectangle {
    return Rectangle{ .widget2D = Widget2D.init(allocator) };
}
