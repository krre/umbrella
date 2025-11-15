const webgpu = @import("../webgpu.zig");
const GpuCommandBuffer = webgpu.GpuCommandBuffer;
const Id = webgpu.Id;
const js = @import("../../js.zig");

pub const GpuQueue = struct {
    id: Id,

    pub fn init(id: Id) GpuQueue {
        return GpuQueue{
            .id = id,
        };
    }

    pub fn deinit(self: GpuQueue) void {
        js.remove(self.id);
    }

    pub fn addCommandBuffer(self: GpuQueue, buffer: GpuCommandBuffer) void {
        js.queueAddCommandBuffer(self.id, buffer.id);
    }

    pub fn submit(self: GpuQueue) void {
        js.queueSubmit(self.id);
    }
};
