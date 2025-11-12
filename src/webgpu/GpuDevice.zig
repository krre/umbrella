const webgpu = @import("../webgpu.zig");
const GpuCommandEncoder = webgpu.GpuCommandEncoder;
const Id = webgpu.Id;

extern fn device() Id;
extern fn deviceCreateCommandEncoder(deviceId: Id) Id;

pub const GpuDevice = struct {
    id: Id,

    pub fn init() GpuDevice {
        return GpuDevice{
            .id = device(),
        };
    }

    pub fn createCommandEncoder(self: GpuDevice) GpuCommandEncoder {
        return GpuCommandEncoder{
            .id = deviceCreateCommandEncoder(self.id),
        };
    }
};
