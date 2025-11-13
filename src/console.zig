const std = @import("std");
const Allocator = std.mem.Allocator;

extern fn consoleLog(message: [*]const u8, length: usize) void;

pub fn log(message: []const u8) void {
    consoleLog(message.ptr, message.len);
}

pub fn fmtLog(comptime fmt: []const u8, args: anytype) void {
    const allocator = std.heap.wasm_allocator;
    const str = std.fmt.allocPrint(allocator, fmt, args) catch "Allocator error";
    defer allocator.free(str);
    log(str);
}
