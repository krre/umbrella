const std = @import("std");
const angie3d = @import("angie3d");
const console = angie3d.console;
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
