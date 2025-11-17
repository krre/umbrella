const std = @import("std");
const console = @import("console.zig");
const js = @import("js.zig");
const UI3D = @import("ui/UI3D.zig");

pub var ui: UI3D = undefined;

export fn start() void {
    console.log("UI initing begin");

    const allocator = std.heap.wasm_allocator;
    ui = UI3D.init(allocator);
    js.ui = &ui;

    if (ui.start()) |_| {
        console.log("UI started");
    } else |_| {
        console.log("UI start failure");
    }
}
