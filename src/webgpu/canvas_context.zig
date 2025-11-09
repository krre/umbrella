const std = @import("std");
const Allocator = std.mem.Allocator;

extern fn canvas_context() usize;

pub const GpuCanvasContext = struct {
    id: usize,

    pub fn init(allocator: Allocator) !*GpuCanvasContext {
        const result = try allocator.create(GpuCanvasContext);
        result.id = canvas_context();
        return result;
    }
};
