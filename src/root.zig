const std = @import("std");
const console = @import("console.zig");
const UI3D = @import("ui/UI3D.zig");

const js = @import("js.zig");
const ide = @import("ide/UmbrellaIDE.zig");

export fn start() void {
    console.log("UI initing begin");

    ide.init(std.heap.wasm_allocator);
    js.ui = &ide.ui;

    if (js.ui.start()) |_| {
        console.log("UI started");
    } else |_| {
        console.log("UI start failure");
    }
}
