const GpuTexture = @import("GpuTexture.zig").GpuTexture;
const Id = @import("../types.zig").Id;

extern fn canvasContext() Id;
extern fn canvasContextGetCurrentTexture(id: Id) Id;

pub const GpuCanvasContext = struct {
    id: Id,

    pub fn init() GpuCanvasContext {
        return GpuCanvasContext{
            .id = canvasContext(),
        };
    }

    pub fn getCurrentTexture(self: GpuCanvasContext) GpuTexture {
        return GpuTexture.init(canvasContextGetCurrentTexture(self.id));
    }
};
