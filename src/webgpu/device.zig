const std = @import("std");
const Allocator = std.mem.Allocator;

extern fn device() usize;

pub const GpuDevice = struct {
    id: usize,

    pub fn init(allocator: Allocator) !*GpuDevice {
        const result = try allocator.create(GpuDevice);
        result.id = device();
        return result;
    }
};
