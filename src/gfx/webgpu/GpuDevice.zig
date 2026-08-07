const webgpu = @import("../webgpu.zig");
const GpuCommandEncoder = webgpu.GpuCommandEncoder;
const GpuQueue = webgpu.GpuQueue;
const angie3d = @import("angie3d");
const js = angie3d.js;
const Id = angie3d.types.Id;

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
