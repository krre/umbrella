const std = @import("std");
const console = @import("console.zig");
const event = @import("event.zig");
const Ui3d = @import("ui/Ui3d.zig").Ui3d;

pub var ui: Ui3d = undefined;

export fn start() void {
    console.log("UI initing begin");

    const allocator = std.heap.wasm_allocator;
    ui = Ui3d.init(allocator);
    event.ui = &ui;

    if (ui.start()) |_| {
        console.log("UI started");
    } else |_| {
        console.log("UI start failure");
    }
}
