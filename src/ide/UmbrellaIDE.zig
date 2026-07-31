const std = @import("std");
const Allocator = std.mem.Allocator;
const Box = @import("../ui/widget/Box.zig");
const UI3D = @import("../ui/UI3D.zig");

const UmbrellaIDE = @This();

pub var ui: UI3D = undefined;
var root: Box = undefined;

pub fn init(allocator: Allocator) void {
    root = Box.init(allocator);
    ui = UI3D.init(allocator, &root.widget);
}
