const std = @import("std");
const Allocator = std.mem.Allocator;

extern fn adapter() usize;

pub const GpuAdapter = struct {
    id: usize,

    pub fn init(allocator: Allocator) !*GpuAdapter {
        const result = try allocator.create(GpuAdapter);
        result.id = adapter();
        return result;
    }
};
