const std = @import("std");
const app = @import("app.zig");

export fn start() void {
    const allocator = std.heap.wasm_allocator;
    if (app.start(allocator)) |_| {} else |_| {}
}
