const std = @import("std");
const angie3d = @import("angie3d");
const Pos3D = angie3d.ui.Pos3D;
const Size3D = angie3d.ui.Size3D;
const Node = angie3d.ui.node.Node;

const Widget = @This();

node: Node,
pos: Pos3D = .{ .x = 0, .y = 0, .z = 0 },
size: Size3D = .{ .width = 0, .height = 0, .depth = 0 },
vtable: *const VTable,
allocator: std.mem.Allocator,

pub const VTable = struct {
    draw: *const fn (self: *Widget) void,
};

pub fn init(allocator: std.mem.Allocator, vtable: *const VTable) Widget {
    return Widget{
        .node = Node.init(),
        .vtable = vtable,
        .allocator = allocator,
    };
}

pub fn move(self: *Widget, pos: Pos3D) void {
    self.pos = pos;
}

pub fn resize(self: *Widget, size: Size3D) void {
    self.size = size;
}

pub fn draw(self: *Widget) void {
    self.vtable.draw(self);
}
