const std = @import("std");
const console = @import("console.zig");
const js = @import("js.zig");
const Ui3d = @import("ui/Ui3d.zig");

pub var ui: Ui3d = undefined;

export fn start() void {
    console.log("UI initing begin");

    const allocator = std.heap.wasm_allocator;
    ui = Ui3d.init(allocator);
    js.ui = &ui;

    if (ui.start()) |_| {
        console.log("UI started");
    } else |_| {
        console.log("UI start failure");
    }
}
