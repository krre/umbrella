const std = @import("std");
const Allocator = std.mem.Allocator;
const Box = @import("../ui/widget/Box.zig");
const Application = @import("../ui/Application.zig");

const Umbrella = @This();

pub var app: Application = undefined;
var root: Box = undefined;

pub fn init(allocator: Allocator) void {
    root = Box.init(allocator);
    app = Application.init(allocator, &root.widget);
    Application.setTitle("Umbrella");
}
