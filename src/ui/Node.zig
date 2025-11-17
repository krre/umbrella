const std = @import("std");
const Node = @This();

parent: ?*Node,
children: std.ArrayList(*Node),

pub fn init(allocator: std.mem.Allocator) Node {
    return Node{
        .parent = null,
        .children = std.ArrayList(*Node).init(allocator),
    };
}

pub fn deinit(self: *Node) void {
    for (self.children.items) |child| {
        child.deinit();
    }

    self.children.deinit();
}

pub fn addChild(self: *Node, child: *Node) !void {
    child.parent = self;
    try self.children.append(child);
}
