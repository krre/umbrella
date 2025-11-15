const GpuTexture = @import("GpuTexture.zig").GpuTexture;
const js = @import("../../js.zig");
const Id = @import("../../types.zig").Id;

pub const GpuCanvasContext = struct {
    id: Id,

    pub fn init() GpuCanvasContext {
        return GpuCanvasContext{
            .id = js.canvasContext(),
        };
    }

    pub fn getCurrentTexture(self: GpuCanvasContext) GpuTexture {
        return GpuTexture.init(js.canvasContextGetCurrentTexture(self.id));
    }
};
