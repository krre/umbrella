const webgpu = @import("../webgpu.zig");
const GpuCommandEncoder = webgpu.GpuCommandEncoder;
const GpuQueue = webgpu.GpuQueue;
const Id = webgpu.Id;
const js = @import("../../js.zig");

const GpuDevice = @This();

id: Id,

pub fn init() GpuDevice {
    return GpuDevice{
        .id = js.device(),
    };
}

pub fn createCommandEncoder(self: GpuDevice) GpuCommandEncoder {
    return GpuCommandEncoder{
        .id = js.deviceCreateCommandEncoder(self.id),
    };
}

pub fn queue(self: GpuDevice) GpuQueue {
    return GpuQueue.init(js.deviceQueue(self.id));
}
