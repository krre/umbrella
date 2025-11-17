const std = @import("std");
const Widget = @This();
const Node = @import("Node.zig");

node: Node,
vtable: *const VTable,
allocator: std.mem.Allocator,

pub const VTable = struct {
    draw: *const fn (self: *Widget) void,
};

pub fn init(allocator: std.mem.Allocator, vtable: *const VTable) Widget {
    return Widget{ .node = Node.init(), .vtable = vtable, .allocator = allocator };
}

pub fn asNode(self: *Widget) *Node {
    return &self.node;
}

pub fn draw(self: *Widget) void {
    self.vtable.draw(self);
}
