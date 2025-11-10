const std = @import("std");
const console = @import("console.zig");
const app = @import("app.zig");

export fn start() void {
    console.log("Application initing begin");

    const allocator = std.heap.wasm_allocator;

    if (app.start(allocator)) |_| {
        console.log("Application started");
    } else |_| {
        console.log("Application start failure");
    }
}
