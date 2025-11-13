const webgpu = @import("../webgpu.zig");
const GpuCommandBuffer = webgpu.GpuCommandBuffer;
const Id = webgpu.Id;

extern fn queueAddCommandBuffer(id: Id, command_buffer_id: Id) void;
extern fn queueSubmit(id: Id) void;

pub const GpuQueue = struct {
    id: Id,

    pub fn init(id: Id) GpuQueue {
        return GpuQueue{
            .id = id,
        };
    }

    pub fn deinit(self: GpuQueue) void {
        webgpu.remove(self.id);
    }

    pub fn addCommandBuffer(self: GpuQueue, buffer: GpuCommandBuffer) void {
        queueAddCommandBuffer(self.id, buffer.id);
    }

    pub fn submit(self: GpuQueue) void {
        queueSubmit(self.id);
    }
};
