const webgpu = @import("../webgpu.zig");
const Id = webgpu.Id;
const js = @import("../../js.zig");

const GpuTextureView = @This();

id: Id,

pub fn init(id: Id) GpuTextureView {
    return GpuTextureView{
        .id = id,
    };
}

pub fn deinit(self: GpuTextureView) void {
    js.remove(self.id);
}
