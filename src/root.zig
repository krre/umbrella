const std = @import("std");
const angie3d = @import("angie3d");
const console = angie3d.console;
const js = angie3d.js;
const Umbrella = @import("ide/Umbrella.zig");

export fn start() void {
    console.log("Application starting", .{});

    Umbrella.init(std.heap.wasm_allocator);
    js.event_handler = Umbrella.app.eventHandler();
    Umbrella.app.render();

    console.log("Application started", .{});
}
