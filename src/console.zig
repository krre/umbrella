const std = @import("std");
const Allocator = std.mem.Allocator;

extern fn consoleLog(message: [*]const u8, length: usize) void;

pub fn log(message: []const u8) void {
    consoleLog(message.ptr, message.len);
}

pub fn fmtLog(comptime fmt: []const u8, args: anytype) Allocator.Error!void {
    const allocator = std.heap.wasm_allocator;
    const str = try std.fmt.allocPrint(allocator, fmt, args);
    defer allocator.free(str);
    log(str);
}
