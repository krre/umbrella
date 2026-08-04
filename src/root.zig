const std = @import("std");
const console = @import("console.zig");
const js = @import("js.zig");
const Umbrella = @import("ide/Umbrella.zig");

export fn start() void {
    console.log("Application initing", .{});

    Umbrella.init(std.heap.wasm_allocator);
    js.app = &Umbrella.app;

    if (js.app.start()) |_| {
        console.log("Application started", .{});
    } else |_| {
        console.err("Application start failure", .{});
    }
}
