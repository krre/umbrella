const webgpu = @import("../webgpu.zig");
const Id = webgpu.Id;
const js = @import("../../js.zig");

pub const GpuRenderPassEncoder = struct {
    id: Id,

    pub fn init(id: Id) GpuRenderPassEncoder {
        return GpuRenderPassEncoder{
            .id = id,
        };
    }

    pub fn deinit(self: GpuRenderPassEncoder) void {
        js.remove(self.id);
    }

    pub fn end(self: GpuRenderPassEncoder) void {
        js.renderPassEnd(self.id);
    }
};
