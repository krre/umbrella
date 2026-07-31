const std = @import("std");
const console = @import("console.zig");
const Application = @import("ui/Application.zig");

const js = @import("js.zig");
const ide = @import("ide/UmbrellaIDE.zig");

export fn start() void {
    console.log("UI initing begin");

    ide.init(std.heap.wasm_allocator);
    js.app = &ide.app;

    if (js.app.start()) |_| {
        console.log("UI started");
    } else |_| {
        console.log("UI start failure");
    }
}
