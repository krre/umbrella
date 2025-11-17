const std = @import("std");
const Widget = @This();
const Node = @import("Node.zig");

node: Node,
vtable: *const VTable,

pub const VTable = struct {
    draw: *const fn (self: *Widget) void,
};

pub fn init(allocator: std.mem.Allocator, vtable: *const VTable) Widget {
    return Widget{ .node = Node.init(allocator), .vtable = vtable };
}

pub fn asNode(self: *Widget) *Node {
    return &self.node;
}

pub fn draw(self: *Widget) void {
    self.vtable.draw(self);
}
