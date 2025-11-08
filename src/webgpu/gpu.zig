const std = @import("std");
const Allocator = std.mem.Allocator;

extern fn gpu() usize;

pub const Gpu = struct {
    id: usize,

    pub fn init(allocator: Allocator) !*Gpu {
        const result = try allocator.create(Gpu);
        result.id = gpu();
        return result;
    }
};
