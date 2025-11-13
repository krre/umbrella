const std = @import("std");
const console = @import("console.zig");
const Application = @import("Application.zig").Application;

export fn start() void {
    console.log("Application initing begin");

    const allocator = std.heap.wasm_allocator;
    var app = Application.init(allocator);

    if (app.start()) |_| {
        console.log("Application started");
    } else |_| {
        console.log("Application start failure");
    }
}
