const std = @import("std");
const Node = @import("../Node.zig");
const geometry = @import("../geometry.zig");
const Pos = geometry.Pos;
const Size = geometry.Size;

const Widget = @This();

node: Node,
pos: Pos,
size: Size,
vtable: *const VTable,
allocator: std.mem.Allocator,

pub const VTable = struct {
    draw: *const fn (self: *Widget) void,
};

pub fn init(allocator: std.mem.Allocator, vtable: *const VTable) Widget {
    return Widget{
        .node = Node.init(),
        .pos = .{ .x = 0, .y = 0, .z = 0 },
        .size = .{ .width = 0, .height = 0, .depth = 0 },
        .vtable = vtable,
        .allocator = allocator,
    };
}

pub fn asNode(self: *Widget) *Node {
    return &self.node;
}

pub fn move(self: *Widget, pos: Pos) void {
    self.pos = pos;
}

pub fn resize(self: *Widget, size: Size) void {
    self.size = size;
}

pub fn draw(self: *Widget) void {
    self.vtable.draw(self);
}
